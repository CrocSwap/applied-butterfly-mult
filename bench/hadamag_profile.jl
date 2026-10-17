# Profile the pinned upstream HadaMAG implementation without changing its arithmetic.
using HadaMAG, Random, LinearAlgebra, JSON3, Profile, SHA
BLAS.set_num_threads(1)
@assert Threads.nthreads()==1
const DEST=abspath("results/application-survey")
const ORIGINAL=HadaMAG._fht_fn[]
const FHT_NS=Ref(UInt64(0))
const FHT_CALLS=Ref(0)
function traced_fht!(x,L)
    t=time_ns()
    ORIGINAL(x,L)
    FHT_NS[]+=time_ns()-t
    FHT_CALLS[]+=1
    nothing
end
function install_trace(on)
    HadaMAG._fht_fn[]=on ? traced_fht! : ORIGINAL
    FHT_NS[]=0;FHT_CALLS[]=0
end
function calculate(psi,c)
    c.kind=="exact" ? SRE(psi,2;backend=:serial,progress=false) :
        MC_SRE(psi,2;backend=:serial,progress=false,Nβ=13,Nsamples=256,seed=810021)
end
function direct_sre(x)
    n=length(x);s2=0.;s4=0.
    for k=0:n-1,a=0:n-1
        z=zero(ComplexF64)
        for b=0:n-1
            z+=(isodd(count_ones(a&b)) ? -1 : 1)*conj(x[(b⊻k)+1])*x[b+1]
        end
        s2+=abs2(z);s4+=abs2(z)^2
    end
    (-log2(s4/n),abs(1-s2/n))
end
function savejson(path,x)
    open(path,"w") do io;JSON3.pretty(io,x);println(io);end
end
function prepare()
    checks=[]
    for n=2:5,d in (0,2)
        psi=rand_haar(n;depth=d,rng=MersenneTwister(810020+n+d))
        a=SRE(psi,2;backend=:serial,progress=false);b=direct_sre(data(psi))
        @assert isapprox(a[1],b[1];atol=1e-11,rtol=1e-11)
        @assert max(a[2],b[2])<1e-11
        install_trace(true);v=SRE(psi,2;backend=:serial,progress=false)
        @assert v==a && FHT_CALLS[]==1<<n
        push!(checks,(n=n,depth=d,upstream=a,direct=b,trace_equal=true))
        install_trace(false)
    end
    cs=[]
    for kind in ("exact","mc"), n in (kind=="exact" ? (10,12,14) : (16,)),depth in (2,8)
        seed=810100+n+depth
        psi=rand_haar(n;depth=depth,rng=MersenneTwister(seed))
        id="$kind-$n-$depth";path=joinpath(DEST,id*".complex64")
        open(path,"w") do io;write(io,data(psi));end
        push!(cs,(id=id,kind=kind,n=n,depth=depth,seed=seed,state_path=path,state_sha256=bytes2hex(sha256(read(path)))))
    end
    savejson(joinpath(DEST,"validation.json"),(status="PASS",checks=checks))
    savejson(joinpath(DEST,"cases.json"),cs)
    savejson(joinpath(DEST,"runtime.json"),(julia=string(VERSION),machine=Sys.MACHINE,cpu=Sys.CPU_NAME,threads=Threads.nthreads(),blas_threads=BLAS.get_num_threads(),fht_backend=string(HadaMAG.fht_backend())))
    println("Validated eight direct Pauli sums and prepared eight workload inputs.")
end
function timed(psi,c,on)
    install_trace(on)
    # macOS clock() reports process CPU time in microseconds.
    c0=ccall(:clock,Int64,());t=time_ns()
    answer=calculate(psi,c)
    wall=time_ns()-t;cpu=(ccall(:clock,Int64,())-c0)*1000
    (wall_ns=wall,cpu_ns=cpu,answer=answer,fht_ns=FHT_NS[],fht_calls=FHT_CALLS[])
end
function sampled(psi,c)
    install_trace(false);Profile.clear();Profile.init(n=10^7,delay=0.001)
    t=time_ns();calls=0
    Profile.@profile while time_ns()-t<1_500_000_000
        calculate(psi,c);calls+=1
    end
    raw=Profile.fetch(include_meta=false);dict=Profile.getdict(raw)
    total=0;fht=0;blend=0;moment=0;other=0;frames=String[]
    for ip in raw
        if ip==0
            if !isempty(frames)
                total+=1
                if any(s->occursin("_fht_julia!",s),frames);fht+=1
                elseif any(s->occursin("flip_and_update_mask!",s)||occursin("blend_mask!",s),frames);blend+=1
                elseif any(s->occursin("kahan_accumulate",s)||occursin("compute_moments",s),frames);moment+=1
                else;other+=1;end
                empty!(frames)
            end
        else
            for frame in get(dict,ip,[]);push!(frames,string(frame.func));end
        end
    end
    open(joinpath(DEST,c.id*"-profile.txt"),"w") do io
        Profile.print(io;format=:flat,sortedby=:count,mincount=3,C=true)
    end
    (samples=total,fht_samples=fht,blend_samples=blend,moment_samples=moment,other_samples=other,calls=calls,
     fht_fraction=total>0 ? fht/total : nothing)
end
function measure()
    cases=JSON3.read(read(joinpath(DEST,"cases.json"),String))
    @assert !isfile(joinpath(DEST,"profile-raw.jsonl"))
    open(joinpath(DEST,"profile-raw.jsonl"),"w") do io
        for c in cases
            bytes=read(c.state_path);@assert bytes2hex(sha256(bytes))==c.state_sha256
            psi=StateVec(copy(reinterpret(ComplexF64,bytes));q=2)
            install_trace(false);reference=calculate(psi,c)
            install_trace(true);@assert calculate(psi,c)==reference
            expected=c.kind=="exact" ? 1<<c.n : 13*(256+1)
            @assert FHT_CALLS[]==expected
            # Discard both warmups, then alternate which variant runs first.
            rows=[]
            for trial=0:4,step=0:3
                on=xor(step in (1,2),isodd(trial));r=timed(psi,c,on)
                @assert r.answer==reference
                @assert r.fht_calls==(on ? expected : 0)
                push!(rows,merge((trial=trial,step=step,instrumented=on),r))
            end
            install_trace(false)
            allocated=@allocated calculate(psi,c)
            sample=sampled(psi,c)
            JSON3.write(io,(case=c,answer=reference,allocated_bytes=allocated,rows=rows,sampling=sample));println(io);flush(io)
            println("Profiled ",c.id,"; sample FHT fraction ",sample.fht_fraction);flush(stdout)
        end
    end
end
ARGS[1]=="prepare" ? prepare() : measure()
