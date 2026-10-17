#!/usr/bin/env python3
"""Resident-library ABBA/BAAB comparisons of complete polynomial operations."""
import argparse
import hashlib
import json
import platform
from pathlib import Path
import random
import subprocess
from datetime import datetime,timezone
from build_experiment import ROOT,BASE,FLAGS,INCLUDES,LIBS
from compare import summarize


def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--candidate',type=Path,required=True)
    ap.add_argument('--baseline',type=Path,default=BASE/'libflint.25.0.dylib')
    ap.add_argument('--plan',type=Path,required=True)
    ap.add_argument('--output',type=Path,required=True)
    ap.add_argument('--seed',type=int)
    a=ap.parse_args();a.output.mkdir(parents=True,exist_ok=False)
    plan=json.loads(a.plan.read_text());cases=plan['cases'].copy()
    seed=a.seed if a.seed is not None else plan['seed'];random.Random(seed).shuffle(cases)
    binary=ROOT/'build/compare-poly'
    files=[a.baseline.resolve(),a.candidate.resolve(),binary,ROOT/'bench/compare_poly.c',ROOT/'bench/poly_survey.c',Path(__file__).resolve(),a.plan.resolve(),ROOT/'scripts/compare.py']
    metadata={'started_utc':datetime.now(timezone.utc).isoformat(),'platform':platform.platform(),
        'plan':plan,'seed':seed,'case_order':cases,'baseline':str(a.baseline.resolve()),'candidate':str(a.candidate.resolve()),
        'method':'Two resident dylibs, one thread, independent KS checks, 100ms combined warmup, equal iterations, alternating ABBA/BAAB quartets. Complete warm public calls, including allocation and conversion. Circular block bootstrap across quartets.',
        'sha256':{str(p.relative_to(ROOT)):hashlib.sha256(p.read_bytes()).hexdigest() for p in files}}
    (a.output/'metadata.json').write_text(json.dumps(metadata,indent=2)+'\n')
    results=[]
    with (a.output/'raw.jsonl').open('x') as out:
        for d,n,p,w in cases:
            cmd=[str(binary),str(a.baseline.resolve()),str(a.candidate.resolve()),str(d),str(n),str(p),w,str(plan['trials']),str(plan['batch_ms'])]
            raw=subprocess.check_output(cmd,text=True);out.write(raw);out.flush()
            rows=[json.loads(s) for s in raw.splitlines()]
            bindings=[r for r in rows if r['phase']=='binding'];assert len(bindings)==2
            assert [Path(r['image']).resolve() for r in bindings]==[a.baseline.resolve(),a.candidate.resolve()]
            warm=[r for r in rows if r['phase']=='warm']
            result={'dim':d,'length':n,'modulus':p,'window':w,'supported':bool(warm)}
            if warm:
                assert len(warm)==4*plan['trials']
                result['cpu']=summarize(warm,metric='cpu_ns_per_op')
                result['wall']=summarize(warm,metric='ns_per_op')
                c=result['cpu'];print(d,n,p,w,f"{c['reduction_pct']:+.2f}% [{c['ci95_low_pct']:+.2f},{c['ci95_high_pct']:+.2f}]",flush=True)
            else:print('unsupported',d,n,p,w,flush=True)
            results.append(result)
            (a.output/'summary.json').write_text(json.dumps(results,indent=2)+'\n')


if __name__=='__main__':main()
