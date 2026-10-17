//
// 22 Feb 2025, Mikko Koivisto
//
// Note: For reading the code, use tab width 4.

#ifndef Gibby_HPP
#define Gibby_HPP

#include <random>
#include <unordered_map>
#include "basics.hpp"
#include "Scorer.hpp"
#include "SumTree.hpp"
#include "DDAG.hpp"


using Treal	= double;
using vrea	= std::vector< Treal >;
using vsts	= std::vector< SumTree< Treal > >;
using sptr 	= Scorer_ptr;
using dptr 	= DDAG_ptr;

#define UMAP std::unordered_map

struct MoveStat {
	long tot = 0;	// #steps taken.
	long pro = 0;	// #moves proposed.
	long padd = 0;	// #proposed add.
	long prem = 0;	// #proposed rem.
	long prev = 0;	// #proposed rev.
	long acc = 0;	// #accepted proposal.
	long aadd = 0;	// #accepted add
	long arem = 0;	// #accepted rem
	long arev = 0;	// #accepted rev
	void zero() { *this = { 0, 0, 0, 0, 0, 0, 0, 0, 0 }; }
};

class Gibby {
	public:		
		plon sim (int t);					// Simulate t steps.
		plon sGC (int t);					// Simulate t steps the Giudici–Casteloni algorithm.
		void rnd (int& i, int& j);			// Draw a random node pair ij.
		void rem (int i, int j);			// Remove arc ij.
		void add (int i, int j);			// Add arc ij.
		void rev (int i, int j);			// Reverse arc ij.
		void rep (const vint& P, int j);	// Replace the parent set of j by P.
		void ref ();						// Refreshes the SumTree objects based on the current DAG.
		
		void init(sptr sco, dptr dag);		// Initialize.
		int	 test();
		void info();
		string info(int id);		
		void zero(int id){ if (id) statg.zero(); else statGC.zero(); }		// Zeroes all statistics.
		
	private:
		void upd (int j);					// The major, shared part of rem(i, j) and add(i, j).
	
		int		n;		// Number of nodes.
		double	q;		// Currently just the constant of the uniform prior, q = 1/(n(n-1))
		vsts	b;		// One SumTree object per node, and one for the marginals.
		dptr	d;		// The DAG. Maybe an overly heavy tool, but does the job.
		sptr	s;	// Scorer.
		UMAP < vint, vrea, vinthas >  			hm;						// 
		UMAP < vint, vrea, vinthas >::iterator	it;						// Iterator. Yes, STL containers force us to use one, unfortunately.		
		static const long						max_nbytes = 1UL << 32;	// Max size of the map in bytes: 4 GiB.

		MoveStat								statg;
		MoveStat								statGC;
};

#define URND		urnd()
#define RINT(b) 	rint(b)
#define RIN2(a, b) 	rin2(a, b)
#define GEOM(p)		geom(p)

void Gibby::init(sptr sco, dptr dag){
	s = sco;
	n = s->n;
	d = dag;	// Has been intialized already.
	
	// Next initialize all sumtrees. This code need not be particularly fast.
	// Since the DAG is empty, every ij corresponds to adding arc ij.
	b.resize(n + 1);
	q = 1.0 / (n * (n - 1));
	vrea w(n);
	for (int j = 0; j < n; j++){
		// Init s[j]. The weight of ij = b_ij = q_ij min{ 1, f*(G_ij)/f(G) }.
		// Let q_ij = q. Then b_ij = q min{ 1, f_j({i})/f_j({}) }
		for (int i = 0; i < n; i++){ 
			if (i == j){
				w[i] = 0;
			} else {
				vint P(0); vint Q(1); Q[0] = i;
				double scodiff = s->sfam(j, Q) - s->sfam(j, P);
				w[i] = q * std::min(1.0, exp(scodiff));
			}
		}
		b[j].init(w);
	}
	// The marginal will be in b[n]. Get w by asking the the sums of each b[j].
	for (int j = 0; j < n; j++) w[j] = b[j].sum();
	b[n].init(w);
}
void Gibby::ref(){
	// Assume init done, so s, n, d, s, q, etc. available.
	// Note the DAG can be anything.
	vrea w(n);
	for (int j = 0; j < n; j++){
		// Init s[j]. The weight of ij = b_ij = q_ij min{ 1, f*(G_ij)/f(G) }.
		// Let q_ij = q. Then b_ij = q min{ 1, f_j({A'_j})/f_j(A_j) f_i({A'_i})/f_i(A_i) }
		for (int i = 0; i < n; i++){ 
			if (i == j) { w[i] = 0; continue; } 
			int movetype = d->arc(i, j) + 2 * d->arc(j, i);
			vint Pj = d->P[j]; vint Qj = Pj;			
			vint Pi = d->P[i]; vint Qi = Pi;
			switch (movetype){
				case 0: add_ord_strict(i, Qj); 						  break;	// Add ij.
				case 1: rem_ord_strict(i, Qj); 						  break;	// Rem ij.
				case 2: rem_ord_strict(j, Qi); add_ord_strict(i, Qj); break;	// Rev ji to ij.
			}
			double scodiff = s->sfam(j, Qj) - s->sfam(j, Pj) + s->sfam(i, Qi) - s->sfam(i, Pi);
			Treal b_ij = q * std::min( 1.0, exp(scodiff));
			w[i] = b_ij;
		}
		b[j].init(w);
	}
	// The marginal will be in s[n]. Get w by asking the sums of each s[j].
	for (int j = 0; j < n; j++) w[j] = b[j].sum();
	b[n].init(w);
}
plon Gibby::sim(int t){
	ref();	// Run the slowish ref() to ensure the b-matrix is correct in the beginning.
	statg.tot += t; 
	long nmov = 0; long npro = 0;
	while (t > 0){
		double p = b[n].sum();
		int z = GEOM(p);		// z in {0, 1, ...}
		if (z >= t) break;
		t -= z;	
		int i; int j;
		rnd(i, j);
		int movetype = d->arc(i, j) + 2 * d->arc(j, i);
		switch (movetype){
			case 0: statg.padd++; if (!d->anc(j, i)){ add(i, j); nmov++; statg.aadd++; } break;	// Add ij.
			case 1: statg.prem++;                     rem(i, j); nmov++; statg.arem++;   break;	// Rem ij.
			case 2: statg.prev++; if (!d->anx(j, i)){ rev(i, j); nmov++; statg.arev++; } break;	// Rev ji to ij.
		}
		t--; npro++;
	}
	statg.pro += npro; statg.acc += nmov;
	return { nmov, npro };
}
plon Gibby::sGC(int t){
	long nmov = 0; long npro = 0;
	for (int step = 0; step < t; step++){
		// Propose a random move ij. Currently uniformly at random.
		int j = RINT(n-1); int i = RINT(n-2); i += (i >= j); 
		// Add, Rem, or Rev ?
		int movetype = d->arc(i, j) + 2 * d->arc(j, i);
		// If accepted, make the move; otherwise stay.
		vint Pj = d->P[j];
		switch (movetype){
			case 0: // Add ij.
				statGC.padd++;
				if (!d->anc(j, i)){ 
					vint Qj = Pj; add_ord_strict(i, Qj);	
					double scodiff = s->sfam(j, Qj) - s->sfam(j, Pj);
					if (log(URND) < std::min( 0.0, scodiff )){ d->add(i, j); nmov++; statGC.aadd++; }
				} break;
			case 1: // Rem ij.
				statGC.prem++;
				{
					vint Qj = Pj; rem_ord_strict(i, Qj);	
					double scodiff = s->sfam(j, Qj) - s->sfam(j, Pj);
					if (log(URND) < std::min( 0.0, scodiff )){ d->rem(i, j); nmov++; statGC.arem++; }				
				} break;
			case 2: // Rev ji to ij.
				statGC.prev++;
				if (!d->anx(j, i)){ 
					vint Pi = d->P[i]; vint Qi = Pi; rem_ord_strict(j, Qi);
					vint Qj = Pj; add_ord_strict(i, Qj);	
					double scodiff = s->sfam(j, Qj) - s->sfam(j, Pj) + s->sfam(i, Qi) - s->sfam(i, Pi);
					if (log(URND) < std::min( 0.0, scodiff )){ d->rem(j, i); d->add(i, j); nmov++; statGC.arev++; }									
				} break;
		}		
		npro++;
	}
	statGC.tot += t; statGC.pro += npro; statGC.acc += nmov;
	return { nmov, npro };
}
void Gibby::rnd(int& i, int& j){
	j = b[n].rand( URND ); 	// First draw j.
	i = b[j].rand( URND );	// Then draw i.
}

void Gibby::upd(int j){
	using namespace std; 
	//vrea w(n);
	// Update (b_uv) after removing or adding ij.
	vint Pj = d->P[j];
	// b_uj for all u not j
	// Check if the vector w has already be computed and stored->
	vint Pjkey = Pj; Pjkey.push_back(j); // Append by j to make a unique key for all pairs (j, Pj).
	it = hm.find(Pjkey);
	if (it != hm.end()){	// Yes, it is there
		//w = it->second;		// Have to copy, as will modify w in loop Rev below.
		b[j].init(it->second);
	} else {	// No, it was not there; have to compute and store
		vrea w(n);
		for (int u = 0; u < n; u++){	// Add  and Rem !!! This loop greatly dominates the time requirement.
			if (u == j) {w[u] = 0; continue; }
			// For simplicity, assume u is not a child of j. Correct afterwards.
			vint Qj = Pj; 
			if (d->arc(u, j)) rem_ord_strict(u, Qj);	// u is a parent of j.
			else			 add_ord_strict(u, Qj);
			double scodiff = s->sfam(j, Qj) - s->sfam(j, Pj);
			Treal b_uj = q * min( 1.0, exp(scodiff));
			w[u] = b_uj;
		}	
		if (hm.size() * n * sizeof(Treal) > max_nbytes){ cerr << "\t Clear gibbymem\n"; hm.clear(); }// If the size exceeds the max, then clear. 
		// Store w for later use. Note: Do this before handling the children of j.
		hm.insert( { Pjkey, w } );
		b[j].init(w);
	}	
	for (auto u : d->C[j]){		// Rev. Note: Overwrites b_uj for the children u of j.
		vint Qj = Pj; add_ord_strict(u, Qj);
		vint Pu = d->P[u]; vint Qu = Pu; rem_ord_strict(j, Qu);
		double scodiff = s->sfam(j, Qj) - s->sfam(j, Pj) + s->sfam(u, Qu) - s->sfam(u, Pu);
		Treal b_uj = q * min( 1.0, exp(scodiff));
		//w[u] = b_uj;
		b[j].update(u, b_uj);
	}
	//s[j].init(w);
	b[n].update(j, b[j].sum());

	// b_jv for all parents v of j
	for (auto v : d->P[j]){		// Rev !!! 
		vint Qj = Pj; rem_ord_strict(v, Qj);
		vint Pv = d->P[v]; vint Qv = Pv; add_ord_strict(j, Qv);
		double scodiff = s->sfam(j, Qj) - s->sfam(j, Pj) + s->sfam(v, Qv) - s->sfam(v, Pv);
		Treal b_jv = q * min( 1.0, exp(scodiff));
		b[v].update(j, b_jv);
		b[n].update(v, b[v].sum());
	}	
	//for (int i = 0; i < n; i++) w[i] = s[i].sum();
	//s[n].init(w);
}

inline void Gibby::rem(int i, int j){
	d->rem(i, j);	
	// After ij removed, b_ji changes. Not handled elsewhere.
	vint Pi = d->P[i]; vint Qi = Pi; add_ord_strict(j, Qi);
	double scodiff = s->sfam(i, Qi) - s->sfam(i, Pi);
	Treal b_ji = q * std::min( 1.0, exp(scodiff));
	b[i].update(j, b_ji);
	b[n].update(i, b[i].sum());	// Added 22 Feb 2025.			
	upd(j);
}
inline void Gibby::add(int i, int j){
	d->add(i, j);
	upd(j);
//	double sj = s->sfam(j, d->P[j]);
//	cerr << "\t Gibby::add(" << i << ", " << j << "). Parent set of " << j << ": score " << sj << ", content"; print(cerr, d->P[j]);
}
inline void Gibby::rev(int i, int j){
	rem(j, i);
	add(i, j);
}
inline void Gibby::rep(const vint& P, int j){
	// Values b_ji change for all i in the old parent set of j. Recompute.
	for (const int i : d->P[j]){
		vint Pi = d->P[i]; vint Qi = Pi; add_ord_strict(j, Qi);
		double scodiff = s->sfam(i, Qi) - s->sfam(i, Pi);
		Treal b_ji = q * std::min( 1.0, exp(scodiff));
		b[i].update(j, b_ji);			
	}
	d->rep(P, j);
	upd(j);
}

#define PR_MARG { 								\
	cerr << "\t Marginal:"; 					\
	for (int j = 0; j < n + 1; j++) 			\
		cerr << FIXED_F( s[j].sum(), 6, 3 ); 	\
	cerr << endl; 								\
}

int Gibby::test(){
	using namespace std;
	//cerr << "\t Gibby::test: " << n << " nodes:\n";
	//PR_MARG	
	int nops = 0;
	// Construct a DAG.
	for (int j = 0; j < n; j++){
		vint Pj;
		for (int k = 0; k < min(2, j); k++){
			Pj.push_back( j - 1 - k );
		}
		//rep(Pj, j);
		for (const int i : Pj){ add(i, j); nops++; }
	}
	//PR_MARG
	//cerr << "\t Number of arcs (before): " << d->m << endl;
	// Construct a DAG (empty again).
	for (int j = 0; j < n; j++){
		vint Pj = d->P[j]; 
		for (const int i : Pj){ rem(i, j); nops++; }		
		//rep(Pj, j);
	}
	//cerr << "\t Number of arcs (after): " << d->m << endl;
	//PR_MARG
	return nops;
}
void Gibby::info(){
	using namespace std;
	cerr << "\t Gibby::info:\n";
	cerr << "\t\t DDAG mode:    "; if (d->is_static()) cerr << "static" << endl; else cerr << "dynamic" << endl;
	cerr << "\t\t Hashmap size: " << hm.size() << " (" << (hm.size() * d->n * 8.0)/(1L << 20) << " MiB)" << endl;
	cerr << "\t\t #nodes:       " << d->n << endl;
	cerr << "\t\t #arcs:        " << d->m << endl;
	//d->printA();
	//d->printP();
}
string Gibby::info(int id){
	using namespace std;
	string infos;
	MoveStat* stat;
	if (id == 0) { stat = &statGC; infos += "\t GC   "; }
	else if (id == 1) { stat = &statg;  infos += "\t GIBBY"; }
	else { infos += " gibbymem " + to_string(hm.size()); return infos; }
	
	infos += " total " + to_string(stat->tot);
	infos += " pro "   + to_string(stat->pro);	
	infos += " padd "  + to_string(stat->padd);	
	infos += " prem "  + to_string(stat->prem);	
	infos += " prev "  + to_string(stat->prev);	
	infos += " acc "   + to_string(stat->acc);	
	infos += " aadd "  + to_string(stat->aadd);
	infos += " arem "  + to_string(stat->arem);
	infos += " arev "  + to_string(stat->arev) + "\n";		

	return infos;
}

#undef UMAP
#undef URND
#undef RINT
#undef RIN2
#undef GEOM
#endif
