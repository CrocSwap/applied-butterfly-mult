#!/usr/bin/env python3
"""Exact 16-wire frame diagnostics; costs are explicitly restricted models."""
from collections import Counter
import itertools
import json
from pathlib import Path

IDENTITY=(1,2,4,8)
UPSTREAM=(4,8,1,2)
TWO_LANE=(2,1,4,8)
SHEAR=(3,2,4,8)
P=17
W=3  # primitive 16th root modulo 17


def address(frame,x):
    return sum(((row&x).bit_count()%2)<<bit for bit,row in enumerate(frame))


def permutation(frame):
    return [address(frame,x) for x in range(16)]


def encode(values,frame):
    out=[0]*16
    for x,value in enumerate(values): out[address(frame,x)]=value
    return out


def decode(values,frame):
    return [values[address(frame,x)] for x in range(16)]


def forward(values,frame):
    data=encode(values,frame)
    for length in [16,8,4,2]:
        half=length//2
        for base in range(0,16,length):
            for j in range(half):
                a,b=address(frame,base+j),address(frame,base+j+half)
                u,v=data[a],data[b]
                data[a]=(u+v)%P
                data[b]=(u-v)*pow(W,j*(16//length),P)%P
    return data


def inverse(values,frame):
    data=list(values)
    for length in [2,4,8,16]:
        half=length//2
        for base in range(0,16,length):
            for j in range(half):
                a,b=address(frame,base+j),address(frame,base+j+half)
                u,v=data[a],data[b]*pow(W,-j*(16//length),P)%P
                data[a]=(u+v)*9%P
                data[b]=(u-v)*9%P
    return decode(data,frame)


def mixed_vectors(source,target):
    """Count target two-lane vectors drawing values from two source vectors.

    Register renaming is free. Each mixed output vector needs a lane assembly
    instruction in a model restricted to register-register two-lane shuffles.
    This excludes gather/scalar loads and interleaved memory instructions.
    """
    inv={address(target,x):address(source,x) for x in range(16)}
    return sum(inv[i]//2!=inv[i+1]//2 for i in range(0,16,2))


def screen():
    histogram=Counter();total=0
    for frame in itertools.product(range(1,16),repeat=4):
        mapping=permutation(frame)
        if len(set(mapping))!=16: continue
        total+=1
        crossings=sum(address(frame,1<<axis)&1 for axis in range(4))
        assert crossings==frame[0].bit_count() and crossings>=1
        histogram[crossings]+=1
        # Check conjugation of all four coordinate translations on every wire.
        assert all(mapping[x^(1<<axis)]==mapping[x]^mapping[1<<axis]
                   for axis in range(4) for x in range(16))
    return {'invertible_binary_frames':total,
            'lane_crossing_stage_histogram':dict(sorted(histogram.items())),
            'fixed_frame_minimum_crossing_stages':min(histogram),
            'mixed_output_vectors':{'upstream_4x4_transpose':mixed_vectors(IDENTITY,UPSTREAM),
                                    'candidate_bit_0_1_swap':mixed_vectors(IDENTITY,TWO_LANE)},
            'permutations':{name:permutation(frame) for name,frame in
                            [('identity',IDENTITY),('upstream',UPSTREAM),('two_lane',TWO_LANE),('shear',SHEAR)]},
            'scope':'Fixed binary frames and register-register two-lane permutation model only. Not a lower bound on all FFT algorithms, dynamic frames, arithmetic-fused shuffles, or memory instructions.',
            'interpretation':'Both explicit layout changes require eight mixed destination vectors in this model. Candidate tests arithmetic grouping/register allocation and a different retained interface, not a proven reduction of this shuffle count.'}


if __name__=='__main__':
    result=screen()
    output=Path(__file__).resolve().parents[1]/'results/network-frame-screen.json'
    output.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result,indent=2))
