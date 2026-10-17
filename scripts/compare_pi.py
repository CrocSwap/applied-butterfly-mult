#!/usr/bin/env python3
"""Time uncached Chudnovsky pi computation with exact and MPFR checks."""
import argparse
import hashlib
import json
from pathlib import Path
import random
import subprocess
from benchmark import ROOT,metadata
from compare import summarize
from analyze_experiments import aggregate,logs


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--baseline',type=Path,default=ROOT/'.deps/flint/libflint.25.0.dylib')
    p.add_argument('--candidate',type=Path,required=True)
    p.add_argument('--precisions',nargs='+',type=int,default=[262144,524288,1048576])
    p.add_argument('--trials',type=int,default=31)
    p.add_argument('--batch-ms',type=int,default=20)
    p.add_argument('--seed',type=int,default=71391)
    p.add_argument('--output',type=Path,required=True)
    args=p.parse_args()
    if min(args.precisions)<64 or args.trials<8 or args.batch_ms<1: p.error('invalid precision, trials, or batch target')
    args.output.mkdir(parents=True,exist_ok=False)
    info=metadata()
    info['arguments']={k:str(v) if isinstance(v,Path) else v for k,v in vars(args).items()}
    info['method']='Uncached full Chudnovsky pi; two resident dylibs; warm contexts; equal iterations in alternating ABBA/BAAB quartets; CPU and wall clocks; user-initiated QoS'
    info['comparison_sha256']={str(f):hashlib.sha256(f.read_bytes()).hexdigest()
                               for f in [args.baseline,args.candidate,ROOT/'build/pi',ROOT/'bench/pi.c']}
    (args.output/'metadata.json').write_text(json.dumps(info,indent=2)+'\n')
    cases=list(args.precisions);random.Random(args.seed).shuffle(cases)
    report={'cases':[],'aggregate':{}}
    series={metric:[] for metric in ['cpu','wall']}
    with (args.output/'raw.jsonl').open('w') as raw,(args.output/'checks.jsonl').open('w') as checks:
        for prec in cases:
            result=subprocess.run([str(ROOT/'build/pi'),str(args.baseline.resolve()),str(args.candidate.resolve()),
                                   str(prec),str(args.trials),str(args.batch_ms)],capture_output=True,text=True)
            checks.write(result.stderr);checks.flush()
            if result.returncode: raise RuntimeError(result.stderr)
            raw.write(result.stdout);raw.flush()
            rows=[json.loads(line) for line in result.stdout.splitlines()]
            stats={}
            for label,metric in [('cpu','cpu_ns_per_op'),('wall','ns_per_op')]:
                series[label].append(logs(rows,metric))
                stats[label]=summarize(rows,metric=metric)
            report['cases'].append({'precision_bits':prec,**stats})
            print(prec,json.dumps(stats),flush=True)
    report['aggregate']={label:aggregate(s) for label,s in series.items()}
    (args.output/'analysis.json').write_text(json.dumps(report,indent=2)+'\n')
    print('aggregate',json.dumps(report['aggregate']),flush=True)


if __name__=='__main__':main()
