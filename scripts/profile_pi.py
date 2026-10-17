#!/usr/bin/env python3
"""Sample the uncached pi application separately from performance measurements."""
import argparse
import json
from pathlib import Path
import subprocess
import time
from benchmark import ROOT,metadata


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--library',type=Path,required=True)
    p.add_argument('--precision',type=int,default=1048576)
    p.add_argument('--output',type=Path,required=True)
    args=p.parse_args()
    args.output.mkdir(parents=True,exist_ok=False)
    info=metadata()
    info['purpose']='Path confirmation only; these runs are not timing evidence'
    cmd=[str(ROOT/'build/pi'),str(args.library.resolve()),str(args.library.resolve()),
         str(args.precision),'10000','1']
    info['command']=cmd
    with (args.output/'stderr.txt').open('w') as err:
        proc=subprocess.Popen(cmd,cwd=ROOT,stdout=subprocess.DEVNULL,stderr=err)
        try:
            time.sleep(1)
            if proc.poll() is not None: raise RuntimeError('profile target exited early')
            sample=['sample',str(proc.pid),'3','1','-file',str((args.output/'sample.txt').resolve())]
            info['sample_command']=sample
            subprocess.run(sample,cwd=ROOT,check=True)
        finally:
            if proc.poll() is None: proc.terminate()
            proc.wait()
    (args.output/'metadata.json').write_text(json.dumps(info,indent=2)+'\n')


if __name__=='__main__':main()
