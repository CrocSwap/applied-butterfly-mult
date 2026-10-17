//
// 5 Nov 2024, Mikko Koivisto 
//
// Class BD implements routines to compute and store Bayesian Dirichlet scores.
//
// Can import a data matrix as a vector or through a text file.
// Can query the score of a family (i, Pi), where Pi consists of the parents of i.
// Can query the score of a clique C. Note: score(i, Pi) = score({i} union Pi) - score(Pi) 
//
// Clique scores computed using hashing. Note: fast if many data points and large cliques.
// Stores the computed clique scores in data structure to support fast queries.
//
// Current limitations:
// - only BDeu scores
// - data values assumed to be small integers 0, 1, 2, ...
// - bottom-up building using pruning not implemented yet
//
// Depends on the following external concepts:
// - HashCounter	: Somewhat optimized hashmap for counting.
// - Wset			: Weighted set – a storage and manipulation routines for (set, score) pairs.

#ifndef BD_HPP
#define BD_HPP

#include <iostream>
#include <fstream>  
#include <iomanip> 
#include <string.h>
#include <vector>
#include "basics.hpp"
#include "Scorer.hpp"
#include "HashCounter.hpp"

typedef uint8_t				Tdat;
typedef std::vector<Tdat>	vdat;
typedef std::vector<u32>	vu32;
typedef std::vector<u64>	vu64;

#define data(i, t)	dat[ i * m + t ]

class BD : public Scorer {
	public:
		vdat	dat;	// Data.

		double	scli (const vint& C);						// The score of clique C.

		int		read (const vdat& datavec, int m0, int n0);	// Reads data matrix of size m0 x n0 given as vector datavec.
		int		dear (const vdat& datavec, int m0, int n0);	// Reads data matrix of size m0 x n0 given as vector datavec.
		int		read (const string& fname);					// Reads data matrix given as a csv file.
		int		dear (const string& fname);					// Reads data matrix given as a csv file.

		void	set_ess	(double essval)	{ ess = essval; }
		double	get_ess	()				{ return ess; }
		long	size	()				{ return cscores.size(); }	
		
		int		width	(const vint& X);					// Number of bits needed to encode the value configurations over the set X.
	
	friend ostream& operator<<(ostream& os, const BD& x);	// Currently just prints out the data matrix.
	
	private:
		vint	r;							// Range sizes, i.e., number of values per variable. 
		vint	wid;						// Widths. Number of bits needed to encode the values.
		double 	ess = 1.0f;					// The equivalent sample size parameter for the BDeu score, default value 10.
		//int		maxindegree = 4;

		void	init 	(int m0, int n0);
		void	set_r	();
		void	set_r	(const vint& vr);
		
		double	score_hash32 (const vint& X);
		double	score_hash64 (const vint& X);
};

//////////////////
// Public methods:

double BD::scli(const vint& X){
	//return score_hash32(X);
	if (X.size() == 0) return 0;
	int w = width(X);
	if (w > 64){ std::cerr << "ERROR [BD::scli]: too large width of a query set. X.size = " << X.size() << ". Exit now.\n"; exit(1); }  
	double s; 
	if (!cscores.get(X, &s)){ 
		i64 membudget = maxmem * (1ULL << 27) / 16;
		if (cscores.size() > membudget){ cscores.clear(); cerr << " Clear c-scores" << endl; }
		if (w < 32)	s = score_hash32(X); 
		else 		s = score_hash64(X);
		cscores.insert(X, s); 
	}
	return s;
}

int BD::read(const vdat& datavec, int m0, int n0){
	init(m0, n0); // Sets m and n among other things.
	int j = 0; for (int t = 0; t < m; ++t){ for (int i = 0; i < n; ++i) data(i, t) = datavec[j++]; }
	set_r(); return 1;
}
// Read the data matrix. Assumes m0 datapoints over n0 variables, given in the order of variables.
int BD::dear(const vdat& datavec, int m0, int n0){
	init(m0, n0); // Sets m and n among other things.
	int j = 0; for (int i = 0; i < n; ++i){ for (int t = 0; t < m; ++t) data(i, t) = datavec[j++]; }
	set_r(); 
	return 1;
}
int BD::read(const string& fname){
	ifstream f; f.open(fname); if (f.fail()){ cerr << " Error in opening file: " << fname << endl; return 0; }
	vstr lines; for (string line; getline(f, line); ) lines.push_back(line); f.close();
	int m0 = lines.size() - 2; int n0 = 0; int j = 0; 
	vdat values; vint ranges;
	for (int t = 1; t < m0 + 2; ++t){ // Note: Skip the first line.
		sstream ss(lines.at(t)); int val; vint v;
		while (ss >> val){ v.push_back(val); if (ss.peek() == ',') ss.ignore(); } // Also a comma is a valid separator.
		if (t == 1){ ranges = v; n0 = v.size(); values.resize(m0 * n0); continue; }
		for (int i = 0; i < n0; ++i){
			int vati = v.at(i);
			if (vati < 0 || vati > ranges.at(i)){
				cerr << "\t BD:read: data value out of prescribed range. Exit now." << endl; exit(1);
			}	
			values[j++] = vati;
		}	
	}
	cerr << "\t BD::read: Successfully read file '" << fname << "': n = " << n0 << ", m = " << m0 << endl; 
	read(values, m0, n0); set_r(ranges); return 1;
}
int BD::dear(const string& fname){
	ifstream f; f.open(fname); if (f.fail()){ cerr << " Error in opening file: " << fname << endl; return 0; }
	vstr lines; for (string line; getline(f, line); ) lines.push_back(line); f.close();
	int n0 = lines.size(); int m0 = 0; int j = 0; vdat values;
	for (int i = 0; i < n0; ++i){
		sstream ss(lines.at(i)); int val; vint v;
		while (ss >> val){ v.push_back(val); if (ss.peek() == ',') ss.ignore(); } // Also a comma is a valid separator.
		if (i == 0){ m0 = v.size(); values.resize(m0 * n0); }
		for (int t = 0; t < m0; ++t) values[j++] = (Tdat) v.at(t);
	}
	cerr << "\t BD::dear: Successfully read file '" << fname << "': n = " << n0 << ", m = " << m0 << endl; 
	dear(values, m0, n0); return 1;
}

ostream& operator<<(ostream& os, const BD& x){
	int m = x.m;
	for (int t = 0; t < x.m; ++t){ for (int i = 0; i < x.n; ++i){ os << " " << x.data(i, t); } os << endl; }
	return os;
}

///////////////////
// Private methods:

void BD::init(int m0, int n0){
	m = m0; n = n0; dat.resize(n * m); r.resize(n); wid.resize(n); cscores.init(n);
}
int BD::width(const vint& X){ // How many bits occupied by the variables in c.
	int wc = 0; for (size_t j = 0; j < X.size(); ++j) wc += wid[X[j]]; return wc;
}
void BD::set_r(){ // Sets r and wid according to the data.
	for (int i = 0; i < n; ++i){
		r[i] = 0; 
		for (int t = 0; t < m; ++t){ 
			if (data(i, t) > r[i]) r[i] = data(i, t); 
		} 
		++r[i]; 
		int v = r[i] - 1; wid[i] = 0; while (v) { ++wid[i]; v >>= 1; } 
	}
}
void BD::set_r(const vint& vr){ // Sets r and wid according to the given vector.
	for (int i = 0; i < (int) vr.size(); ++i){ 
		r[i] = vr.at(i); 
		int v = r[i] - 1; wid[i] = 0; while (v) { ++wid[i]; v >>= 1; }
	}
}

double BD::score_hash32(const vint& X){ // By direct hashing in one phase
	vu32 z(m);
	for (int t = 0; t < m; ++t) z[t] = data(X[0], t);
	for (int i : X){
		uint8_t l = wid[i];
		for (int t = 0; t < m; ++t){ u32 v = z[t]; v <<= l; v |= data(i, t); z[t] = v; }
	}

	HashCounter h(m);
	for (auto k : z) h.insert(k);
	int maxc = h.maxcount();
	double q = 1; for (auto i : X) q *= r[i];
	double essq = ess / q ;	
	double baslg = lgamma(essq); double s = lgamma(ess) - lgamma(m + ess);	
	for (int c = 1; c <= maxc; ++c) if (h.freq(c)){ s += h.freq(c) * (lgamma(c + essq) - baslg); }
	return s;
}

double BD::score_hash64(const vint& X){ // By direct hashing in one phase
	vu64 z(m);
	for (int t = 0; t < m; ++t) z[t] = data(X[0], t);
	for (int i : X){
		uint8_t l = wid[i];
		for (int t = 0; t < m; ++t){ u64 v = z[t]; v <<= l; v |= data(i, t); z[t] = v; }
	}

	HashCounter h(m);
	for (auto k : z) h.insert(k);
	int maxc = h.maxcount();
	double q = 1; for (auto i : X) q *= r[i];
	double essq = ess / q ;	
	double baslg = lgamma(essq); double s = lgamma(ess) - lgamma(m + ess);	
	for (int c = 1; c <= maxc; ++c) if (h.freq(c)){ s += h.freq(c) * (lgamma(c + essq) - baslg); }
	return s;
}

#undef data
#endif
