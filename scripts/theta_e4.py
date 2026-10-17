#!/usr/bin/env python3
"""Prepare captured-input E4 experiments. Smoke checks are NOT application data."""
import argparse
import hashlib
import json
from pathlib import Path
import random
import re
import subprocess
import time

from build_experiment import ROOT, BASE, FLAGS, INCLUDES, LIBS
from compare import summarize

OUT = ROOT / 'results/theta-e4'
BIN = OUT / 'theta-e4'
LIBRARIES = {
    'original': BASE / 'libflint.25.0.dylib',
    'current': ROOT / '.deps/experiments/theta-batch/retained/libflint-experiment.dylib',
    'candidate': ROOT / '.deps/experiments/theta-equal/candidate/libflint-experiment.dylib',
    'rebuild': ROOT / '.deps/experiments/theta-equal/rebuild/libflint-experiment.dylib',
}

def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()

def save(path, data):
    with Path(path).open('x') as f:
        json.dump(data, f, indent=2); f.write('\n')

def command(mode, matrix, target=256, start=64, cap=2048,
            base='current', candidate='candidate', trials=31, same=0):
    return list(map(str, [BIN, mode, LIBRARIES[base], LIBRARIES[candidate],
                         matrix, target, start, cap, trials, same]))

def build():
    OUT.mkdir(exist_ok=True)
    proc = subprocess.run(list(map(str, ['clang', *FLAGS, *INCLUDES,
        ROOT/'bench/theta_e4.c', LIBRARIES['original'], *LIBS, '-o', BIN])),
        text=True, capture_output=True)
    # Build logs are versioned by source digest; never replace a historical log.
    save(OUT/f'build-{sha(ROOT/"bench/theta_e4.c")[:12]}-{time.time_ns()}.json',
         dict(returncode=proc.returncode, stdout=proc.stdout, stderr=proc.stderr))
    proc.check_returncode()

def smoke():
    dest=OUT/f'smoke-{time.time_ns()}'; dest.mkdir()
    cases=[]
    for g in (1,2,6):
        data=[f'THETA_E4_V1 {g} 3']
        for i in range(g):
            for j in range(i,g):
                data.append(f'{125*(i+1) if i==j else 0} {1500+250*i if i==j else 0}')
        p=dest/f'diagonal-g{g}.tau';p.write_text('\n'.join(data)+'\n');cases.append(p)
    p=dest/'coupled-g2.tau'
    p.write_text('THETA_E4_V1 2 3\n125 1500\n125 100\n250 1750\n');cases.append(p)
    checks=[]
    for p in cases:
        for base in ('original','current'):
            cmd=command('validate',p,base=base)
            proc=subprocess.run(cmd,text=True,capture_output=True,timeout=600)
            save(dest/f'{p.stem}-{base}.json',dict(command=cmd,returncode=proc.returncode,
                 stdout=proc.stdout,stderr=proc.stderr))
            proc.check_returncode();r=json.loads(proc.stdout)
            assert r['independent_oracle'] and min(r['accuracy'])>=256
            assert min(r['attempts'])>1
            checks.append(dict(matrix=str(p),base=base,**r))
            print('Validated',p.stem,base,flush=True)
    cmd=command('probe',cases[0],target=512,start=64,cap=128)
    proc=subprocess.run(cmd,text=True,capture_output=True,timeout=60)
    assert proc.returncode==3 and json.loads(proc.stdout)['status']=='accuracy_cap'
    checks.append(dict(check='precision_cap',returncode=proc.returncode,result=json.loads(proc.stdout)))
    # Validate the round trip from Magma-style tagged integer output.
    fixture=cases[-1].read_text()
    assert parse_export('diagnostic\nBEGIN_THETA_E4_EXPORT\n'+fixture+'END_THETA_E4_EXPORT\n')==fixture
    checks.append(dict(check='tagged_integer_export',status='PASS'))
    save(dest/'summary.json',dict(kind='synthetic infrastructure checks; no performance claim',
         checks=checks,sha256={str(p):sha(p) for p in [BIN,ROOT/'bench/theta_e4.c',Path(__file__),*cases,*LIBRARIES.values()]}))
    print(dest,flush=True)

def parse_export(text):
    assert text.count('BEGIN_THETA_E4_EXPORT')==text.count('END_THETA_E4_EXPORT')==1
    payload=text.split('BEGIN_THETA_E4_EXPORT',1)[1].split('END_THETA_E4_EXPORT',1)[0]
    tokens=payload.split()
    assert tokens[0]=='THETA_E4_V1' and len(tokens)>=3
    assert all(re.fullmatch(r'-?\d+',v) for v in tokens[1:])
    g,d=map(int,tokens[1:3]);assert 1<=g<=6 and 0<=d<=5000
    assert len(tokens)==3+g*(g+1)
    return f'THETA_E4_V1 {g} {d}\n'+'\n'.join(' '.join(tokens[i:i+2]) for i in range(3,len(tokens),2))+'\n'

def capture(args):
    payload=parse_export(args.log.read_text())
    args.dest.mkdir(parents=True,exist_ok=False)
    p=args.dest/'matrix.tau';p.write_text(payload)
    log=args.dest/'magma.log';log.write_bytes(args.log.read_bytes())
    save(args.dest/'input.json',dict(source='https://arxiv.org/html/2505.22382#S6.SS3',
        kind='rounded numerical period capture; not a certified curve-period enclosure',
        scope='base curve only; no isogenous neighbours or precision lifting',
        exporter=str(ROOT/'scripts/export_theta_e4.m'),exporter_sha256=sha(ROOT/'scripts/export_theta_e4.m'),
        matrix=str(p.resolve()),matrix_sha256=sha(p),log_sha256=sha(log)))
    print(p)

def verify(plan):
    for path,digest in plan['sha256'].items(): assert sha(path)==digest,path

def prepare(args):
    data=json.loads(args.input.read_text());matrix=Path(data['matrix'])
    assert sha(matrix)==data['matrix_sha256']
    args.dest.mkdir(parents=True,exist_ok=False)
    comparisons=[dict(base='original',candidate='candidate',same=0),
                 dict(base='current',candidate='candidate',same=0),
                 dict(base='current',candidate='current',same=1),
                 dict(base='current',candidate='rebuild',same=0)]
    random.Random(710071).shuffle(comparisons)
    config=dict(matrix=str(matrix),target=args.target,start=args.start,cap=args.cap,trials=31)
    # Numerical qualification precedes any comparative timing. No selecting
    # workloads or working precisions based on a favorable timing outcome.
    for c in comparisons:
        cmd=command('validate',**config,**c)
        proc=subprocess.run(cmd,text=True,capture_output=True,timeout=600)
        save(args.dest/f'validate-{c["base"]}-{c["candidate"]}.json',
             dict(command=cmd,returncode=proc.returncode,stdout=proc.stdout,stderr=proc.stderr))
        proc.check_returncode()
    files=[matrix,args.input,Path(__file__),ROOT/'bench/theta_e4.c',BIN,
           ROOT/'scripts/compare.py',*LIBRARIES.values()]
    save(args.dest/'plan.json',dict(config=config,comparisons=comparisons,input=data,
        protocol='31 ABBA/BAAB quartets; 200ms warmup; equal repetitions with 20ms calibration; CPU and wall; retries and temporary allocation included',
        scope='E4 at supplied exact rounded matrix, not the complete inverse-Galois calculation',
        sha256={str(p.resolve()):sha(p) for p in files}))

def measure(dest):
    plan=json.loads((dest/'plan.json').read_text());verify(plan)
    with (dest/'raw.jsonl').open('x') as f:
        for c in plan['comparisons']:
            raw=subprocess.check_output(command('measure',**plan['config'],**c),text=True,timeout=1800)
            rows=[json.loads(s) for s in raw.splitlines()]
            assert len(rows)==4*plan['config']['trials']
            f.write(json.dumps(dict(comparison=c,rows=rows))+'\n');f.flush()
            print(c,flush=True)
    verify(plan)

def analyze(dest):
    plan=json.loads((dest/'plan.json').read_text());verify(plan)
    rows=[json.loads(s) for s in (dest/'raw.jsonl').read_text().splitlines()]
    assert [r['comparison'] for r in rows]==plan['comparisons']
    save(dest/'summary.json',dict(results=[dict(comparison=r['comparison'],
         cpu=summarize(r['rows'],metric='cpu_ns_per_op'),wall=summarize(r['rows']),
         precision_attempts={str(e):sorted({(v['working_precision'],v['attempts']) for v in r['rows'] if v['engine']==e}) for e in (0,1)}) for r in rows],
         raw_sha256=sha(dest/'raw.jsonl'),scope=plan['scope']))

def main():
    p=argparse.ArgumentParser(description=__doc__);sub=p.add_subparsers(dest='action',required=True)
    sub.add_parser('build');sub.add_parser('smoke')
    c=sub.add_parser('capture');c.add_argument('log',type=Path);c.add_argument('dest',type=Path)
    q=sub.add_parser('prepare');q.add_argument('input',type=Path);q.add_argument('dest',type=Path)
    q.add_argument('--target',type=int,default=256);q.add_argument('--start',type=int,default=512);q.add_argument('--cap',type=int,default=4096)
    for mode in ('measure','analyze'):
        q=sub.add_parser(mode);q.add_argument('dest',type=Path)
    a=p.parse_args()
    if a.action=='build':build()
    elif a.action=='smoke':smoke()
    elif a.action=='capture':capture(a)
    elif a.action=='prepare':prepare(a)
    elif a.action=='measure':measure(a.dest)
    elif a.action=='analyze':analyze(a.dest)

if __name__=='__main__':main()
