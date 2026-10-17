// 
// 1 Nov 2024, Mikko Koivisto
//
// Class Wsets implements a data structure for storing (set, weight) pairs. 
//
// As an internal set representation uses one of the following two options:
// - 64-bit word (uint64_t)	: any subset of {1, ..., 64} represented as a bitmap
// - four 64-bit words : any subset of {1, ..., 2^16} of size at most 16
// In this way we can use an existing hashmap in a relatively straightforward manner.
//


#ifndef WSETS_HPP
#define WSETS_HPP

#include <iostream>
#include <unordered_map>

using u16  = uint16_t;
using u64  = uint64_t;
using bmap = u64;

#define HAS(x) std::hash<u64>()(x)

union  bx16 { u64 s[4]; u16 e[16]; bool operator==(const bx16& S) const { return s[0]==S.s[0] && s[1]==S.s[1] && s[2]==S.s[2] && s[3]==S.s[3]; } }; 
struct has4 { size_t operator()(const bx16& S) const { return HAS(S.s[0]) ^ HAS(S.s[1]) ^ HAS(S.s[2]) ^ HAS(S.s[3]); } }; 

bmap make_bmap (const vint& X) { bmap S = 0L; for (int i : X){ S |= (1L << i); } return S; }
bx16 make_bx16 (const vint& X) { bx16 S = { 0L, 0L, 0L, 0L }; int j = 0; for (int i : X){ S.e[j++] = i + 1; } return S; }

#define UMAP std::unordered_map

class Wsets {
    public:
		void clear	()         { M1.clear(); M4.clear(); }	
		int  size	()		   { if (small) return M1.size(); return M4.size(); }
		double  load_factor	() { if (small) return M1.load_factor(); return M4.load_factor(); }
		int max_bucket_size () { if (small) return max_bucket_size(M1); return max_bucket_size(M4); }
		void init	(int n0)   { n = n0; small = (n <= 64); if (small) M1.reserve(1ULL << 16); else M4.reserve(1ULL << 16); }
		
		void insert	(const vint& X, double val){ 
			if (small)	{ bmap S = make_bmap(X); M1.insert({ S, val }); }
			else		{ bx16 S = make_bx16(X); M4.insert({ S, val }); }
		}
		bool get  	(const vint& X, double* val){
			if (small){ 
				bmap S = make_bmap(X); i1 = M1.find(S); if (i1 == M1.end()){ return false; } 
				*val = i1->second; return true;
			} else { 
				bx16 S = make_bx16(X); i4 = M4.find(S); if (i4 == M4.end()){ return false; } 
				*val = i4->second; return true;
			}
		}
		double get	(const vint& X){
			double val; get(X, &val); return val;
		}	
		void demo	(){
			using namespace std;
			cout << "\t Wsets::demo():" << endl;
			bx16 S = { 0L, 0xffff, 2L, 0x0ffffffff };
			cout << "\t\t S:";
			for (int i = 0; i < 16; i++){
				cout << " " << S.e[i];
			}
			cout << endl;
		}	
    private:
		int										n;		// Assumes the stored sets are subsets of {0, 1, 2, ..., n - 1}.
		bool									small;	// True if n <= 64 and false otherwise.
		UMAP < bmap, double >  					M1;		// Currently only supports small ground sets, using the 64-bit bmap.
		UMAP < bmap, double >::iterator			i1;		// Iterator. Yes, STL containers force us to use one, unfortunately.
		UMAP < bx16, double, has4 >  			M4;		// Supports ground sets of 2^16 - 1 elements, but only subsets of 16 or fewer elements.
		UMAP < bx16, double, has4 >::iterator	i4;		// Iterator. Yes, STL containers force us to use one, unfortunately.

		template<class T> int max_bucket_size(T& M);
};

template<class T>
int Wsets::max_bucket_size(T& M){
	int maxbc = 0;
	for (int i = 0; i < (int) M.bucket_count(); i++){
		maxbc = std::max(maxbc, (int) M.bucket_size(i));
	}
	return maxbc;
}

#undef HAS
#undef UMAP
#endif
