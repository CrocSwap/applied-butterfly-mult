#!/usr/bin/env python3
"""Predeclared hard-instance screen, retaining all earlier evidence.

Run prepare with the existing NetworkX qualification venv, then measure alone.
Static circuit preparation is measured separately; per-graph preparation and
any failed search plus exact fallback are charged in every solve.
"""
import argparse
import hashlib
import itertools
import json
from pathlib import Path
import random
import subprocess
import time

from screen_theory_transfer import ROOT, SISTER, PairedExclusionCircuit, SergeevPairCircuit
from check_theory_paths_control import SeparateWeightsCircuit
from benchmark_theory_paths import plan as export_plan
from compare import summarize

FAMILIES = ('independent','reciprocal','two_cycle','three_cycle','four_cluster','quantized')
SEEDS = (4300051,5900087,6700099)
ENGINES = {0:'paired_aa',1:'separate_weights',2:'sergeev',3:'failure_tree',
           4:'bnb_walk',5:'bnb_nonbacktracking',6:'sparse_enumeration'}
DATA = ROOT/'results/theory-paths-hard/data'


def sha(p): return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def save(p,v): p.write_text(json.dumps(v,indent=2)+'\n')


def frozen_hashes():
    old=json.loads((ROOT/'results/bulk-exclusion-screen/checks.json').read_text())
    frozen={**old['frozen_sha256'],**old['sha256']}
    for name in ('results/bulk-exclusion-screen/completion.json',
                 'results/phase-fusion-screen/completion.json',
                 'results/phase-fusion-screen/summary.json','results/phase-fusion-screen/barriers.json'):
        p=ROOT/name; frozen[str(p)]=sha(p)
        frozen.update(json.loads(p.read_text())['sha256'])
    for p,h in frozen.items(): assert sha(ROOT/p)==h,p
    return frozen


def synthetic(N,family,seed):
    rng=random.Random(seed)
    w=[[None if a==b else rng.randrange(-1000,1001) for b in range(N)] for a in range(N)]
    if family=='reciprocal':
        for a in range(N):
            for b in range(a+1,N): w[b][a]=w[a][b]
    elif family=='two_cycle': w[1][2]+=10000;w[2][1]+=10000
    elif family=='three_cycle':
        for a,b in ((1,2),(2,3),(3,1)): w[a][b]+=10000
    elif family=='four_cluster':
        for a in range(1,5):
            for b in range(1,5):
                if a!=b: w[a][b]+=10000
    elif family=='quantized':
        w=[[None if a==b else rng.randrange(-2,3) for b in range(N)] for a in range(N)]
    else: assert family=='independent'
    return w


def write_graph(path,w):
    path.write_text(str(len(w))+'\n'+''.join(
        f'{int(x is not None)} {0 if x is None else x}\n' for row in w for x in row))


def read_graph(path):
    tokens=path.read_text().split();N=int(tokens[0]);it=iter(tokens[1:])
    values=[int(v) if int(p) else None for p,v in zip(it,it)]
    assert len(values)==N*N
    return [values[i*N:(i+1)*N] for i in range(N)]


def oracle(w):
    import networkx as nx
    N=len(w);g=nx.DiGraph();g.add_nodes_from(range(N))
    for a in range(N):
        for b in range(N):
            if w[a][b] is not None:g.add_edge(a,b)
    best=-(1<<61);count=paths=0
    for path in nx.all_simple_paths(g,0,N-1,cutoff=6):
        if len(path)!=7:continue
        paths+=1;score=sum(w[a][b] for a,b in zip(path,path[1:]))
        if score>best:best=score;count=0
        if score==best:count+=1
    return dict(weight=best,count=count,enumerated_paths=paths)


def command(dest,case,engine,trials,ms=2):
    n=case['vertices']-3
    return [str(dest/'theory-paths-hard'),
            *[str(dest/f'{name}-{n}.bin') for name in ('paired','separate_weights','sergeev')],
            str(dest/'graphs'/f"{case['id']}.txt"),str(engine),str(trials),str(ms),
            str(int(case['vertices']<=11 or case['family']=='public_wnt'))]


def prepare(dest):
    import networkx as nx
    dest.mkdir(parents=True,exist_ok=False);(dest/'graphs').mkdir()
    frozen=frozen_hashes()
    manifest=json.loads((DATA/'manifest.json').read_text())
    for row in manifest['files']:assert sha(ROOT/row['file'])==row['sha256']
    folder=DATA/'data/Wnt'
    edges=[tuple(line.split()) for line in (folder/'uniqueWnt-pathlinker-net.txt').read_text().splitlines()
           if line and not line.startswith('#')]
    assert len(edges)==len(set(edges))==428
    nodes=sorted({v for e in edges for v in e});assert len(nodes)==106
    sources=sorted((folder/'Wnt-sources.txt').read_text().split())
    targets=sorted((folder/'Wnt-targets.txt').read_text().split())
    assert len(sources)==len(targets)==14 and set(sources+targets)<=set(nodes)
    pairs=list(itertools.product(sources,targets))[::17];assert len(pairs)==12
    cases=[dict(id=f'{family}-{N}-{seed}',family=family,vertices=N,seed=seed)
           for family in FAMILIES for N in (19,27) for seed in SEEDS]
    cases += [dict(id=f'wnt-{i:02}',family='public_wnt',vertices=106,source=s,target=t)
              for i,(s,t) in enumerate(pairs)]
    validations=[dict(id=f'validate-{family}-{N}-{seed}',family=family,vertices=N,seed=seed)
                 for family in FAMILIES for N in (7,8,9) for seed in SEEDS[:2]]
    schedule=[dict(case=c['id'],engine=e) for c in cases
              for e in range(1,7 if c['family']=='public_wnt' else 6)]
    schedule += [dict(case=c['id'],engine=0) for c in cases
                 if (c.get('vertices')==19 and c.get('seed')==SEEDS[0]) or c['id']=='wnt-00']
    random.Random(4900199).shuffle(schedule)
    # This plan is saved before graph answers, compilation or timing.
    save(dest/'plan.json',dict(cases=cases,validations=validations,schedule=schedule,
        families=list(FAMILIES),seeds=SEEDS,quartets=15,batch_ms=2,warmup_ms=20,
        real_selection='Whole published 106-node graph, sorted source x target product, every 17th pair starting at index zero',
        real_weights='Unweighted input: every present arc has weight zero. Exact six-edge path census; no probability rounding.',
        application_limit='This fixed-length count query is not the PathLinker top-k workflow or a demonstrated biological use of the counts.',
        synthetic_scope='Mechanistic stress tests, not empirical models of biological networks. Cycle and cluster arcs receive +10000.',
        count_bound='N<=106 gives at most 104*103*102*101*100 six-edge paths per query; uint64 is sufficient.',
        costs='Every solve includes half-path preparation or bound/adjacency construction and failed search plus fallback. Static circuit generation/loading excluded from warm solve, reported separately.',
        confirmation_rule='Only families beating both search controls and failure tree on all three seeds at a size, with CPU+wall lower intervals positive, qualify for held-out confirmation.',
        confirmation_seeds=[7300109,8300143,9700153],confirmation_quartets=31,
        no_application_claim_without_complete_contract=True))
    for c in cases+validations:
        if c['family']=='public_wnt':
            order=[c['source']]+[v for v in nodes if v not in (c['source'],c['target'])]+[c['target']]
            index={v:i for i,v in enumerate(order)}
            w=[[None]*len(nodes) for _ in nodes]
            for a,b in edges:w[index[a]][index[b]]=0
            save(dest/'graphs'/f"{c['id']}-labels.json",order)
        else:w=synthetic(c['vertices'],c['family'],c['seed'])
        write_graph(dest/'graphs'/f"{c['id']}.txt",w)
    preparations=[]
    for n in sorted({c['vertices']-3 for c in cases+validations}):
        for name,cls in [('paired',PairedExclusionCircuit),('separate_weights',SeparateWeightsCircuit),('sergeev',SergeevPairCircuit)]:
            start=time.perf_counter();circuit=cls(n);built=time.perf_counter()-start
            verified=circuit.verify();start=time.perf_counter()
            export_plan(circuit,dest/f'{name}-{n}.bin');export=time.perf_counter()-start
            preparations.append(dict(n=n,name=name,construction_seconds=built,export_seconds=export,verified=verified))
            print('prepared',n,name,round(built,3),flush=True)
    oldsource=(ROOT/'bench/theory_paths_bnb.c').read_text()
    assert oldsource.count('int main(')==1 and oldsource.count('search(&s,0,6,0);')==1
    traced=oldsource.replace('int main(','int hard_frozen_main(').replace(
        'search(&s,0,6,0);','search(&s,0,6,0);\n    hard_stats=(HardStats){s.visits,s.exhausted};')
    (dest/'bnb-frozen.inc').write_text(traced)
    cmd=['clang','-std=gnu23','-O3','-g','-mcpu=apple-m2','-I'+str(dest),
         '-I'+str(ROOT/'bench'),str(ROOT/'bench/theory_paths_hard.c'),'-o',str(dest/'theory-paths-hard')]
    run=subprocess.run(cmd,capture_output=True,text=True);(dest/'compile.log').write_text(run.stdout+run.stderr);run.check_returncode()
    checks=[]
    for c in validations+cases:
        result=subprocess.run(command(dest,c,0,0),check=True,capture_output=True,text=True,timeout=60)
        engines=[json.loads(line) for line in result.stdout.splitlines()]
        r=dict(case=c['id'],engines=engines)
        if c in validations or c['family']=='public_wnt':
            r['oracle']=oracle(read_graph(dest/'graphs'/f"{c['id']}.txt"))
            assert all((e['weight'],e['count'])==(r['oracle']['weight'],r['oracle']['count']) for e in engines)
        checks.append(r)
        print('checked',c['id'],engines[0]['count'],[(e['engine'],e['visits'],e['fallback']) for e in engines if e['engine']>=4],flush=True)
    files=[Path(__file__).resolve(),ROOT/'bench/theory_paths_hard.c',ROOT/'bench/theory_paths_bnb.c',
           ROOT/'bench/theory_paths_control.c',ROOT/'scripts/compare.py',ROOT/'scripts/screen_theory_transfer.py',
           ROOT/'scripts/check_theory_paths_control.py',ROOT/'scripts/benchmark_theory_paths.py',
           SISTER/'scripts/paired_exclusion_circuit.py',SISTER/'scripts/exclusion_circuit.py',
           DATA/'manifest.json',*dest.glob('*.bin'),*dest.glob('graphs/*'),dest/'plan.json',
           dest/'bnb-frozen.inc',dest/'theory-paths-hard',dest/'compile.log']
    for p,h in frozen.items():assert sha(ROOT/p)==h,p
    save(dest/'validation.json',dict(status='PASS',networkx_version=nx.__version__,checks=checks,
        circuit_preparation=preparations,compile_command=cmd,frozen_sha256=frozen,
        sha256={str(p):sha(p) for p in files}))


def measure(dest):
    validation=json.loads((dest/'validation.json').read_text())
    for p,h in validation['sha256'].items():assert sha(p)==h,p
    spec=json.loads((dest/'plan.json').read_text());cases={c['id']:c for c in spec['cases']}
    rawpath=dest/'raw.jsonl';assert not rawpath.exists()
    summaries=[]
    with rawpath.open('w') as out:
        for job in spec['schedule']:
            case=cases[job['case']];engine=job['engine']
            proc=subprocess.run(command(dest,case,engine,spec['quartets'],spec['batch_ms']),
                                capture_output=True,text=True,check=True,timeout=120)
            rows=[json.loads(line) for line in proc.stdout.splitlines()];assert len(rows)==60
            meta={**case,'baseline':ENGINES[engine],'baseline_engine':engine}
            for row in rows:out.write(json.dumps({**meta,**row})+'\n')
            out.flush()
            r={**meta,'cpu':summarize(rows,metric='cpu_ns_per_op'),'wall':summarize(rows)}
            summaries.append(r)
            print(len(summaries),case['id'],ENGINES[engine],round(r['cpu']['reduction_pct'],2),flush=True)
    for p,h in {**validation['sha256'],**validation['frozen_sha256']}.items():assert sha(ROOT/p)==h,p
    files=[Path(__file__).resolve(),dest/'validation.json',dest/'plan.json',rawpath]
    save(dest/'summary.json',dict(status='PASS',scope='Exploratory screen; synthetic stress tests plus a fixed-length census on a published unweighted graph',
        summaries=summaries,sha256={str(p):sha(p) for p in files}))


if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--stage',choices=['prepare','measure'],required=True)
    parser.add_argument('--output',type=Path,required=True)
    args=parser.parse_args()
    (prepare if args.stage=='prepare' else measure)(args.output.resolve())
