#!/usr/bin/env python3
"""Profile one warmed case, allowing extra time for sampler attachment."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
from summarize_profiles import summarize

ROOT=Path(__file__).resolve().parents[1]


def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('dim',type=int);ap.add_argument('length',type=int)
    ap.add_argument('modulus',type=int);ap.add_argument('window',choices=['full','mid'])
    ap.add_argument('--output',type=Path,required=True)
    a=ap.parse_args();a.output.mkdir(parents=True,exist_ok=False)
    command=[str(ROOT/'build/poly-survey'),str(a.dim),str(a.length),str(a.modulus),a.window,'0','16000']
    proc=subprocess.Popen(command,text=True,stdout=subprocess.PIPE,stderr=subprocess.PIPE)
    try:
        assert proc.stderr.readline()=='PROFILE_READY\n'
        sampling=['sample',str(proc.pid),'4','1','-file',str(a.output/'sample.txt')]
        run=subprocess.run(sampling,text=True,capture_output=True,check=True)
        (a.output/'sampler.log').write_text(run.stdout+run.stderr)
        stdout,stderr=proc.communicate(timeout=25)
        assert proc.returncode==0 and not stderr,(proc.returncode,stderr)
        (a.output/'operations.json').write_text(stdout)
        result=summarize(a.output/'sample.txt')
        assert result['samples']>=1000, 'Too few samples; retain this run but do not use its attribution.'
        result['case']={k:getattr(a,k) for k in ['dim','length','modulus','window']}
        result['commands']=[command,sampling]
        result['sha256']={str(p.relative_to(ROOT)):hashlib.sha256(p.read_bytes()).hexdigest()
                          for p in [Path(__file__).resolve(),ROOT/'build/poly-survey',ROOT/'.deps/flint/libflint.25.0.dylib']}
        (a.output/'summary.json').write_text(json.dumps(result,indent=2)+'\n')
    finally:
        if proc.poll() is None:proc.kill();proc.wait()


if __name__=='__main__':main()
