#!/usr/bin/env python3
"""Compare a poly-prepared rebuild with the pinned build records (read-only on the repo).

usage: compare_rebuild.py REPO PINNED_NAME NEW_NAME
Prints JSON: per-role raw hash match, path-normalized gr.s match, and gr.s symbol counts
computed with the same rule as scripts/audit_poly_prepared.py.
"""
import hashlib, json, re, sys
from pathlib import Path

repo, pinned, new = Path(sys.argv[1]).resolve(), sys.argv[2], sys.argv[3]
PINNED_ROOT = '/Users/colkitt/sith/toys/math/butterflyMult'   # from the pinned build.json commands


def role(path, name):
    return path.replace('/' + name + '/', '/<name>/').replace('/' + name + '-build/', '/<name>-build/') \
               .replace('patches/' + name + '.patch', 'patches/<name>.patch')


def counts(text):
    out = {}
    for symbol in ['_bf_normalize', '_bf_contiguous']:
        start = text.index('_' + symbol + ':'); s = text[start:text.index('.cfi_endproc', start)]
        ins = [l.strip() for l in s.splitlines() if re.match(r'^\s+[a-z]+(?:\.[a-z0-9]+)?\s', l)]
        out[symbol] = {'instructions': len(ins), 'frintn': sum(l.startswith('frintn') for l in ins),
                       'stack_references': sum('[sp' in l for l in ins)}
    return out


def norm(text, root, name):
    return text.replace(root, '<ROOT>').replace('/experiments/' + name + '/', '/experiments/<name>/')


def body(text, symbol):
    start = text.index('_' + symbol + ':'); end = text.index('.cfi_endproc', start)
    return [l for l in text[start:end].splitlines() if not l.lstrip().startswith(('.loc', 'Ltmp', '; ', '.file'))]


P = json.loads((repo / 'results' / (pinned + '-build') / 'build.json').read_text())
N = json.loads((repo / 'results' / (new + '-build') / 'build.json').read_text())
p_roles = {role(k, pinned): v for k, v in P['sha256'].items()}
n_roles = {role(k, new): v for k, v in N['sha256'].items()}
assert set(p_roles) == set(n_roles), (set(p_roles) ^ set(n_roles))
hashes = {r: {'pinned': p_roles[r], 'rebuild': n_roles[r], 'match': p_roles[r] == n_roles[r]} for r in sorted(p_roles)}

ps = (repo / 'results' / (pinned + '-build') / 'gr.s').read_text(errors='replace')
ns = (repo / 'results' / (new + '-build') / 'gr.s').read_text(errors='replace')
pn, nn = norm(ps, PINNED_ROOT, pinned), norm(ns, str(repo), new)
lines_p, lines_n = pn.splitlines(), nn.splitlines()
diff_lines = sum(a != b for a, b in zip(lines_p, lines_n)) + abs(len(lines_p) - len(lines_n))
report = {
    'pinned': pinned, 'rebuild': new, 'prepare': [P['prepare'], N['prepare']],
    'hashes': hashes,
    'gr_s': {'lines': [len(lines_p), len(lines_n)],
             'path_normalized_sha256': [hashlib.sha256(pn.encode()).hexdigest(), hashlib.sha256(nn.encode()).hexdigest()],
             'path_normalized_identical': pn == nn, 'path_normalized_differing_lines': diff_lines,
             'kernel_bodies_identical_ignoring_loc': {s: body(pn, s) == body(nn, s) for s in ['_bf_normalize', '_bf_contiguous']},
             'counts_pinned': counts(ps), 'counts_rebuild': counts(ns)},
    'commands_identical_after_path_normalization':
        json.dumps(P['commands']).replace(PINNED_ROOT, '<ROOT>').replace(pinned, '<name>') ==
        json.dumps(N['commands']).replace(str(repo), '<ROOT>').replace(new, '<name>'),
}
print(json.dumps(report, indent=2))
