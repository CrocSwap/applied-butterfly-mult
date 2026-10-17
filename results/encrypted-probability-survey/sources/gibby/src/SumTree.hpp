//
// Dec 5 2024, Mikko Koivisto
//
// Class SumTree implementes a simple data structure that supports efficient 
// sampling from a discrete probability distribution on {0, 1, 2, ..., n - 1}.
//
// Notes:
//	- Randomness is currently outsourced; a random number is assumed as input,
//
// Key functionalities:
//	init		Initializes with a given vector of nonnegative weights, treated 
//				as unnormalized probabilities.
//	rand		Returns a draw, currently assumes a Unif(0, 1) as input.
//	update		Updates by assigning a new weight to a given element. 

#ifndef SumTree_HPP
#define SumTree_HPP

#include <iostream>
#include <vector>
#include "Breal.hpp"

#define TEMP	template <class T>		// T is the type of the weights, e.g, int, double, or someting else.

using u32 = uint32_t;

TEMP class SumTree {
	public:
				SumTree	()					{ }
				SumTree	(std::vector<T>& w) { init(w); }
		void	init	(std::vector<T>& w);				// Initializes with weights w.
		int		rand	(double r);							// Returns the smallest i such that w(0) + ... + w(i) > r * wsum;
		void	update	(int i, T wi);						// Replaces the weight of i by wi.
		T		sum		()					{ return s[1]; }
		T		at		(int i)				{ return s[m + i]; }
		void	printw	();
		void	prints	();

		std::vector<T>	s;	// Weights and weight sums;	s[1] is the total sum. 		
	private:
		int				n;	// The number of elements. Can be less than s.size() / 2.
		int				d;	// The smallest d such that 2^d is at least 2n.
		int				m;	// 2^d.
};

TEMP void SumTree<T>::init(std::vector<T>& v){
	n = v.size();
	d = 1; while ((1L << d) < n) d++;
	m = 1L << d; s.resize(2 * m);
	for (int i = 0; i < n; i++) s[m + i] = v[i];
	for (u32 b = m - 1; b > 0; b--){
		u32 b0 = b << 1; u32 b1 = (b << 1) | 1;
		s[b] = s[b0] + s[b1];
	} 
}
TEMP int SumTree<T>::rand(double r){
	T t; t = r * s[1]; i32 b = 1;
	while (b < m) {
		u32 b0 = b << 1; u32 b1 = (b << 1) | 1;
		if (s[b0] < t) { b = b1; t = t - s[b0]; }
		else           { b = b0; }
	}	
	return b - m;
}
TEMP void SumTree<T>::update(int i, T wi){
	u32 b = m + i; s[b] = wi;	// The index of i in s is simply m + i.
	do {						// Recompute the sums on the path to the root.
		u32 b0 = b ^ (u32) 1; u32 b1 = b ^ (u32) 0; b >>= 1;
		s[b] = s[b0] + s[b1];
	} while (b > 1);
}
TEMP void SumTree<T>::printw(){
	using namespace std;
	cout << "\t w:";
	for (int i = 0; i < n; i++){
		cout << " " << setprecision(4) << (double) s[m + i];
	}
	cout << endl;
}
TEMP void SumTree<T>::prints(){
	using namespace std;
	cout << "\t s:";
	for (int i = 0; i < m + n; i++){
		if (bitcount(i) == 1) cout << " |";
		cout << " " << setprecision(4) << (double) s[i];
	}
	cout << endl;
}


#undef TEMP
#endif
