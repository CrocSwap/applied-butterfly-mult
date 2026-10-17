#!/usr/bin/env python3
"""Verify candidate/control dispatch and preparation counts for every timed case."""
import hashlib
import json
from pathlib import Path
import subprocess
from build_experiment import ROOT,FLAGS,INCLUDES,LIBS


def main():
    output=ROOT/'results/poly-prepared-coverage';output.mkdir(exist_ok=False)
    planfile=ROOT/'experiments/poly-prepared-confirm-plan.json'
    plan=json.loads(planfile.read_text());rows=[];commands=[]
    files=[Path(__file__).resolve(),ROOT/'bench/trace_poly_prepared.c',ROOT/'bench/poly_survey.c',planfile]
    for name,prepare in [('poly-prepared',1),('poly-contiguous-control',0)]:
        library=ROOT/'.deps/experiments'/(name+'-trace')/'libflint-experiment.dylib'
        binary=ROOT/'build'/('trace-'+name)
        cmd=['clang',*FLAGS,*INCLUDES,str(ROOT/'bench/trace_poly_prepared.c'),str(library),*LIBS,'-o',str(binary)]
        commands.append(cmd);subprocess.run(cmd,check=True);files.extend([library,binary])
        for d,n,p,w in plan['cases']:
            cmd=[str(binary),str(d),str(n),str(p),w];commands.append(cmd)
            row=json.loads(subprocess.check_output(cmd,text=True));row['library']=name
            active=d>=4;np=1 if p==0x3f00000000001 else 2
            expected_slots=d*d*np*(1<<(2*n+2).bit_length()) if active and prepare else 0
            assert row['dot_calls']==row['dot_successes']==(d*d if active else 0),row
            assert row['prepared_inputs']==(d*d if active and prepare else 0),row
            assert row['prepared_slots']==expected_slots,row
            rows.append(row)
    report={'status':'PASS','cases':rows,'commands':commands,
        'scope':'Separate instrumented libraries. One dense operation per case, independent KS reference; no timings.',
        'sha256':{str(p.relative_to(ROOT)):hashlib.sha256(p.read_bytes()).hexdigest() for p in files}}
    (output/'coverage.json').write_text(json.dumps(report,indent=2)+'\n')
    print('Coverage PASS:',len(rows),'case/library pairs')


if __name__=='__main__':main()
