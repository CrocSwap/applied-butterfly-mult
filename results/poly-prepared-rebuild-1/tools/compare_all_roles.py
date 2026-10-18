#!/usr/bin/env python3
"""Role-by-role comparison of every hashed file in the pinned build/check/coverage records
against the rebuild-1 records. usage: compare_all_roles.py REPO > out.json"""
import json, subprocess, sys
from pathlib import Path
repo = Path(sys.argv[1]).resolve()
tracked = set(subprocess.check_output(['git', 'ls-files'], cwd=repo, text=True).split())
pairs = [('results/poly-prepared-build/build.json', 'results/poly-prepared-rebuild-1-build/build.json', 'poly-prepared'),
         ('results/poly-contiguous-control-build/build.json', 'results/poly-contiguous-control-rebuild-1-build/build.json', 'poly-contiguous-control'),
         ('results/poly-prepared-checks/validation.json', 'results/poly-prepared-rebuild-1-checks/validation.json', 'poly-prepared'),
         ('results/poly-contiguous-control-checks/validation.json', 'results/poly-contiguous-control-rebuild-1-checks/validation.json', 'poly-contiguous-control'),
         ('results/poly-prepared-coverage/coverage.json', 'results/poly-prepared-rebuild-1-coverage/coverage.json', None)]
def role(path, rebuilt):
    r = path.replace('-rebuild-1', '') if rebuilt else path
    return r.replace('trace_poly_prepared_rebuild.py', 'trace_poly_prepared.py').replace('poly-prepared-coverage', 'poly-prepared-coverage')
rows = {}
for old, new, name in pairs:
    P = json.loads((repo / old).read_text())['sha256']; N = json.loads((repo / new).read_text())['sha256']
    Nr = {role(k, True): v for k, v in N.items()}
    for k, v in P.items():
        rows[k] = {'record': old, 'pinned': v, 'rebuild': Nr.get(k), 'match': Nr.get(k) == v,
                   'pinned_file_committed': k in tracked}
    extra = set(Nr) - set(P)
    assert not extra, extra
out = {'roles': rows,
       'summary': {'roles': len(rows), 'match': sum(r['match'] for r in rows.values()),
                   'uncommitted_pinned': sum(not r['pinned_file_committed'] for r in rows.values()),
                   'uncommitted_pinned_match': sum(r['match'] and not r['pinned_file_committed'] for r in rows.values())}}
print(json.dumps(out, indent=2))
