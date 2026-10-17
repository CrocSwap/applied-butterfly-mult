//
// 2 Dec 2025
//

#ifndef Scorer_HPP
#define Scorer_HPP

#include <iostream>
#include "basics.hpp"
#include "RangeSums.hpp"

#define UMAP std::unordered_map

using Tscore	 = double;	// Score type.

class Scorer {
	public:
		virtual int		read (const string& fname) = 0;		// Reads data matrix given as a csv file.
		virtual int		dear (const string& fname) = 0;		// Reads data matrix given as a csv file.
		virtual	double	scli (const vint& C) = 0;			// The score of clique C.
	
				void	pjkl  (const string& fname);								// Write scores to a jkl file.
				void	rjkl  (const string& fname);								// Read scores, n, maxind from a jkl file.
				void	build ();													// Assumes a data file already read.
				void	set_mid(int vr, int vs){ maxindr = vr; maxinds = vs; }
				void	set_eps(double val){ eps = val; }
				void	set_can(int val){ maxncan = val; }
				void	set_mem(int val){ maxmem = val; }
				void	set_pri(int val){ sprior = val; }
				void	set_pru(int val){ pruning = val; }
				void	info ();													// Prints out info.
				string	imem ();
				void	prs	 (int i);												// Prints out the RangeSums object for node i.
				void	srt	 (int i);												// Sorts the RangeSums object for node i.

				double	prio (int k);												// The structure prior; only depends on size k.
				double	sfam (int i, const vint& P);								// The score of family (i, P).
				double	sfam (int i, const vint& P, bool store);					// The score of family (i, P).
				double	sum	 (int i, const vint& L, const vint& U); 				// Returns a constrained sum of scores for node i.				
				double	sum	 (int i, const vint& L, const vint& U, double d); 		// With given maximum relative error delta.
				vint	cum	 (int i, const vint& L, const vint& U, double csum); 	// Returns a parent set at quantile csum. 
				vint	rnd	 (int i, const vint& L, const vint& U); 				// Generates a random parent set. 
		
				int		n;			// Number of variables, also called nodes.
				int		m;			// Number of data points.
				vvin	can;		// A list of candidate parents per node.
				vint	nac;		// The inverse of can.
	protected:
		Wsets										cscores;		// A storage for clique scores.	
		UMAP < vint, Tscore, vinthas >  			fscores;		// A storage for family scores. 
		UMAP < vint, Tscore, vinthas >::iterator	it;				// Iterator. Yes, STL containers force us to use one, unfortunately.				
		std::vector<RangeSums>						r;				// A RangeSums object per node, contained by candidate parents.
		std::vector<RangeSums>						s;				// A RangeSums object per node, not contained by candidate parents. 

		int											maxindr = 1;	// Shape parameter: maximum indegree. "-maxind ..."
		int											maxinds = 1;	// Shape parameter: maximum indegree. "-maxind ..."
		double										eps = 0.001;	// Accuracy parameter: "-a ..."
		int											maxncan = 64; 	// Maximum number of candidate parents per node.
		int											maxmem = 16;	// Maximum amount of memory available in GiB.
		int											sprior = 1;		// Structure prior.
		int											pruning = 0;	// Score pruning mode (0 = no pruning, 1 = top-down, 2 = bottom-up).
		vdou										lpr;			// The prior component precomputed for a fixed n.
		bool										freadonly = false;

		void select_can			();									// Selects candidate parents and stores in can.
		vint tocan				(int i, const vint &L);				// Converts a node list to a list of indexes of candidate parents.
		vint tonac				(int i, const vint &L);				// Converts a list of indexes of candidate parents to a node list.
		bool incan				(int i, const vint &P);
		void add_all_small_sets	(int i, int maxd);					// Adds to r[i] sets of size upto maxindegree, along with scores.
		void dfs				(int i, int k, int fel, vint& set);	
		int  bottom_up_can		(int i, int maxd);	
		int  bottom_up_all		(int i, int maxd);	
		int  bottom_up			(int i, int maxd, bool withincan);	
		void test_sampling		(int i);
};

using Scorer_ptr = std::shared_ptr<Scorer>;		// A typedef.

// Implementation below.

void Scorer::pjkl(const string& fname){
	using namespace std;
	cerr << "\t Start writing file " << fname << endl;
	int wroter = 0, wrotes = 0;
	vint idmap(n); for (int j = 0; j < n; j++) idmap[j] = j; // A simple idendity mapping.
	ofstream f; f.open(fname); if (f.fail()){ cerr << " Error in opening file: " << fname << " Exit now." << endl; exit(1); }
	f << n << endl;	// Number of nodes.
	for (int i = 0; i < n; ++i){
		int mi = (int) s[i].size(); wrotes += mi; wroter += (int) r[i].size();
		int si = (int) can[i].size();
		if (si) mi += 1 + r[i].size();
		f << i << " " << mi << endl; // Number of lines for the node in question.
		if (si){
			f << 0.0f << " " << -si;
			for (auto j : can[i]) f << " " << j; 
			f << endl;
			r[i].pjkl(f, can[i]);
		}	
		s[i].pjkl(f, idmap);
		//cerr << " Wrote s[" << i << "], size = " << (int) s[i].size() << endl;
	}
	f.close();
	cerr << "\t File successfully written: " << wroter << " + " << wrotes << " scores." << endl;
}

// Reads a jkl file. Prunes (more / again) if pruning set on.
//
void Scorer::rjkl(const string& fname){
	using namespace std;
	freadonly = true; // Since a jkl file was given, we assume there is no data file given from which new scores could be computed.
	cerr << "\t Start reading file " << fname << endl;
	ifstream f; f.open(fname); if (f.fail()){ cerr << " Error in opening file: " << fname << " Exit now." << endl; exit(1); }
	vstr lines; for (string line; getline(f, line); ) lines.push_back(line); f.close();
	int state = 0; int i = 0; int mi = 0; int t = 0; double z = 0; vint p; int k = 0; int j = 0;
	maxindr = 0; maxinds = 0; 
	int nlines = 0; int readr = 0, reads = 0;
	for (auto& x : lines){
		sstream ss(x); double y;
		while (ss >> y){
			//cerr << " . . read " << y << "; state = " << state << endl;
			switch (state){
			 // Number of nodes
			 case 0: n = (int) y; p.reserve(n); r.resize(n); s.resize(n); can.resize(n); nac.resize(n * n);
			 		for (int v = 0; v < n; v++){ 
						can[v].resize(0);
			 			r[v].init(0); r[v].id = v;
			 			s[v].init(n); s[v].id = v;
			 		}
			 		state = 1; break;
			 // Node
			 case 1: i = (int) y; state = 2; break;
			 // Number of parent sets
			 case 2: mi = (int) y; t = 0; state = 3; break;
			 // Score
			 case 3: z = y; t++; p.resize(0); state = 4; break;
			 // Number of parents. If negative, the following parents are the candidate parents (the score is irrelevant). 
			 case 4: k = (int) y; j = 0; if (k == 0) state = 6; else state = 5; break;
			 // Parent
			 case 5: p.push_back((int) y); j++; if (j == abs(k)) state = 6; break;
			 default: break;
			}
		}
		if (state == 6){ // p is the parent set of i with score z.
			if (k < 0){ // Actually, read the candidate parents for i.
				can[i] = p; r[i].init(abs(k));
				for (int c = 0; c < abs(k); c++){ int j = can[i][c]; nac[i * n + j] = c + 1; } // Note: c+1 encodes c. 			
			} else { 
				// Store to fscores and to r[i] or s[i]. MUST USE the original node IDs.
				vint famkey = p; famkey.push_back(i);
				fscores.insert({ famkey, z });
				bool tor = incan(i, p);
				if (tor){
					maxindr = max(maxindr, k); readr++;
					if (pruning == 0) r[i].insert(tocan(i, p), z);
				} else {
					maxinds = max(maxinds, k); reads++;
					if (pruning == 0) s[i].insert(p, z);				
				}
			}
			if (t == mi){ // All scores read for i.
				state = 1;
				if (pruning && can[i].size()) bottom_up_can(i, maxindr); 
				if (pruning) bottom_up_all(i, maxinds);
				r[i].srt(); s[i].srt(); 
			} else state = 3;
		}
		nlines++;
	}
	cerr << "\t File successfully read: n = " << n << ", maxindr = " << maxindr << ", maxinds = " << maxinds; 
	cerr << ", number of scores read = " << nlines << " = " << readr << " + " << reads << "." << endl;
}

void Scorer::build(){
	using namespace std;
	// Set the array needed for the prior here.
	lpr.resize(n); 
	for (int k = 0; k < n; k++){
		switch (sprior){
		 case 0: lpr[k] = 0; break;
		 case 1: lpr[k] = - lgamma(n) + lgamma(k+1) + lgamma(n-k); break;
		 case 2: lpr[k] = - lgamma(n) + lgamma(k+1) + lgamma(n-k) - 2*log(k+1); break;
		 default: lpr[k] = -k * log(abs(sprior));
		}		
	}	
	
	cerr << "\t Scorer::build: pruning = " << pruning << " number of candidates = " << maxncan;
	cerr << ", maxindr = " << maxindr << ", maxinds = " << maxinds << ", eps = " << eps << endl;
	
	// Select candidate parents.
	select_can();
	
	r.resize(n); s.resize(n);
	int count1 = 0, count2 = 0;
	// For r[.], currently simply computes for all parent sets up to size maxd.	
	for (int i = 0; i < n; i++){
		cerr << " " << setw(3) << i;
		r[i].init(can[i].size()); r[i].id = i; 			// Init a RangeSums object with the given ground set size.
		s[i].init(n);             s[i].id = i; 			// Init a RangeSums object with the given ground set size.		
		if (pruning){									// Alternative to add_all...
			int ncand = can[i].size();
			if (ncand) count1 += bottom_up_can(i, maxindr);// Build r[i].		
			if (ncand < n-1) count1 += bottom_up_all(i, maxinds);	// Build s[i].
		} else add_all_small_sets(i, maxinds);
		r[i].srt(); s[i].srt();
		count2 += r[i].size(); count2 += s[i].size();
	}
	double countt = 0;
	for (int t = maxinds; t <= maxindr; t++) countt += n * exp( lgamma(maxncan + 1) - lgamma(t + 1) - lgamma(maxncan + 1 - t) );
	for (int t = 0;       t <= maxinds; t++) countt += n * exp( lgamma(n          ) - lgamma(t + 1) - lgamma(n           - t) );	
	
	double pr = 100.0 * count2/countt;
	cerr << "\n\t Scorer::build – done. Computed " << std::max(count1, count2) << " scores out of the total " << (u64) countt << "; "; 
	cerr << count2 << " (" << FIXED_F(pr, 6, 3) << "%) left after pruning." << endl;

	// Testing...
	//test_sampling(0);
}

// Currently simply takes the top parents based on pairwise scores.
//
void Scorer::select_can(){
	if (maxncan > n - 1 || maxncan <= 0) maxncan = 0; // n - 1;
	can.resize(n);
	nac.resize(n * n);
	// For each node, compute n - 1 scores and sort the parent nodes accordingly.
	for (int i = 0; i < n; i++){
		struct pw { int p; double w; bool operator<(const pw b) const { return w > b.w; } };
		std::vector<pw> par(n);		
		for (int j = 0; j < n; j++){
			if (j == i) par[j] = { j, sfam(i, { }, false) };
			else		par[j] = { j, sfam(i, {j}, false) };
		}
		std::sort(par.begin(), par.end());
		// Trim by moving the tail forward starting with the position of i.
		int t = 0; while (par[t].p != i) t++;
		for ( ; t < n - 1; t++) par[t] = par[t + 1];
		// Sort the first maxncan elements of par to increasing order ny node id.
		sort(par.begin(), par.begin() + maxncan, [](const pw& a, const pw& b){ return a.p < b.p; });
		// Create can and nac.
		can[i].resize(maxncan);
		for (int t = 0; t < maxncan; t++){ int j = par[t].p; can[i][t] = j; nac[i * n + j] = t + 1; } // Note: t+1 encodes t. 
	}
}

void Scorer::dfs(int i, int k, int firstelem, vint& set){
	//sfam(i, set);	
	Tscore w = sfam(i, set);	
	//r[i].insert(tocan(i, set), w);
	s[i].insert(set, w);
	if (k > 0){ 
		for (int j = firstelem; j < n; j++){
			if (j == i) continue;
			set.push_back(j);
			dfs(i, k - 1, j + 1, set);
			set.pop_back();
		}
	}
} 
void Scorer::add_all_small_sets(int i, int maxd){
	vint set; set.reserve(maxd);	// The set is empty initially.
	dfs(i, maxd, 0, set);			// Knows n, knows the vector r.	
}

// Insert to r[i].
int Scorer::bottom_up_can(int i, int maxd){
	return bottom_up(i, maxd, true);
}
// Insert to s[i].
int Scorer::bottom_up_all(int i, int maxd){
	return bottom_up(i, maxd, false);
}
#define PRUNE_WEIGHT(v, r, s)	( pow(1 + 1.0f/v, r - v) * pow((float) v, r - s) )
#define LOG_PRW(v, r, s)		( (r - v) * log1p(1.0/v) + (r - s) * log((double) v) )

// Prunes and inserts to either r[i] or s[i], depending on the withincan argument.
int Scorer::bottom_up(int i, int maxd, bool withincan){
	using namespace std;
	using Treal = B2real;
	
	vint candi;
	if (withincan) candi = can[i];
	else { candi.resize(n); for (int j = 0; j < n; j++) candi[j] = j; } // The identity mapping.
	int ni = candi.size(); if (!withincan) ni--;
	
	const long int membudget = (int64_t) maxmem * (1ULL << 29); // Total budget for local scores (each taking about 32 bytes).	
	int lmaxd = maxd; // Lower maxd if needed.
	while (lgamma(ni) - lgamma(ni - lmaxd) - lgamma(lmaxd + 1) > log(membudget/n)) lmaxd--;
	
	cerr << "\t Node " << i << ", max " << lmaxd << " parents, out of " << setw(3) << ni << " candidates";
	
	int count = 0; int count2 = 0;
	UMAP < vint, Treal, vinthas >  			h; 
	UMAP < vint, Treal, vinthas >::iterator	hit;		
	std::deque<vint> q;
	vint J;	// The parent set of i. Empty first.
	Tscore sco = sfam(i, J);
	if (withincan) r[i].insert(J, sco); // Include the empty set in r[i].
	else if (maxncan == 0) s[i].insert(J, sco); // Include the empty set in s[i] because nothing will be stored in r[i].
	
	Treal rea; rea = sco;
	h.insert({ J, rea });
	q.push_back(J); count++;
	while (!q.empty()){
		// Get next J and handle it.
		J = q.front(); q.pop_front();
		// Generate successors of J.
		for (auto j : candi){	// Loop over the candidate parents of i.
			bool invalid = (j == i);
			for (auto x : J) invalid = ( invalid || (j == x) );
			if (invalid) continue; // Skip if t already in J.
			vint K; insert_sorted(j, J, K); // 
			int k = K.size();
			if (h.find(K) == h.end()){ // Not in the cache.
				bool pruneit = true; // This will change if the condition not satisfied for all x in K.
				Tscore sco = sfam(i, K, false);
				if (sco != -infdouble){
					Treal fK; fK.set_log(sco);
					h.insert({ K, fK });

					// Consider pruning, i.e., not adding to list[i].
					// Compare to a weighted sum of subsets R of K.
					vector<Treal> prw(k+1); for (int r = 1; r < k+1; r++) prw[r].set_log(LOG_PRW((ni), r, k)); 
				
					Treal wsum0; wsum0 = fK * prw[k]; // Note: K is the seed for all sums.
					vector<Treal> wsum(n); for (int x = 0; x < n; x++) wsum[x] = wsum0;
					vint R; R.reserve(k);
					for (u32 mask = 1; mask < (1UL << k) - 1; mask++){ // Note: K excluded.
						int r = bitcount(mask); R.clear();
						for (int t = 0; t < k; t++) if (mask & (1 << t)) R.push_back(K[t]);
						Treal fR; hit = h.find(R);
						if (hit == h.end()){ Tscore sR = sfam(i, R, false); fR.set_log(sR); h.insert({ R, fR }); } 
						else fR= hit->second;
						Treal w; w = fR * prw[r];
						for (auto x : R) wsum[x] += w;	// Only add to the sum for x that belongs to R.
					}
					// Ready for the actual comparison and possible pruning.
					fK = fK * (1.0/eps);
					for (auto x : K) pruneit = pruneit && (fK < wsum[x]);				
					if (!pruneit){
						if (withincan){ r[i].insert(tocan(i, K), sco); count2++; }
						else if (!incan(i, K)){ s[i].insert(K, sco); count2++; }
					}
				}
				if (k < lmaxd && (pruning == 1 || !pruneit)) q.push_back(K);
				count++;
			}
		}
	}
	if ((int64_t) cscores.size() > (int64_t) maxmem << 20){ cscores.clear(); cerr << " clear cache"; } else {cerr << "  keep cache"; }
	cerr << " ...computed " << setw(9) << count << " scores, " << setw(7) << count2 << " (" << FIXED_F((100.0*count2)/count, 5, 2) << " %) after pruning" << endl;
	//cerr << " cscores.size() = " << (int) cscores.size() << ", membudget = " << (long int) membudget << endl;
	return count;
}

void Scorer::info(){
	using namespace std;
	cerr << "\t Scorer::info:" << endl;
	cerr << "\t\t c-cache size: " << setw(6) << cscores.size() << " (" << FIXED_F(cscores.size()/(1024*1024.0), 4, 2) << " MiB)" << endl;
	cerr << "\t\t f-cache size: " << setw(6) << fscores.size() << " (" << FIXED_F(fscores.size()/(1024*1024.0), 4, 2) << " MiB)" << endl;
}

string Scorer::imem(){
	using namespace std;
	string infos;
	int csize = cscores.size();
	int fsize = fscores.size();	
	int rsize = 0; for (auto x : r) rsize += x.size();
	int ssize = 0; for (auto x : s) ssize += x.size();

	infos += " c-scores " + to_string(csize);
	infos += " f-scores " + to_string(fsize);
	infos += " r-scores " + to_string(rsize);
	infos += " s-scores " + to_string(ssize);
	return infos;
}

void Scorer::prs(int i){
	r[i].print();
}

void Scorer::srt(int i){
	r[i].srt();
}

inline double Scorer::prio(int k){
	if (k > maxindr) return -infdouble;
	return lpr[k];
}

double Scorer::sfam(int i, const vint& P){ 
	return sfam(i, P, false);
}
double Scorer::sfam(int i, const vint& P,  bool store){ 
	using namespace std;
	if ((int) P.size() > maxindr) return -infdouble;
//	cerr << "a";
	// Check if the score is already in the cache.
	vint famkey = P; famkey.push_back(i);
	it = fscores.find(famkey);
//	cerr << "b";
	if (it != fscores.end()) return it->second;	// It was in the cache!
	if (freadonly) return -infdouble; // Not computing any new scores; impossible parent set.
//	cerr << "c";
	// Construct the larger clique C.
	vint C; insert_sorted(i, P, C);
	
	// Get the score of C. 
	double retval =  scli(C) - scli(P) + prio(P.size());	
	// Insert to the caches.
	if (store /*&& (int) P.size() < 4*/){ 	
		fscores.insert({ famkey, retval }); 
		//if (!incan(i, P)) s[i].insert(P, retval);
	}
	return retval;
}

// The routines below take as input sets L and U. 
// These are lists of nodes using the original labeling.
// For the RangeSums objects, need to convert to 
// indexes of candidate parents.
// Likewise, have to convert back the returned list.

vint Scorer::tocan(int i, const vint &L){
	vint R; R.reserve(std::min(L.size(), can[i].size()));
	for (auto j : L) if (int t = nac[i * n + j]) R.push_back(t - 1); 
	return R;
}

vint Scorer::tonac(int i, const vint &L){
	vint R; R.resize(L.size());
	for (int t = 0; t < (int) L.size(); t++) R[t] = can[i][L[t]];
	std::sort(R.begin(), R.end());
	return R; 
}

bool Scorer::incan(int i, const vint &P){
	if (can[i].size() == 0) return false;
	for (auto j : P){
		if (nac[i * n + j] == 0) return false;
	}
	return true;
}

double Scorer::sum(int i, const vint& L, const vint& U, double delta){ 
	r[i].set_tolerance(delta); s[i].set_tolerance(delta);
	return sum(i, L, U); 
}

// The following functions, sum and cum, only work for sums over the set interval [L, U]. 
/*
double Scorer::sum(int i, const vint& L, const vint& U){ 
	if (!incan(i, L)) return s[i].sum(L, U); // Because r[i] cannot contribute to the sum.
	double rsum = r[i].sum(tocan(i, L), tocan(i, U));
	return s[i].sum(L, U, rsum);
}
vint Scorer::cum(int i, const vint& L, const vint& U, double csum){ 
	if (!incan(i, L)) return s[i].cum(L, U, csum); // Because r[i] cannot contribute to the sum.
	double rsum = r[i].sum(tocan(i, L), tocan(i, U));
	vint val;
	if (csum <= rsum) val = tonac(i, r[i].cum(tocan(i, L), tocan(i, U), csum)); 
	else val = s[i].cum(L, U, csum, rsum);
	return val;
}
*/
// The following functions, sum and cum, work for sums over subsets of U that intersect L. 
// 
double Scorer::sum(int i, const vint& L, const vint& U){ 
	if (L.size()){
		vint Lr = tocan(i, L);
		if (Lr.size()) return s[i].sum(L, U, r[i].sum(Lr, tocan(i, U))); 
		else return s[i].sum(L, U); 
	} else return s[i].sum({ }, U, r[i].sum({ }, tocan(i, U))); 
}
vint Scorer::cum(int i, const vint& L, const vint& U, double csum){ 
	if (L.size()){
		vint Lr = tocan(i, L);
		if (Lr.size()){ 
			double rsum = r[i].sum(Lr, tocan(i, U));
			if (csum <= rsum) return tonac(i, r[i].cum(Lr, tocan(i, U), csum));
			else return s[i].cum(L, U, csum, rsum); 
		} else return s[i].cum(L, U, csum); 
	} else {
		double rsum = r[i].sum({ }, tocan(i, U));
		if (csum <= rsum) return tonac(i, r[i].cum({ }, tocan(i, U), csum));
		else return s[i].cum({ }, U, csum, rsum);
	}	 
}

vint Scorer::rnd(int i, const vint& L, const vint& U){ 
	std::cerr << " ERROR: Scorer::rnd not implemented. Exit now." << endl; exit(1);
	return tonac(i, r[i].rnd(tocan(i, L), tocan(i, U))); 
}

void Scorer::test_sampling(int i){
	using namespace std;
	
	cerr << " Test: i = " << i << endl;
	if ((int) can[i].size() > 5){
		vint U(can[i].begin(), can[i].begin()+5);
		vint L = {3, 5, 7};
		for (auto x : U){ cerr << " " << x; } cerr << " = U" << endl;
		if (L.size()){
			cerr << " L.size() != 0" << endl;
			vint Lr = tocan(i, L);
			for (auto x : Lr){ cerr << " " << x; } cerr << " = Lr" << endl;
		
		}
	}
	
	exit(1);
	
	r[i].print(); 
	//s[i].print();
	cerr << "can[i]:";
	for (auto x : can[i]) cerr << " " << x;
	cerr << endl;
	vint U; 
	int u = 0;
	for (int j = 0; j < n; j++){ 
		if (j == i) continue;
		U.push_back(j); u = j;
	}
	double z = sum(i, {u}, U);	 
	vint count(n); int xcount = 0;
	for (int t = 0; t < 10000; t++){
		vint P = cum(i, {u}, U, z + log(urnd()) );
		count[P.size()]++;
		if ((int)P.size()==3 && P[0]==1 && P[1]==3 && P[2]==6) xcount++;
	}
	for (auto x : count) cerr << " " << setw(2) << x;
	cerr << ", xcount({1, 3, 6}) = " << xcount << ", u = " << u << endl;
}

#undef UMAP

#endif
