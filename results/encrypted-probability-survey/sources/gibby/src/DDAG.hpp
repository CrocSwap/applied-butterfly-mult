//
// 1 Feb 2025, Mikko Koivisto 
//
// Class DDAG implements a dynamic DAG structure.
//
// Can add and remove single arcs, as well as replace entire parent sets.
// Maintains the ancestor relation to support fast queries.
//
// The algorithms follow those described, e.g., by Giudici & Castelo (2003).  
//
// Can also be used in a static mode, in which case ancestor queries are 
// answered by a one- or bidirectional breadth-first search. 
//
// Can return the ancestors or descendants of a given node.
//
// References: 
// - P. Giudici, R. Castelo: 
//   Improving Markov chain Monte Carlo model search for data mining. 
//   Mach. Learn. 50(1–2): 127–158 (2003).
//
// Notes:
// - Compile with options enabling auto-vectorization to get the max speed.
//   E.g., for gcc: -Ofast -march=native -msse4.2 -mavx512f
// - For reading this file, use tab width 4.

#ifndef DDAG_HPP
#define DDAG_HPP

#include <iostream> 
#include <iomanip> 
#include <cstring>
#include <cmath> 
#include <vector>
#include <queue>
#include <stack>
#include <memory>		// shared_ptr
#include <random>

typedef uint8_t				u8;
typedef uint32_t			u32;
typedef uint64_t			u64;
typedef std::vector<int>	vint;
typedef std::vector<bool>	vboo;
typedef std::vector<char>	vcha;
typedef std::vector<u64>	vu64;
typedef std::vector<vint>	vvin;
typedef std::string			string;


#define DDAG_DEBUG		false

#define at(A, i, j)		A[ i * nblocks + (j >> 6) ]
#define bm(j)			( 1ULL << (j & 63) )
#define on(A, i, j)		( at(A, i, j) & bm(j) )
#define flip(A, i, j)	at(A, i, j) ^= bm(j)

// Comment: For a cleaner implementation, consider introducing and using a Bitvec class, like std::bitset but with dynamic length.

class DDAG {
	public:
		int n;		// Number of nodes. Note: assumed to be static, but not checked.
		int m;	
		
		DDAG()					{ }
		DDAG(int n0, bool mode0){ init(n0, mode0); }		
		DDAG(int n0) : DDAG(n0, true){}
		~DDAG();
		void init(int n0, bool mode0);

		void turn_static(){ dyn = false; }	// Simply ignore the data structures constructed so far.
		void turn_dynamic();				// Compute from scratch the needed data structures.
		bool is_static() { return !dyn; }	//
		bool is_dynamic(){ return  dyn; }	//
		
		void clear();						// Removes all arcs and sets all data structures accordingly.
		void input(vboo& am);				// Reads the DAG from the given vector.
		
		bool arc(int i, int j);				// Is arc ij present?
		bool anc(int i, int j);				// Is i an ancestor of j?
		bool anx(int i, int j);				// Is i an ancestor of j even after removing arc ij?
	
		void add(int i, int j);				// Add arc ij. Assumes arc ij was absent.
		void rem(int i, int j);				// Remove arc ij. Assumes arc ij was present.
		void rep(const vint& par, int j);	// Replace the parent set of j by par; faster than thru rem and add.
		
		bool anc_opt(int i, int j, int alg);// Is i an ancestor of j? Use algorithm alg: 0 = precomputed; 1 = BFS; 2 = BF2 (bidir).
		
		void rarc(int& i, int& j);			// Replaces ij by a random arc.
		void rnode(int& i);					// Replaces i by a random node.
		//void nondes(int u, vint& ndv){}		// Replaces ndv by the non-descendants of u. 
				
		vint ancestors(int v);				// Returns the ancestors of node v.
		vint descendants(int u);			// Returns the descendants of node u.
		
		void req();							// Replaces the DAG by a random Markov equivalent DAG.
		
		void printA();
		void printC();
		void printP();
		void printDAG(std::ostream& os);
		void printR();
		string strP();

		vvin P;								// Adjacency list: parents of each node.
		vvin C;								// Adjacency list: children of each node.

		u64	 uccgsizes[256] = { 0 };
		
	private:
		bool dyn;		// false = static; true = dynamic (default).
		vu64 A;			// Adjacency matrix. Note: bitmap representation.
		vu64 R;			// Transitive closure. Note: each node's ancestors represented by an array of 64-bit words.
		int  nblocks;	// Number of 64-bit blocks needed per node.
		
		vvin nbr;		// For getting UCCGs; reserving memory during the algorithm is an efficiency bottleneck.
		vint ord;		// For nodes sorted in topological order; avoids reserving dynamic memory repeatedly.
		bool print_op = DDAG_DEBUG;	// For debugging.
		
		bool bfs(int i, int j); 					// Decides whether i is an ancestor of j using a simple BFS.
		bool bf2(int i, int j); 					// Using a bidirectional BFS.
		bool dfs(int i, int j);						// A DFS.
		bool df2(int i, int j);						// A DFS variant.
		
		void dfs(int v, vboo& mark, vint &ord);		// A recursive DFS to toposort desc of v.
		void reR(int j);							// Updates R by going through the descendant of v.
		void reR(vint& ord);						// Updates R by going through nodes in order ord.
				
		void bfr(int j, vint& S, const vvin& Rel);	// Adds to S to the elements in the closure of R, from j.
		void checkP(int op, int j); 				// Does P correspond to A? For debugging.

		void compute_nbr();							// Part 1 of req(); Chickering's (1995) algorithm for DAG to CPDAG.
};

using DDAG_ptr = std::shared_ptr<DDAG>;				// A typedef.

std::random_device DDAG_rd;  						// Will be used to obtain a seed for the random number engine.
std::mt19937 DDAG_g(123); //DDAG_rd()); 					// Standard mersenne_twister_engine seeded with rd().
std::uniform_real_distribution<> DDAG_u(0.0, 1.0);	// Standard uniform distribution.

#define URND		(double) DDAG_u(DDAG_g)
#define RINT(b) 	std::min( (int) std::floor( URND * (b + 1) ), b )
#define RIN2(a, b) 	std::min( (int) std::floor( a + URND * (b - a + 1) ), b )

// Implementation below.

// *****
// Generic functions. May cause issues if there are other functions with the same names.
// *****

inline void add_ord(int v, vint &L){
	int s = L.size(); L.resize(s+1);
	int t = s; while (t > 0 && L[t-1] > v){ L[t] = L[t-1]; t--; } L[t] = v;	
}

inline void rem_ord(int v, vint &L){
	int s = L.size(); 
	int t = 0; while (t < s && L[t] < v){ t++; } while (t < s-1){ L[t] = L[t+1]; t++; }
	L.resize(s-1);	
}

inline void vadd_ord(const vint& V, vint& L){
	//for (auto v : V) add_ord(v, L);
	
	int t = V.size(), s = L.size(), r = s + t;
	L.resize(r);
	t--; s--; r--;
    while (t >= 0 && s >= 0){
		if (V[t] > L[s]) L[r--] = V[t--];
		else 			 L[r--] = L[s--];
    }
    while (t >= 0) L[r--] = V[t--];
}
inline void vrem_ord(const vint& V, vint& L){
	if (V.size() == 0) return;
	int s = 0, t = 0, r = 0;
	while (t < (int) V.size()){
		if (V[t] == L[s]) t++;
		else			  L[r++] = L[s];
		s++;
	}
	while (s < (int) L.size()) L[r++] = L[s++];
	L.resize(r);
}

// This macro enables using fast memory allocated from stack in compile time.
#define TORD\
	int lord = 0;\
	for (int j = 0; j < n; j++){\
		if (mark[j]) continue;\
		int t = 0;\
		stck[t++] = j; mark[j] = true;\
		while (t){\
			int u = stck[--t]; ord[lord++] = u;\
			for (auto v : rel[u]){ if (!mark[v]){ stck[t++] = v; mark[v] = true; } }\
		}\
	}\
	
void tsort(int u, const vvin& rel, vboo& vis, vint& ord){
	vis[u] = true;
	for (auto v : rel[u]) if (!vis[v]) tsort(v, rel, vis, ord);
	ord.push_back(u);
}
// The entire graph. Uses a stack (DFS). Note: try avoid reserving dynamic memory, which is slow.
void tord(const vvin& rel, vint& ord){
	int n = rel.size();
	vboo vis(n); ord.clear(); ord.reserve(n);
	for (int j = 0; j < n; j++){
		if (!vis[j]) tsort(j, rel, vis, ord); 
	}

/*
	if      (n <=   64)	{ bool mark[  64] = { 0 }; int stck[  64];  TORD; }	
	else if (n <=  256)	{ bool mark[ 256] = { 0 }; int stck[ 256];  TORD; }
	else if (n <= 1024) { bool mark[1024] = { 0 }; int stck[1024];  TORD; } 
	else 				{ vboo mark(n); vint stck; stck.reserve(n); TORD; }
*/
}
#undef TORD

// *****
// Public functions below
// *****

void DDAG::init(int n0, bool mode0){
	dyn = mode0; n = n0; clear();
}

void DDAG::clear(){
	m = 0; C.clear(); C.resize(n); P.clear(); P.resize(n);  
	nblocks = 1 + (n >> 6); A.clear(); A.resize(n * nblocks); R.clear(); R.resize(n * nblocks); 
	for (int j = 0; j < n; j++) at(R, j, j) |= bm(j); // The diagonal.

	nbr.clear(); nbr.resize(n); for (auto& vec : nbr) vec.reserve(8); // Reserve some space. 
	ord.clear(); ord.resize(n);
}

void DDAG::input(vboo& am){
	// Assumes am is of size n x n.
	bool olddyn = dyn;
	if (olddyn) turn_static();
	int z = 0;
	A.clear(); A.resize(n * nblocks);
	for (int j = 0; j < n; j++){P[j].clear(); C[j].clear(); }
	for (int j = 0; j < n; j++){
		for (int i = 0; i < n; i++){
			if (am[z]){
				at(A, j, i) |= bm(i); 
				P[j].push_back(i);
				C[i].push_back(j);
				m++;
			}
			z++;
		}
	}
	if (olddyn) turn_dynamic();
}

DDAG::~DDAG(){ }

inline bool DDAG::arc(int i, int j){ return (bool)( on(A, j, i) ); }

inline bool DDAG::anc(int i, int j){ 
	if (dyn) return (bool)( on(R, j, i) );
	else return anc_opt(i, j, 2); 
}

inline bool DDAG::anx(int i, int j){ // Is i an ancestor of any parent of j other than i? Check the right bit only after an OR over parents.
	if (dyn){
		u64 a = 0L;
		for (const int u : P[j]) if (u != i) a |= at(R, u, i); 
		return (bool)(a & bm(i) );
	} 
	else return anc_opt(i, j, -2);	  
}

inline void DDAG::add(int i, int j){ 
	if (print_op) std::cout << " add(" << i << ", " << j << ") \n";
	if (arc(i, j)) return;
	at(A, j, i) |= bm(i); m++; 
	add_ord(j, C[i]); 
	add_ord(i, P[j]);	
	
	if (dyn){
		// Update T by going thru all descendants of j.
		for (int v = 0; v < n; v++){
			if (on(R, v, j)){	// v is a descendant of j.
				for (int b = 0; b < nblocks; b++) R[v * nblocks + b] |= R[i * nblocks + b];
			}	
		}
	}
}

inline void DDAG::rem(int i, int j){
	if (print_op) std::cout << " rem(" << i << ", " << j << ") \n"; 
	if (!arc(i, j)) return;
	at(A, j, i) &= ~bm(i); m--; 
	rem_ord(j, C[i]); rem_ord(i, P[j]);
	if (dyn) reR(j);	// Update R.
}

inline void DDAG::rep(const vint& par, int j){	
	for (const int u : P[j]){ rem_ord(j, C[u]); at(A, j, u) &= ~bm(u); m--; }	// Update A and C.
	for (const int u :  par){ add_ord(j, C[u]); at(A, j, u) |=  bm(u); m++; }	// Update A and C.
	P[j] = par;			// Update P[j].
	if (dyn) reR(j);	// Update R for j and its descendants.
}

inline bool DDAG::anc_opt(int i, int j, int alg){
	switch (alg){
	case 0: return anc(i, j); break;
	case 1: return bfs(i, j); break;
	case 2: return bf2(i, j); break;
	case 3: return dfs(i, j); break;
	case 4: return df2(i, j); break;
	case -1: { rem_ord(j, C[i]); rem_ord(i, P[j]); bool a = bfs(i, j); add_ord(j, C[i]); add_ord(i, P[j]); return a; } break;
	case -2: { rem_ord(j, C[i]); rem_ord(i, P[j]); bool a = bf2(i, j); add_ord(j, C[i]); add_ord(i, P[j]); return a; } break;
	default: return true;
	}
}

void DDAG::rarc(int& i, int& j){
	int r = RIN2(1, m);
	int count = 0; int s = 0; int t = 0;
	while (count < r) count += P[s++].size();
	j = s - 1;
	while (count > r + t) t++;
	i = P[j][t];
}
void DDAG::rnode(int& i){
	i = RIN2(0, n - 1);
}

vint DDAG::ancestors(int v){
	vint av; av.reserve(n);
	if (dyn){
		int u = 0;
		for (int b = 0; b < nblocks; b++){
			for (int q = 0; q < 64; q++){
				if (R[v * nblocks + b] & (1L << q)) av.push_back(u);
				u++;
			}
		}
	}
	else bfr(v, av, P);	
	return av;
}

vint DDAG::descendants(int u){
	vint dv; dv.reserve(n);
	if (dyn){
		for (int v = 0; v < n; v++){
			if (on(R, v, u)) dv.push_back(v);
		}
	}	
	else bfr(u, dv, C);
	return dv;
}

void DDAG::turn_dynamic(){
	dyn = true;
	// Recompute T.
	// First get a topological sort.
	vint ord; ord.reserve(n);
	vboo mark; mark.resize(n);
	for (int v = 0; v < n; v++) if (!mark[v]) dfs(v, mark, ord);
	// Then take unions of ancestors.
	reR(ord);
}

// Selected speed measurements, #runs/ms (laptop power mode)
//	#nodes	#arcs		Total	Part 1	arcsort	nodesort
//
//	64 		96			614		783		1263	1744
//	128		256			214		260		480		699
//	512		1280		36		38		88		136
// 
void DDAG::req(){
	compute_nbr();
}

void DDAG::printA(){
	using namespace std;
	cout << "\tA/ "; for (int i = 0; i < n; i ++){ cout << " " << i; } cout << "\n";
	for (int j = 0; j < n; j++){
		cout << "\t" << right << setw(2) << j << ": "; for (int i = 0; i < n; i++){ cout << " " << arc(i, j); } cout << "\n";
	}
	cout << "\n";
}
void DDAG::printC(){
	using namespace std;
	cout << "\tC/ \n";
	for (int j = 0; j < n; j++){
		int s = C[j].size();
		cout << "\t" << j << ": "; for (int t = 0; t < s; t++){ cout << " " << C[j][t]; } cout << "\n";
	}
	cout << "\n";
}
void DDAG::printP(){
    using namespace std;

    for (int j = 0; j < n; j++){
        if (P[j].empty()) continue;  

        int s = P[j].size();
        cout << "\t" << j << ": ";
        for (int t = 0; t < s; t++){
            cout << " " << P[j][t];
        }
        cout << "\n";
    }
    cout << "\n";
}
void DDAG::printDAG(std::ostream& os){
    for (int j = 0; j < n; j++){
        if (P[j].empty()) continue;

        os << "\t" << j << ": ";
        for (size_t t = 0; t < P[j].size(); t++){
            os << " " << P[j][t];
        }
        os << "\n";
    }
    os << "\n";
}
void DDAG::printR(){
	using namespace std;
	cout << "\tR/ "; for (int i = 0; i < n; i ++){ cout << " " << i; } cout << "\n";
	for (int j = 0; j < n; j++){
		cout << "\t" << j << ": "; for (int i = 0; i < n; i++){ cout << " " << anc(i, j); } cout << "\n";
	}
	cout << "\n";
}
string DDAG::strP(){
	using namespace std;
	string s;
	for (int v = 0; v < n; v++){
		s += " " + to_string(v) + ":";
		for (auto u : P[v]){
			s += " " + to_string(u);
		}
	}
	return s;
}

// *****
// Private functions below.
// *****

void DDAG::bfr(int j, vint& S, const vvin& Rel){	// Adds to S to the elements in the closure of Rel, from j.
	vboo mark(n);
	std::queue<int> q;	// push, pop, back, front, size, empty
	q.push(j);
	int v = j;
	while (!q.empty()){
		v = q.front(); q.pop();
		S.push_back(v);
		for (const int u : Rel[v]) if (!mark[u]){ q.push(u); mark[u] = true; }
	} 
}

bool DDAG::bfs(int i, int j){
	vboo mark(n);
	std::queue<int> q;	// push, pop, back, front, size, empty
	q.push(j);			// Search towards ancestors.
	while (!q.empty()){
		int v = q.front(); q.pop();		
		if (mark[v]) continue;
		if (v == i) return true;
		mark[v] = true;
		for (const int u : P[v]) q.push(u);
	}
	return false;
}

bool DDAG::bf2(int i, int j){
	vboo mar1(n), mar2(n);
	std::queue<int> q1, q2;	// push, pop, back, front, size, empty
	q1.push(j); q2.push(i);	// bidirectional search
	bool found = (i == j);
	mar1[j] = true; mar2[i] = true;
	while (true){
		if (q1.empty()) break;
		int v = q1.front(); q1.pop();
		if (mar2[v]) return true;
		for (const int u : P[v]) if (!mar1[u]){ q1.push(u); mar1[u] = true; }
		
		if (q2.empty()) break;
		int u = q2.front(); q2.pop();
		if (mar1[u]) return true;
		for (const int v : C[u]) if (!mar2[v]){ q2.push(v); mar2[v] = true; }
	} 
	return found;
}


bool DDAG::dfs(int i, int j){
	std::stack<int> s;
	vboo mark(n);
	s.push(i);
	while (!s.empty()){
		int u = s.top(); s.pop();
		if (u == j) return true;
		if (mark[u]) continue;
		mark[u] = true;
		for (const int v : C[u]) s.push(v);
	}
	return false;
}

bool DDAG::df2(int i, int j){
	vint s(n); 
	int t = 0;
	vboo mark(n);
	s[t++] = i;
	while (t){
		int u = s[--t];
		if (u == j) return true;
		if (mark[u]) continue;
		mark[u] = true;
		for (const int v : C[u]) s[t++] = v;
	}
	return false;
}

void DDAG::dfs(int v, vboo& mark, vint &ord){
	if (mark[v]) return;
	for (const int u : C[v]) dfs(u, mark, ord);
	mark[v] = true; ord.push_back(v);
}

void DDAG::reR(int j){	
	vboo mark(n);
	vint ord;
	dfs(j, mark, ord);	
	reR(ord);
}

void DDAG::reR(vint& ord){
	for (int t = ord.size(); t > 0; t--){
		int v = ord[t-1];
		for (int b = 0; b < nblocks; b++){ R[v * nblocks + b] = 0L; } 
		at(R, v, v) |= bm(v);	// Clear. Keep the diagonal!		
		for (const int u : P[v]){
			for (int b = 0; b < nblocks; b++) R[v * nblocks + b] |= R[u * nblocks + b]; // Union of the parents' ancestors.
		}
	}
}

void DDAG::checkP(int op, int j){ 			// Does P correspond to A?
	bool isgood = true;
	// Cardinality check.
	int s = 0; for (int i = 0; i < n; i++) s += (int)arc(i, j);
	isgood = (s == (int)P[j].size());
	if (!isgood){
		if (op == 0) std::cout << " ERROR in rem.\n";
		if (op == 1) std::cout << " ERROR in add.\n";
		exit(1);
	}
}

void DDAG::compute_nbr(){
	using namespace std;
	// Compute a CPDAG using Chickering's algorithm, the notation y, x, w, ... from the papers ***
	// First get a topological sort.
	// remember that ord is a private member in a DDAG; no need to reserve memory repeatedly.
	tord(C, ord);
	// Then sort the arcs.
	vint F; F.reserve(m);	// F contains all in the same vector; m arcs, represented by tail nodes.
	vint p; p.reserve(n);	// Pointers, as numbers of elements already inserted.
	int prev = 0;
	for (int t = n-1; t >= 0; t--){ int u = ord[t]; p[u] = prev; prev += P[u].size(); }	
	for (auto u : ord){ for (auto v : C[u]) F[p[v]++] = u; }

	// Next label arcs.
	vboo reve(m, false);	// Reversible arcs.
	vboo mark; mark.reserve(n);
	for (auto& vec : nbr) vec.clear();	// Clear nbr for each node; note that some memory has already been reserved!
	int s = 0;
	for (int t = n-1; t >= 0; t--){
		int y = ord[t];
		for (auto x : P[y]) mark[x] = false;	// Mark every x unvisited, i.e., "unknown".
		while (s < p[y]){						// Starting from the lowest-order parents x of y. 	
			int x = F[s++];
			if (mark[x]) continue;
			for (int i = p[x] - (int)P[x].size(); i < p[x]; i++){ // The parents of x: in X from p[x]-1 down to p[x] - P[x].size().
				if (reve[i]) continue; // Only consider compelled arcs. Every arc into x is either compelled or reversible.
				int w = F[i];
				if (!arc(w, y)){ s = p[y]; goto NEXTY; }
				mark[w] = true; // Else-branch.
			}
			bool zexists = false;
			for (auto z : P[y]) if (z != x && !arc(z, x)){ zexists = true; break; }	
			if (zexists) { s = p[y]; break; }
			reve[s-1] = true; nbr[y].push_back(x); nbr[x].push_back(y); 
			while (s < p[y]){ 
				int z = F[s++]; 
				if (!mark[z]){ reve[s-1] = true; nbr[y].push_back(z); nbr[z].push_back(y); } 
			}
		}		
		NEXTY: ;
	}	
}


#undef at
#undef bm
#undef on
#undef flip
#undef URND
#undef RINT
#undef RIN2
#undef DDAG_DEBUG

#endif
