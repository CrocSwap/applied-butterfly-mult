#!/usr/bin/env python
"""
Jackknife Product algorithm

jackknifeProduct( g, operation )

Arguments:
g = commutative semigroup elements in a list
operation = commutative semigroup operation

Return:
gbar = a list of the len( g ) complementary products of g

The UNIX command 

'python jls_jackknifeproduct.py'

tests the components of Jackknife Product algorithm
and should exit without complaint if the file passes its tests. 
"""

import math
import operator

# Returns gbar[0...n] from the Jackknife Product algorithm with in place computation.
def jackknifeProduct( g, operation ):
    # the 3 phases
    L = _upward( g, operation )
    Lbar = _downward( L, operation ) # L and Lbar use the same storage.
    gbar = _transposition( Lbar[ 0 ] )
    return gbar

# Returns gbar[0...n] in the Jackknife Product algorithm.
def test_jackknifeProduct():
    # general n
    N_LO = 4
    N_HI = 31
    for n in range( N_LO, N_HI ):
        g = [ 2**i for i in range( 0, n ) ]
        total = sum( g )
        gbar = jackknifeProduct( g, operator.add )
        for i in range( 0, n ):
            assert g[i] + gbar[i] == total

# Returns L[k=0...m)[j=0...nsubk] in the Jackknife Product algorithm.
def _upward( g, operation ): # the upward phase
    n = len( g )
    L = []
    L.append([])
    k = 0
    nsubk = _nsubk( n, k )
    for j in range( 0, n ):
        L[ k ].append( g[ j ] )
    while nsubk > 2:
        L.append([])
        k += 1
        nsubkMinus1 = nsubk
        nsubk = _nsubk( n, k )
        for j in range( 0, _rho( nsubkMinus1 ) ):
            L[ k ].append( operation( L[ k - 1 ][ 2*j ], L[ k - 1 ][ 2*j + 1 ] ) ) 
        if ( nsubkMinus1 % 2 ):
            L[ k ].append( L[ k - 1 ][ nsubkMinus1 - 1 ] )
    return L

# Returns Lbar[k=0...m)[j=0...nsubk] in the Jackknife Product algorithm.
def _downward( L, operation ): # the downward phase
    n = len( L[ 0 ] )
    m = len( L )
    k = m - 1
    nsubkMinus1 = _nsubk( n, k )
    while k > 0:
        nsubk = nsubkMinus1
        nsubkMinus1 = _nsubk( n, k - 1 )
        for j in range( 0, 2 * _rho( nsubkMinus1 ) ):
            L[ k - 1 ][ j ] = operation( L[ k - 1 ][ j ], L[ k ][ _alpha( j, nsubk ) ] ) 
        if ( nsubkMinus1 % 2 ):
            L[ k - 1 ][ nsubkMinus1 - 1 ] = L[ k ][ _alpha( nsubkMinus1 - 1, nsubk ) ] 
        k -= 1
    return L

# Returns Lbar[k=0...m)[j=0...nsubk] in the Jackknife Product algorithm.
def _transposition( L0 ): # the transposition phase
    for i in range( 0, len( L0 ) - 1, 2 ):
        L0[ i ], L0[ i + 1 ] = L0[ i + 1 ], L0[ i ] # swap successive pairs
    return L0

# Returns the binary shift of j.
def _rho( j ):
    return j // 2

def test_rho():
    assert _rho( 0 ) == 0
    assert _rho( 1 ) == 0
    assert _rho( 2 ) == 1
    assert _rho( 3 ) == 1
    
    J_LO = 0
    J_HI = 15 
    for j in range( J_LO, J_HI ):
        assert j - 2 * _rho( j ) == j % 2

# Returns the twin of j.
def _tau( j ):
    return j + (-1)**(j % 2)

def test_tau():
    assert _tau( 0 ) == 1
    assert _tau( 1 ) == 0
    assert _tau( 2 ) == 3
    assert _tau( 3 ) == 2
    
    J_LO = 0
    J_HI = 15 
    for j in range( J_LO, J_HI ):
        assert _tau( j ) - j == (-1)**(j % 2)

# Returns the ceiling of n * 2**-k.
def _nsubk( n, k ):
    return math.ceil( n * 2**-k )

def test_nsubk():
    assert _nsubk( 3, 0 ) == 3
    assert _nsubk( 3, 1 ) == 2
    assert _nsubk( 3, 2 ) == 1

    assert _nsubk( 4, 0 ) == 4
    assert _nsubk( 4, 1 ) == 2
    assert _nsubk( 4, 2 ) == 1
    assert _nsubk( 4, 3 ) == 1

    N_LO = 2
    N_HI = 15 
    for n0 in range( N_LO, N_HI ):
        n = n0
        assert _nsubk( n, 0 ) == n0
        k = 1
        while n > 1:
            n = math.ceil( n / 2 )
            assert _nsubk( n0, k ) == n
            k += 1

# Returns the adjusted aunt of j in the next row up.
def _alpha( j, nsubk = 0 ):
    akj = _tau( _rho( j ) )
    if nsubk == 0:
        return akj
    return min( akj, nsubk - 1 )

def test_alpha():
    assert _alpha( 0 ) == 1
    assert _alpha( 1 ) == 1
    assert _alpha( 2 ) == 0
    assert _alpha( 3 ) == 0
    assert _alpha( 4 ) == 3
    assert _alpha( 5 ) == 3
    assert _alpha( 6 ) == 2
    assert _alpha( 7 ) == 2

    assert _alpha( 0, 3 ) == 1
    assert _alpha( 1, 3 ) == 1
    assert _alpha( 2, 3 ) == 0
    assert _alpha( 3, 3 ) == 0
    assert _alpha( 4, 3 ) == 2
    assert _alpha( 5, 3 ) == 2
    assert _alpha( 6, 3 ) == 2
    assert _alpha( 7, 3 ) == 2

    J_LO = 4
    J_HI = 15
    _nsubk = 3
    for j in range( J_LO, J_HI ):
        assert _alpha( j, _nsubk ) == _nsubk - 1
        assert _tau( _alpha( j ) ) == _rho( j )

if __name__ == '__main__': 
    test_rho()
    test_tau()
    test_nsubk()
    test_alpha()
    test_jackknifeProduct()
