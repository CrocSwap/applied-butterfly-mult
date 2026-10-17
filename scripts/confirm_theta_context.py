#!/usr/bin/env python3
"""Repeat the complete 512-bit slice with longer sampling; diagnose output accuracy."""
import json
import random
import subprocess
import sys
from theta_context import ROOT, DEST, BASELINE, CANDIDATE, FLAGS, INCLUDES, LIBS, args
from qualify_theory_paths_hard import sha, save
from compare import summarize

OUT=DEST/'confirmation'

def prepare():
    OUT.mkdir(exist_ok=False)
    original=ROOT/'bench/theta_context.c';source=OUT/'accuracy.c'
    text=original.read_text()
    start=text.index('        printf("{\\"status\\":\\"PASS\\",\\"outputs')
    end=text.index('        _acb_vec_clear(oracle',start)
    replacement=r'''        slong base_min=WORD_MAX,wider=0;
        double rbase=0,rcand=0;
        for(slong i=0;i<len;i++) {
            slong bits=acb_rel_one_accuracy_bits(ref+i);if(bits<base_min)base_min=bits;
            double a=mag_get_d(arb_radref(acb_realref(ref+i)))+mag_get_d(arb_radref(acb_imagref(ref+i)));
            double b=mag_get_d(arb_radref(acb_realref(out+i)))+mag_get_d(arb_radref(acb_imagref(out+i)));
            rbase+=a;rcand+=b;wider+=(b>a);
        }
        printf("{\"status\":\"PASS\",\"outputs\":%ld,\"baseline_min_accuracy\":%ld,\"candidate_min_accuracy\":%ld,\"radius_sum_ratio\":%.9g,\"wider_outputs\":%ld}\n",
               len,base_min,minabs,rbase?rcand/rbase:0,wider);
'''
    source.write_text(text[:start]+replacement+text[end:])
    binary=OUT/'accuracy'
    cmd=['clang',*FLAGS,*INCLUDES,str(source),str(BASELINE),*LIBS,'-o',str(binary)]
    r=subprocess.run(cmd,capture_output=True,text=True);(OUT/'compile.log').write_text(r.stdout+r.stderr);r.check_returncode()
    plan=json.loads((DEST/'plan.json').read_text())
    cases=[dict(c,trials=63) for c in plan['cases'] if c['prec']==512]
    random.Random(771021).shuffle(cases)
    validation=[]
    for c in cases:
        command=args(c,'validate');command[0]=str(binary)
        validation.append(dict(case=c,**json.loads(subprocess.check_output(command,text=True))))
    save(OUT/'accuracy.json',validation)
    frozen=plan['frozen_sha256'].copy()
    for p in [source,binary,Path(__file__).resolve(),DEST/'summary.json',DEST/'raw.jsonl',OUT/'accuracy.json']:
        frozen[str(p)]=sha(p)
    save(OUT/'plan.json',dict(cases=cases,compile=cmd,frozen_sha256=frozen,
        reason='Initial inactive-path control showed a small significant negative difference. Repeat entire 512-bit slice, including all four controls, with 63 quartets instead of 21.'))
    print('Prepared',len(cases),'confirmation cases',flush=True)

def measure():
    p=json.loads((OUT/'plan.json').read_text())
    for f,h in p['frozen_sha256'].items():assert sha(ROOT/f)==h,f
    with (OUT/'raw.jsonl').open('x') as out:
        for i,c in enumerate(p['cases']):
            data=subprocess.check_output(args(c,'measure'),text=True,timeout=120)
            rows=[json.loads(s) for s in data.splitlines()];assert len(rows)==252
            out.write(json.dumps(dict(case=c,rows=rows))+'\n');out.flush()
            print(f'{i+1}/{len(p["cases"])}',flush=True)

def analyze():
    p=json.loads((OUT/'plan.json').read_text())
    for f,h in p['frozen_sha256'].items():assert sha(ROOT/f)==h,f
    data=[json.loads(s) for s in (OUT/'raw.jsonl').read_text().splitlines()]
    assert [r['case'] for r in data]==p['cases']
    rows=[dict(case=r['case'],cpu=summarize(r['rows'],metric='cpu_ns_per_op'),wall=summarize(r['rows'])) for r in data]
    save(OUT/'summary.json',dict(results=rows,raw_sha256=sha(OUT/'raw.jsonl'),preserved_hashes=len(p['frozen_sha256'])))
    for r in rows:print(r['case'],r['cpu'])

if __name__=='__main__':
    from pathlib import Path
    assert len(sys.argv)==2 and sys.argv[1] in ('prepare','measure','analyze')
    globals()[sys.argv[1]]()
