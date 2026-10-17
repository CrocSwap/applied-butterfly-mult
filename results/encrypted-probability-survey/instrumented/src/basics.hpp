//
// 27 Nov 2024, Mikko Koivisto
//

#ifndef BASICS_HPP
#define BASICS_HPP

#include <iostream>
#include <fstream> 
#include <sstream>
#include <string>
#include <map>
#include <functional> 
#include <iomanip> 
#include <vector>
#include <bit>
#include <bitset>
#include <memory>		// shared_ptr
#include <limits>
#include <random>

// MACROS

#define FIXED_F(x, w, p)	std::setw(w) << std::right << std::fixed << std::setprecision(p) << (x)
#define FIXED_FLOAT(x)		std::setw(5) << std::right << std::fixed << std::setprecision(0) << (x)
#define FIXED_INT(x)		std::setw(5) << std::right << (x)

// TYPES ETC. KEYWORD "using" PRFERRED OVER the OLDER "typedef"

using string	= std::string;
using ostream	= std::ostream;
using ifstream	= std::ifstream;
using ofstream	= std::ofstream;
using sstream	= std::stringstream;

using vboo		= std::vector<bool>;
using vint		= std::vector<int>;
using vdou		= std::vector<double>;
using vstr		= std::vector<string>;

using u8		= uint8_t;
using u16		= uint16_t;
using u32		= uint32_t;
using u64		= uint64_t;

using b64		= std::bitset<  64>;
using b256		= std::bitset< 256>;
using b1024		= std::bitset<1024>;

struct plon { long a; long b; };

using std::cout;	using std::cerr;	using std::endl;

// CONSTANTS

const double infdouble = std::numeric_limits<double>::infinity();

// GLOBAL VARIABLES

bool debug = false;

// RANDOM NUMBERS

std::random_device rd;  					// Will be used to obtain a seed for the random number engine.
std::mt19937 gen(12); //rd()); 			// Standard mersenne_twister_engine seeded with rd().
std::uniform_real_distribution<> myunif(0.0, 1.0);

inline double urnd()			{ return (double) myunif(gen); }
inline double rint(int b) 		{ return std::min( (int) std::floor( urnd() * (b + 1) ), b ); }
inline double rin2(int a, int b){ return std::min( (int) std::floor( a + urnd() * (b - a + 1) ), b ); }
inline int    geom(double p)	{ return (int) std::floor(std::log( urnd() ) / std::log(1 - p) ); }

// BITSET MANIPULATION

template<typename T>
T make_bitset(const vint& set){ T b = 0; for (auto x : set) b[x] = 1; return b; }

template<typename T>
vint make_vint(const T b, int n){ vint set; set.reserve(n); for (int i = 0; i < n; i++) if (b[i]) set.push_back(i); return set; }

inline int bitcount(u64 x){ int c = 0; while (x){ c += x & (u64) 1; x >>= 1;} return c; }	// Not super fast. 

// PRINTING 

void print(ostream& os, const vint& v){
	using namespace std;
	os << " vec(" << v.size() << "): ";
	for (auto x : v) os << " " << x;
	os << endl;
}
void print(ostream& os, const vint& v, double w){
	using namespace std;
	os << "\t weight: " << FIXED_F(w, 7, 1) << ", vec: ";
	for (auto x : v) os << " " << x;
	os << endl;
}

// PERMUTATIONS

void rperm(vint& A){
	int n = A.size();
	for (int i = 1; i < n; i++){
		int j = rint(i);
		auto tmp = A[i]; A[i] = A[j]; A[j] = tmp;
	}
}

// ORDERED ARRAYS

inline void insert_sorted(int item, const vint& A, vint& B){
	int d = A.size(); B.resize(1 + d);
	int j = 0; while (j < d && A[j] < item){ B[j] = A[j]; j++; } B[j] = item; while (j < d){ B[j + 1] = A[j]; j++; } 
}

inline void add_ord_strict_db(int v, vint& L){
	std::cerr << "\t add_ord_strict_db: v = " << v << ", L.size() = " << L.size(); print(std::cerr, L);
	int s = L.size(); 
	int t = s; while (t > 0 && L[t - 1] > v){ t--; }
	std::cerr << "\t add_ord_strict_db: t = " << t; print(std::cerr, L);
	if (t && L[t-1] == v) return; // No change, as v was already in L.
	std::cerr << "\t add_ord_strict_db: t = " << t; print(std::cerr, L);	
	L.resize(s+1);
	while (s > t){ L[s] = L[s-1]; s--; } L[t] = v;
}

inline void add_ord_strict(int v, vint& L){
	//std::cerr << "\t add_ord_strict: v = " << v << ", L.size() = " << L.size(); print(std::cerr, L);
	int s = L.size(); 
	int t = s; while (t > 0 && L[t-1] > v){ t--; }
	if (t && L[t - 1] == v) return; // No change, as v was already in L.
	L.resize(s+1);
	while (s > t){ L[s] = L[s-1]; s--; } L[t] = v;
}

inline void rem_ord_strict(int v, vint& L){
	int s = L.size(); 
	int t = 0; while (t < s && L[t] < v){ t++; }
	if (t == s) return;			// No change, as v was not in L.
	while (t < s-1){ L[t] = L[t+1]; t++; }
	L.resize(s-1);	
}

// HASHING

class vinthas {
	public:
		std::size_t operator()(const vint& vec) const {
  			std::size_t seed = vec.size();
  			for(auto& i : vec){ seed ^= i + 0x9e3779b9 + (seed << 6) + (seed >> 2); }
  			return seed;
		}
};


#endif
