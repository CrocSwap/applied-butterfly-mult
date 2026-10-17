#!/usr/bin/env python3
"""Exact end-to-end checks around dispatch, transform, and carry boundaries."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
from benchmark import ROOT

SIZES = [1,2,3,7,15,16,17,31,63,64,65,127,255,256,257,511,512,513,
         998,999,1000,1001,1002,1399,1400,1401,1535,1536,1537,2047,2048,2049,
         3071,3072,3073,4093,4095,4096,4097,6143,6144,6145,8191,8192,8193,
         10239,10240,10241,12287,12288,12289,16383,16384,16385,24575,24576,
         24577,32767,32768,32769,39999,40000,40001,49151,49152,49153,65535,65536,65537]


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--candidate',type=Path,required=True)
    p.add_argument('--output',type=Path,required=True)
    args=p.parse_args()
    if args.output.exists(): p.error('output already exists')
    results=[]
    for an in SIZES:
        cases={(an,'sqr'),(an,'mul'),(max(1,an//2),'mul'),
               (max(1,an//3),'mul'),(max(1,an//100),'mul')}
        for bn,op in sorted(cases):
            output=subprocess.check_output([str(ROOT/'build/validate'),
                str(ROOT/'.deps/flint/libflint.25.0.dylib'),str(args.candidate.resolve()),
                str(an),str(bn),op,'0','1'],text=True)
            results.append(json.loads(output))
    report={'candidate':str(args.candidate),
            'sha256':hashlib.sha256(args.candidate.read_bytes()).hexdigest(),
            'validator_sha256':hashlib.sha256((ROOT/'build/validate').read_bytes()).hexdigest(),
            'cases':results,'case_count':len(results),
            'comparisons_per_library':12*len(results)}
    args.output.parent.mkdir(parents=True,exist_ok=True)
    args.output.write_text(json.dumps(report,indent=2)+'\n')
    print(f"PASS {len(results)} cases, {12*len(results)} GMP comparisons per library")


if __name__=='__main__':main()
