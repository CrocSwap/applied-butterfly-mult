#!/usr/bin/env python3
"""Check internal twiddle barriers after the whole-block phase screen."""
import argparse
import json
from pathlib import Path

from screen_phase_fusion import ROOT, sha, minimum_words, phase_value


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--screen', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    if args.output.exists():
        raise SystemExit('Output must be new')
    summary_path = args.screen / 'summary.json'
    summary = json.loads(summary_path.read_text())
    for p,h in summary['sha256'].items():
        assert sha(p) == h,p
    raw_path = args.screen / 'raw.jsonl'
    tables = {r['p']:r['values'] for r in map(json.loads,raw_path.read_text().splitlines())
              if r['kind'] == 'twiddles'}
    records = []
    for p,tw in tables.items():
        i = tw[1]
        phases = minimum_words(2)
        # Actual middle diagonal of the 4-point forward factorization:
        # H_on_bit0 * diag(1,1,1,i) * H_on_bit1.
        diagonal = [1,1,1,i]
        matches = [s for s in phases if
                   [pow(i,phase_value(2,s,x),p) for x in range(4)] == diagonal]
        assert not matches
        witnesses = []
        b = (1-i)*pow(2,-1,p) % p
        for v in (1,2,3):
            x = next(x for x in range(4) if diagonal[x] != diagonal[x ^ v])
            # Entry (x,x^v) of D C_v - C_v D.
            entry = b*(diagonal[x]-diagonal[x ^ v]) % p
            assert entry
            witnesses.append(dict(direction=v,row=x,column=x ^ v,commutator_entry=entry))
        # Final layer of an 8-point FFT needs genuine eighth roots.
        eighth_roots = [tw[2],tw[3]]
        assert all(pow(w,8,p)==1 and pow(w,4,p)==p-1 for w in eighth_roots)
        records.append(dict(p=p,fft4_diagonal=diagonal,
            sister_two_bit_phase_signatures_checked=len(phases),matching_signatures=0,
            noncommutation_witnesses=witnesses,fft8_order_eight_twiddles=eighth_roots))
    paths = [Path(__file__).resolve(),ROOT/'scripts/screen_phase_fusion.py',summary_path,raw_path]
    result = dict(status='PASS',scope='Internal diagonal phases in the 4- and 8-point source factorizations',
                  cases=records,sha256={str(p.resolve()):sha(p) for p in paths})
    args.output.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({k:v for k,v in result.items() if k!='sha256'},indent=2))


if __name__ == '__main__':
    main()
