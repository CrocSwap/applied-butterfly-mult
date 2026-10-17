import json,re,sys;from pathlib import Path
R=Path(sys.argv[1]);rd=lambda p:json.loads((R/p).read_text())
a={(r['dim'],r['length'],r['modulus'],r['window']):r for r in rd('results/poly-prepared-confirm/summary.json')}
b={(r['dim'],r['length'],r['modulus'],r['window']):r for r in rd('results/poly-prepared-repeat/summary.json')}
mods={'g':1000000007,'p':1108307720798209}
fmt=lambda c:'%+.2f%% [%+.2f, %+.2f]'%(c['reduction_pct'],c['ci95_low_pct'],c['ci95_high_pct'])
n=bad=0
for l in (R/'docs/prepared-inputs-m2.md').read_text().splitlines():
    m=re.match(r'\|\s*(\d)×\d\s*\|\s*(\d+)\s*\|\s*(\w)\s*\|\s*(\w+)\s*\|(.*)\|(.*)\|\s*$',l)
    if not m or m[3] not in mods:continue
    k=(int(m[1]),int(m[2]),mods[m[3]],m[4]);n+=1
    if k not in a: print('no summary for',l);bad+=1;continue
    exp=(fmt(a[k]['cpu']),fmt(b[k]['cpu']))
    if (m[5].strip(),m[6].strip())!=exp: bad+=1;print('DIFF',l,'| expected',exp)
print('doc table rows checked',n,'diffs',bad)
