# Bounded Float64 experiment on immutable states from application-survey.
using HadaMAG, Random, LinearAlgebra, JSON3, SHA, Libdl
BLAS.set_num_threads(1)
@assert Threads.nthreads()==1
const DEST=abspath("results/hadamag-native")
const ORIGINAL=HadaMAG._fht_fn[]
const LIB=Libdl.dlopen(joinpath(DEST,"libhadamag-native.dylib"))
function native(name)
    p=Libdl.dlsym(LIB,Symbol("hn_"*name))
    (x,l)->ccall(p,Cvoid,(Ptr{Cdouble},Cint),x,l)
end
const FUNCS=Dict{String,Function}("julia"=>ORIGINAL)
for name in ("iter","r2","r4","r8","i4","i8","h4","h8","h4i","h8i");FUNCS[name]=native(name);end
savejson(path,x)=open(io->(JSON3.pretty(io,x);println(io)),path,"w")
function calculate(psi,c)
    c.kind=="exact" ? SRE(psi,2;backend=:serial,progress=false) :
        MC_SRE(psi,2;backend=:serial,progress=false,Nβ=13,Nsamples=256,seed=810021)
end
function capture()
    cs=JSON3.read(read("results/application-survey/cases.json",String));out=[]
    for c in cs
        bytes=read(c.state_path);@assert bytes2hex(sha256(bytes))==c.state_sha256
        psi=StateVec(copy(reinterpret(ComplexF64,bytes));q=2)
        total=c.kind=="exact" ? 1<<c.n : 13*257
        wanted=round.(Int,range(1,total,length=8));cnt=Ref(0);snap=Vector{Float64}[]
        HadaMAG._fht_fn[]=(x,l)->begin
            cnt[]+=1
            cnt[] in wanted && push!(snap,copy(x))
            ORIGINAL(x,l)
        end
        answer=calculate(psi,c);@assert cnt[]==total && length(snap)==8
        HadaMAG._fht_fn[]=ORIGINAL;@assert calculate(psi,c)==answer
        path=joinpath(DEST,c.id*".f64")
        open(path,"w") do io;foreach(x->write(io,x),snap);end
        push!(out,(id=c.id,n=c.n,path=path,sha256=bytes2hex(sha256(read(path))),ordinals=wanted,
            total_calls=total,answer=answer,source=c))
        println("Captured ",c.id);flush(stdout)
    end
    savejson(joinpath(DEST,"captures.json"),out)
end
function wht_reference!(x)
    h=1
    while h<length(x)
        for b=1:2h:length(x),j=b:b+h-1
            a=x[j];z=x[j+h];x[j]=a+z;x[j+h]=a-z
        end
        h*=2
    end
    x
end
function inputs(c)
    bytes=read(c.path);@assert bytes2hex(sha256(bytes))==c.sha256
    flat=reinterpret(Float64,bytes);n=1<<c.n
    [copy(flat[i:i+n-1]) for i=1:n:length(flat)]
end
function validate()
    checks=0;rng=MersenneTwister(78019)
    # Direct independent Walsh characters on every small basis vector.
    for l=0:6,b=0:(1<<l)-1
        x=zeros(1<<l);x[b+1]=1
        expected=[isodd(count_ones(a&b)) ? -1. : 1. for a=0:length(x)-1]
        for f in values(FUNCS);y=copy(x);f(y,Int32(l));@assert y==expected;checks+=1;end
    end
    # Exact dyadic vectors, including all remainder classes and scale levels.
    for l=0:16
        x=Float64.(rand(rng,-16:16,1<<l))./8;ref=wht_reference!(copy(x))
        for f in values(FUNCS);y=copy(x);f(y,Int32(l));@assert y==ref;checks+=1;end
    end
    rows=[]
    setprecision(BigFloat,256) do
        for c in JSON3.read(read(joinpath(DEST,"captures.json"),String))
            for (i,x) in enumerate(inputs(c))
                ref=wht_reference!(BigFloat.(x));scale=sum(abs,BigFloat.(x))
                for (name,f) in sort(collect(FUNCS),by=first)
                    y=copy(x);f(y,Int32(c.n));@assert all(isfinite,y)
                    err=maximum(abs(BigFloat(y[j])-ref[j]) for j in eachindex(y))
                    bound=eps(Float64)*c.n*scale
                    ratio=iszero(bound) ? Float64(err) : Float64(err/bound)
                    @assert ratio<=64
                    push!(rows,(case=c.id,ordinal=c.ordinals[i],engine=name,max_absolute_error=Float64(err),
                        error_over_eps_l_l1=ratio))
                end
            end
            println("Validated ",c.id);flush(stdout);GC.gc()
        end
    end
    savejson(joinpath(DEST,"validation.json"),(status="PASS",exact_checks=checks,
        oracle="256-bit BigFloat radix2; independent direct Walsh basis signs for l<=6",
        acceptance="finite outputs and max absolute error <= 64*eps(Float64)*log2(N)*sum(abs(input)); no relative guarantee near zero",
        rows=rows))
end
function batch(f::F,xs,y,l,reps) where F
    # Recopy genuine input before each transform. Never repeatedly transform output.
    for r=1:reps,x in xs;copyto!(y,x);f(y,l);end
    nothing
end
function timed(f,xs,y,l,reps)
    c0=ccall(:clock,Int64,());t=time_ns();batch(f,xs,y,l,reps)
    w=time_ns()-t;c=(ccall(:clock,Int64,())-c0)*1000
    (ns_per_op=w/(reps*length(xs)),cpu_ns_per_op=c/(reps*length(xs)))
end
function measure(planfile,rawfile)
    plan=JSON3.read(read(planfile,String));cs=JSON3.read(read(joinpath(DEST,"captures.json"),String))
    @assert !isfile(rawfile)
    open(rawfile,"w") do io
        for job in plan.jobs
            c=only(filter(c->c.id==job.case,cs));xs=inputs(c);y=similar(xs[1]);l=Int32(c.n)
            fs=[FUNCS[job.baseline],FUNCS[job.candidate]]
            for f in fs
                batch(f,xs,y,l,1);t=time_ns()
                while time_ns()-t<100_000_000;batch(f,xs,y,l,2);end
            end
            t1=timed(fs[1],xs,y,l,4);t2=timed(fs[2],xs,y,l,4)
            reps=max(1,ceil(Int,plan.batch_ms*1e6/(min(t1.ns_per_op,t2.ns_per_op)*length(xs))))
            GC.gc();GC.enable(false)
            try
                for trial=0:plan.quartets-1,step=0:3
                    e=Int(xor(step in (1,2),isodd(trial)));r=timed(fs[e+1],xs,y,l,reps)
                    JSON3.write(io,merge((case=c.id,baseline=job.baseline,candidate=job.candidate,
                        trial=trial,step=step,engine=e,reps=reps),r));println(io)
                end
            finally;GC.enable(true);end
            flush(io);println("Measured ",c.id," ",job.baseline," -> ",job.candidate);flush(stdout)
        end
    end
end
if ARGS[1]=="capture";capture()
elseif ARGS[1]=="validate";validate()
elseif ARGS[1]=="measure";measure(ARGS[2],ARGS[3])
else;error("unknown mode")
end
