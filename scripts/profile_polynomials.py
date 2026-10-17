#!/usr/bin/env python3
"""Sample warmed public polynomial calls, separately from timing runs (macOS)."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
from summarize_profiles import summarize

ROOT = Path(__file__).resolve().parents[1]


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--output', type=Path, required=True)
    args = ap.parse_args()
    args.output.mkdir(parents=True,exist_ok=False)
    cases = [[1,1024,1000000007,'full'],[2,1024,1000000007,'full'],
             [4,256,1000000007,'full'],[8,256,1000000007,'full'],
             [8,1024,1000000007,'full'],[8,1024,1108307720798209,'full'],
             [8,1024,1000000007,'mid']]
    manifest = {'cases':cases,'duration_seconds':4,'interval_ms':1,
                'note':'Profiles start only after correctness checks and warmup. One case at a time; no timing run concurrently.',
                'sha256':{str(p.relative_to(ROOT)):hashlib.sha256(p.read_bytes()).hexdigest()
                          for p in [Path(__file__).resolve(), ROOT/'build/poly-survey', ROOT/'.deps/flint/libflint.25.0.dylib']}}
    (args.output/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
    summaries=[]
    for dim,length,modulus,window in cases:
        name=f'{dim}x{dim}-{length}-{modulus}-{window}'
        command=[str(ROOT/'build/poly-survey'),str(dim),str(length),str(modulus),window,'0','6500']
        proc=subprocess.Popen(command,text=True,stdout=subprocess.PIPE,stderr=subprocess.PIPE)
        try:
            ready=proc.stderr.readline()
            if ready != 'PROFILE_READY\n':raise RuntimeError((command,ready,proc.communicate()))
            samplefile=args.output/(name+'.txt')
            run=subprocess.run(['sample',str(proc.pid),'4','1','-file',str(samplefile)],
                               text=True,capture_output=True,check=True)
            (args.output/(name+'-sampler.log')).write_text(run.stdout+run.stderr)
            stdout,stderr=proc.communicate(timeout=20)
            assert proc.returncode==0 and not stderr,(proc.returncode,stderr)
            (args.output/(name+'.json')).write_text(stdout)
            row=summarize(samplefile)
            row['case']={'dim':dim,'length':length,'modulus':modulus,'window':window}
            summaries.append(row)
            print(name, row['samples'], 'samples', flush=True)
        finally:
            if proc.poll() is None:proc.kill();proc.wait()
    (args.output/'summary.json').write_text(json.dumps(summaries,indent=2)+'\n')


if __name__ == '__main__':
    main()
