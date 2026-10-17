//
// 26 Dec 2025, Koivisto et al.
//
// Class DAGsampler implements a manager the coordinates various operations
// associated with scoring DAGs. The actual operations are implemented by 
// multiple classes, orchestrated by this manager. Provides a minimalistic 
// interface to the user.
//
// Key services provided:
//
// init	(fname, fmode, params)	Reads a data file 
// sGib	(nsteps)				Simulates basic moves nsteps steps using Gibby
// sGC	(nsteps)				Simulates basic moves nsteps steps using GC
// sREV	(nsteps)				Simulates REV moves nsteps steps
// sMBR	(nsteps)				Simulates MBR moves nsteps steps
// sMER	()						Simulates one MER move
// getp	(i)						Returns the parents of node i
// gets	(i, J)					Returns the score of node i with parent set J
// getn	()						Returns the number of nodes
// getm	()						Returns the number of data points
// pjkl	(maxind)				Computes scores and writes to stdout in the jkl format
// info	(selection)				Returns (and writes to stdout) selected statistics
// zero	()						Zeros the simulation statistics 


#ifndef DAGsampler_HPP
#define DAGsampler_HPP

#include "basics.hpp"
#include "DDAG.hpp"
#include "Wsets.hpp"
#include "BD.hpp"
#include "Scorer.hpp"
#include "Gibby.hpp"

#define BD_ID	1		// Identifier of the BD scorer. May later add more options below. Used by init(...).

#define TOS(x) to_string(x)
struct Parameters {
	string	f = "";		// Filename.
	bool	t = true;	// Data shape: true = datapoint per line.
	int		a = 15;		// Accuracy; the number of significant bits in approximations.
	int		p = 1;		// Structure prior: 0 uniform, 1 fair, 2 fair+.
	int		s = BD_ID;	// Model id.
	float	e = 1.0;	// EES;
    int     d1 = 4;     // NEW: mid1 (from -d)
    int     d2 = 4;     // NEW: mid2 (from -d)
	int		P = 0;		// Score pruning mode (0 = no pruning, 1 = top-down, 2 = bottom-up).
	int		K = 0;		// Maximum number of candidate parents per node (0 = no maximum).
	int		M = 16;		// Amount of RAM available in GiB.
	int		R = 0;		// Seed of the random number generator.
	string  I = "";		// Name of an input score file (jkl).
	string  O = "";		// Name of an output score file (jkl).

	string info(){
		using namespace std;
		string infos = "\t PARAM";
		infos += " filename " + f + " datapoint_per_line " + to_string(t);
		infos += " -a " + TOS(a) + " -d " + TOS(d1) + " " + TOS(d2) + " -e " + TOS(e) + " -p " + TOS(p) + " -s " + TOS(s); 
		infos += " -P " + TOS(P) + " -K " + TOS(K) + " -M " + TOS(M) + " -R " + TOS(R) + " -I " + I; 
		infos += " -O " + O;
		infos += "\n"; 
		return infos;
	}
};

struct ARstat { // AR stands for Acceptance–Rejection.
	long	tot = 0;
	long	acc = 0;
	string	who = "???";	
	ARstat(const string& w) : who(w) { }
	string info(){
		using namespace std;
		string infos = "\t " + who + "  ";
		infos += " total " + TOS(tot) + " acc " + TOS(acc) + "\n";
		return infos;
	}
};
#undef TOS

// Note: "vint" is a shorthand for std::vector<int>, defined in basics.h.

class DAGsampler {
	public:
		// The key high-level interface:
		DDAG_ptr	dagp;				// Dynamic DAG, maintains the ancestor relation (in the dynamic mode)
		void	init (const string& fname, bool fmode, const string& params);
		void	init (const string& params);
		string	info (int selection);
		void	zero ();
		int		getn () { return scop->n; }					// Number of nodes, aka variables / attributes.
		int		getm () { return scop->m; }					// Number of records, aka data points.
		vint	getp (int i) { return dagp->P[i]; }
		double	gets (int i, const vint& P);
		int		pjkl ();	
		int		pjkl (int maxind);	
		void	sGib (int t);
		void	sGC  (int t);		
		void	sREV (int t);								// The new edge reversal move.		
		void	sMBR (int t);								// The Markov blanket resampling move.
		void	sMBR (int t, bool disjoint, int variant);	// The Markov blanket resampling potentially not requiring disjointness.
		void	sMBR_id (int t, bool disjoint);				// The Markov blanket resampling potentially not requiring disjointness.		
		void	sMBR_rnd (int t, bool disjoint);			// The Markov blanket resampling potentially not requiring disjointness.
		void	sMBR_rev (int t, bool disjoint);			// The Markov blanket resampling potentially not requiring disjointness.
		void	sMER ();									// The Markov equivalent resampling move.		

		// Other functions that might be useful: 
		void	prep(int val);								// Prepare for advanced queries. ***Under construction.
		double	sump(int i, const vint& J, const vint& U);	// ***Not implemented yet.
		vint	rndp(int i, const vint& J, const vint& U);	// ***Not implemented yet.
		vint	rndg();
		void	remg(int  i, int  j);
		void	addg(int  i, int  j);
		void	revg(int  i, int  j);
		void	repg(const vint& P, int j);					// Replaces the parent set of j in Gibby by P.
		int		test();										// Some testing.
		void	info();										// Prints out some info.		
		DDAG&	getD(){ return *dagp; }						// Reference to the DDAG object.
		double	gets();										// The score of the current DAG.

	private:
		Scorer_ptr	scop;				// Pointer to a Scorer object, of either class BD or some other class derived from Scorer.
		Gibby		gibby;				// The Gibby method for sampling node pairs. 
		Parameters	parameters;
		ARstat		revstat = ARstat("REV");
		ARstat		mbrstat = ARstat("MBR");
		
		void	para(const string& params);
		string	iMem();					// An info line about the memory footprint.
		string	iDAG();					// An info line about the current DAG.
		string	iMisc();				// An info line about misc statuses.
};

void DAGsampler::para(const string& params){
    using namespace std;

    istringstream iss(params);
    string token;

    // Handlers for single-value options
    map<string, function<void(const string&)>> option_handlers;
    option_handlers["-a"] = [&](const string& v){ parameters.a = stoi(v); };
    option_handlers["-e"] = [&](const string& v){ parameters.e = stof(v); };
    option_handlers["-p"] = [&](const string& v){ parameters.p = stoi(v); };
    option_handlers["-s"] = [&](const string& v){ parameters.s = stoi(v); };
    option_handlers["-P"] = [&](const string& v){ parameters.P = stoi(v); };
    option_handlers["-K"] = [&](const string& v){ parameters.K = stoi(v); };
    option_handlers["-M"] = [&](const string& v){ parameters.M = stoi(v); };
    option_handlers["-R"] = [&](const string& v){ parameters.R = stoi(v); };
    option_handlers["-I"] = [&](const string& v){ parameters.I = v; };
    option_handlers["-O"] = [&](const string& v){ parameters.O = v; };

    while (iss >> token) {


        if (token == "-d") {
            string v1, v2;

            if (!(iss >> v1)) {
                cerr << "Error: Missing value for option -d\n";
                continue;
            }

            parameters.d1 = stoi(v1);

            // Peek next token to see if it's another value
            streampos pos = iss.tellg();
            if (iss >> v2 && v2[0] != '-') {
                parameters.d2 = stoi(v2);
            } else {
                parameters.d2 = parameters.d1;
                iss.seekg(pos); // rewind if not a second value
            }
        }
        else if (option_handlers.find(token) != option_handlers.end()) {
            string value;
            if (iss >> value) {
                option_handlers[token](value);
            } else {
                cerr << "Error: Missing value for option " << token << endl;
            }
        }
        else {
            cerr << "Error: Unknown option " << token << endl;
        }
    }
}


// // Calling the Scorer object
// //
// void DAGsampler::init(const string& fname, bool dpointperline, const string& params){
// 	using namespace std;
	
// 	parameters.f = fname; parameters.t = dpointperline;
// 	para(params);	// Reads more parameters from params.
	
// 	int id = parameters.s; // Replace this by reading it from params.
// 	gen.seed(parameters.R);
	
// 	// Need a Scorer object. Read from file.
// 	switch (id){
// 		case BD_ID: scop = (Scorer_ptr)(new BD()); break;
// 		default: cerr << "\t ERROR: DAGsampler::init: id = " << id << " not implemented; exit.\n"; exit(1); 
// 	}
// 	if (dpointperline)	scop->read(fname);
// 	else 				scop->dear(fname);
	
// 	scop->set_mid(parameters.d);
// 	scop->set_eps(1.0/(1ULL << parameters.a));
// 	scop->set_pri(parameters.p);
// 	scop->set_can(parameters.K);
// 	scop->set_mem(parameters.M);
// 	scop->set_pru(parameters.P % 10);
// 	scop->build(parameters.P / 10);
	
// 	// Init ddag. Default: dynamic.
// 	dagp = (DDAG_ptr)(new DDAG());
// 	dagp->init(scop->n, true);
// 	//dagp->init(scop->n, false);
	
// 	// Init gibby. Note: a Scorer and a DDAG as input.
// 	gibby.init(scop, dagp);
	
// 	// Print out local scores if filename given.
// 	pjkl();
// }

void DAGsampler::init(const string& fname, bool dpointperline, const string& params){
    using namespace std;

    parameters.f = fname;
    parameters.t = dpointperline;
    para(params);   // Reads more parameters from params.

    int id = parameters.s;
    gen.seed(parameters.R);

    // Create Scorer
    switch (id){
        case BD_ID: scop = (Scorer_ptr)(new BD()); break;
        default:
            cerr << "\t ERROR: DAGsampler::init: id = " << id
                 << " not implemented; exit.\n";
            exit(1);
    }

    if (fname.size() >= 4 && fname.substr(fname.size() - 4) == ".jkl") {
        scop->rjkl(fname);
    } else {
        scop->read(fname);
    }

    double eps = 1.0 / (1ULL << parameters.a);
    int pru = parameters.P % 10;

    scop->set_mid(parameters.d1, parameters.d2);
    scop->set_eps(eps);
    scop->set_pri(parameters.p);
    scop->set_pru(pru);
    scop->set_can(parameters.K);
    scop->build();

    // Init ddag (dynamic)
    dagp = (DDAG_ptr)(new DDAG());
    dagp->init(scop->n, true);

    gibby.init(scop, dagp);

    // Print local scores if requested
    if (!parameters.O.empty()) {
    	scop->pjkl("./results/" + parameters.O);
	}	
}


void DAGsampler::init(const string& params){
	using namespace std;
	para(params);	// Reads more parameters from params.
	int id = parameters.s; // Replace this by reading it from params.
	gen.seed(parameters.R);
	
	// Need a Scorer object. Actually, no inherited class is needed.
	switch (id){
		case BD_ID: scop = (Scorer_ptr)(new BD()); break;
		default: cerr << "\t ERROR: DAGsampler::init: id = " << id << " not implemented; exit.\n"; exit(1); 
	}
	
	//scop->set_mid(parameters.d);
	//scop->set_eps(1.0/(1ULL << parameters.a));
	//scop->set_pri(parameters.p);
	//scop->set_can(parameters.K);
	scop->set_mem(parameters.M);
	//scop->set_pru(parameters.P % 10);
	//scop->build(parameters.P / 10);
	
	// Read scores from a given jkl file.
	scop->rjkl(parameters.I);	
	
	// Init ddag. Default: dynamic.
	dagp = (DDAG_ptr)(new DDAG());
	dagp->init(scop->n, true);
	//dagp->init(scop->n, false);
	
	// Init gibby. Note: a Scorer and a DDAG as input.
	gibby.init(scop, dagp);
}


string DAGsampler::info(int selection){
	string infos;
	bool writeout = false;
	int mask = 1;
	while (selection >= mask) { 
		switch (selection & mask) {
		case 0x00: break;
		case 0x01: writeout = true; break;
		case 0x02: infos += parameters.info(); break;
		case 0x04: infos += gibby.info(0); break;
		case 0x08: infos += gibby.info(1); break;
		case 0x10: infos += revstat.info(); break;
		case 0x20: infos += mbrstat.info(); break;
		case 0x40: infos += iMem(); break;
		case 0x80: infos += iDAG(); break;		
		case 0x100: infos += iMisc(); break;				
		default: break;
		}
		mask <<= 1;
	}
	if (writeout) cerr << infos;
	return infos;
}
string DAGsampler::iMem(){
	string infos;
	infos += "\t MEM  ";
	infos += scop->imem() + gibby.info(2);
	infos += "\n";
	return infos;
}
string DAGsampler::iDAG(){
	using namespace std;
	string infos;
	infos += "\t DAG   score";
	infos += " " + to_string(gets());
	infos += " nodes " + to_string(dagp->n);
	infos += " arcs "  + to_string(dagp->m);
	infos += " psets " + dagp->strP();	
	infos += "\n";
	return infos;
}
string DAGsampler::iMisc(){
	using namespace std;
	string infos;
	infos += "\t MISC  dyn";
	infos += " " + to_string(dagp->is_dynamic());
	infos += "\n";
	return infos;
}	
void DAGsampler::zero(){
	gibby.zero(0);
	gibby.zero(1);
}

double DAGsampler::gets(int i, const vint& P){
	return scop->sfam(i, P);
}	

double DAGsampler::gets(){
	double score = 0; int n = getn();
	for (int i = 0; i < n; i++) score += gets(i, getp(i));
	return score;
}	

// Prints out the already computed scores stored by scop.
int DAGsampler::pjkl(){
	if (parameters.O.empty()){
		cerr << "\t Local scores not printed out, as no output file has been named." << endl;
		return 0;
	}
	scop->pjkl(parameters.O);
	return 0;
}

// Computes and prints out score for all parent sets up to maxind.
int	DAGsampler::pjkl(int maxind){
	using namespace std;
	bool printit = true;
	int n = scop->n;
	const int N = 2048; const int K = 32;
	if (n >= N || maxind >= K){ cerr << "\t DAGsampler::pjkl: n = " << n << " or maxind too large. Exit now.\n"; exit(1); }
	i64 bin[N][K]; bin[0][0] = 1; 
	for (int l = 0; l < n; ++l) for (int k = l + 1; k < maxind + 1; ++k) bin[l][k] = 0; 
	for (int l = 1; l < n; ++l){ bin[l][0] = 1; for (int k = 1; k <= std::min(l, maxind); ++k) bin[l][k] = bin[l-1][k] + bin[l-1][k-1]; } 
	
	int count = 0;
	cerr << "\t Start computing family scores...\n";
	if (printit) cout << n << endl;
	for (int i = 0; i < n; ++i){ 		// The child i.
		uint32_t num = 0; for (int k = 0; k <= maxind; ++k) num += bin[n-1][k];
		if (printit) cout << i << " " << num << endl;
		
		for (int d = 0; d <= maxind; d++){ 
			for (int z = 1; z <= bin[n-1][d]; z++){	// The parent set of i of size d.
				int y = z;
				vint Pi; 
				// Decode Pi from y iteratively.
				int r = d;				
				for (int t = 0; t < n - 1; t++){
					int b = bin[n - 1 - t - 1][r]; 				
					//cerr << "\t d = " << d << ", z = " << z << " , y = " << y << ", b = " << b << endl;
					if (y > b) { // The set contains element t.
						Pi.push_back(t + (int)(t >= i));
						r--; y -= b;
						if ((int) Pi.size() > d){ cerr << " Something went wrong. Exit now.\n"; exit(1); }
					}
				}
				double f = scop->sfam(i, Pi);
				++count;
				if (printit){ 
					cout << fixed << f << " " << d; 
					for (auto j : Pi) cout << " " << j; 
					cout << endl; 
				}
			}
		}
	}
	return count;
}

// Calling the Scorer object
//
void DAGsampler::prep(int val){
	scop->build();
}		
void DAGsampler::sMER(){
	dagp->req(); 
	gibby.ref();
}

void DAGsampler::sREV(int t){
	using namespace std;
	// 1. Draw an arc ij.
	// 2. Find the non-descendants of i and j, Ui and Uj, and compute the sums Zi and Zj. 
	// 3. Compute the new sums Zi_new and Zj_new, with Vi = Ui_new and Vj = Uj_new. 
	// 4. Generate new parent sets Pi_new and Pj_new. 
	// 5. Accept with prob. min{1, ...}.
	// 6. if accepted, update all relevant data structures:
	// 6.1. DDAG using rep(...), or Gibby using rep(...).

	//cerr << "\t sREV: begin...\n";
	
	while (t--){
		int n = dagp->n; int m = dagp->m;
		// Draw an arc ij.
		int i, j;
		dagp->rarc(i, j);
		
		// Make j orphan temporarily. Somewhat heavy if dagp dyn – may dominate.
		// Note: no need to make i orphan to get the "base descendants" of i and j.
		vint Pj = dagp->P[j]; // Save the current parent set.
		dagp->rep({ }, j);
			
		// Get descendants of i and j in the current "base DAG". Just O(m).
		vint Di_base = dagp->descendants(i); 
		vint Dj_base = dagp->descendants(j);
		
		// Compute the four sets of non-descendants. Not maximally optimized, as O(n).
		vint Ui; Ui.reserve(n); vint Uj; Uj.reserve(n); vint Vi; Vi.reserve(n);
		// Note: Vj not needed: equal to Ui.
		vcha mark(n);
		for (auto v : Di_base) mark[v]  = 0x1;
		for (int v = 0; v < n; v++) if ( mark[v]        == 0) Vi.push_back(v);
		for (auto v : Dj_base) mark[v] |= 0x2;
		for (int v = 0; v < n; v++) if ((mark[v] & 0x2) == 0) Uj.push_back(v);
		for (int v = 0; v < n; v++) if ( mark[v]        == 0) Ui.push_back(v);
		// Comment: It might be better to use bitset instead of vint, already for descendants.

		// Compute Zi and Zj, as well as Zi_new = Wi and Zj_new = Wj.	
		double Zi = scop->sum(i, { }, Ui); double Zj = scop->sum(j, {i}, Uj);
		double Wi = scop->sum(i, {j}, Vi); double Wj = scop->sum(j, { }, Ui);	
		double logratio = Wi - Zi + Wj - Zj;

		// Draw Pi_new = Qi and Pj_new = Qj.
		vint Qi = scop->cum( i, {j}, Vi, Wi + log(urnd()) ); 
		vint Qj = scop->cum( j, { }, Ui, Wj + log(urnd()) );		
		
		// Only now can we know the new number of arcs.
		int m_new = m - dagp->P[i].size() - Pj.size() + Qi.size() + Qj.size();
   
		if (urnd() < std::min(1.0, exp(logratio) * m / m_new)){	// Accept.
			//cerr << " ACCEPT \n";
			// Change the parent sets of i and j.
			dagp->rep(Qi, i); 
			dagp->rep(Qj, j);
			//gibby.rep(Qi, i); 
			//gibby.rep(Qj, j);			
			revstat.acc++;
		} else { // Reject.
			//cerr << " reject \n";
			// Put back the original parents of j.
			dagp->rep(Pj, j);
		}
		revstat.tot++;
	}
	//cerr << "\t sREV done.\n";
}
void DAGsampler::sMBR(int t){
	sMBR(t, true, 0);
}
void DAGsampler::sMBR(int t, bool disjoint, int variant){
	switch (variant){
		case 0: sMBR_id (t, disjoint); break;
		case 1: sMBR_rev(t, disjoint); break;
		case 2: sMBR_rnd(t, disjoint); break;
		default: break;	
	}
}
// The MBR move using the same random permutation of the children for both forward and backward proposal.
void DAGsampler::sMBR_id(int t, bool disjoint){
	using namespace std;
	// 1. Draw a node i and a random ordering of the children of i.
	// 2. Remove all arcs to i. For each child j of i, remove all arcs to j, except from i. 
	// 3. Draw a new parent set for i, disjoint from the original set, subject to acyclicity.
	// 4. For each child j of i, one in turn, sample a new parent set, including i and respecting acyclicity.
	// 5. Accept with prob. min{1, ...}.
	// 6. if accepted, update all relevant data structures:
	// 6.1. DDAG using rep(...), or Gibby using rep(...).

	bool debug = false;
	//cerr << "\t sMBR: begin...\n";

	int n = dagp->n;
	while (t--){
		//dagp->turn_static();
	
		// Part I: Node i.
		// Draw a random node.
		int i; dagp->rnode(i); vint Pi = dagp->P[i]; // Save Pi.
				
		// Compute Zi, draw Qi and Zi' =: Wi.
		vint Di = dagp->descendants(i);
		vint Ui_old; Ui_old.reserve(n); // Non-descendants of i in the current graph, minus the parents of i.
		vcha mark(n);
		for (auto x : Di) mark[x] = 1;
		if (disjoint) for (auto x : Pi) mark[x] |= 2;
		for (int x = 0; x < n; x++) if (mark[x] == 0) Ui_old.push_back(x);
		
		double Wi = scop->sum( i, { }, Ui_old);
		vint   Qi = scop->cum( i, { }, Ui_old, Wi + log(urnd()) );
		
		vint Ui_new; Ui_new.reserve(n); // Non-descendants of i in the new graph, minus the new parents of i.
		if (disjoint) for (auto x : Qi) mark[x] |= 4;
		for (int x = 0; x < n; x++) if ((mark[x] & 5) == 0) Ui_new.push_back(x);
		
		double Zi = scop->sum( i, { }, Ui_new);
		double logratio = Wi - Zi;		
				
//		debug = (t == 1);		
		if (debug){
			cerr << "\t DAG:" << endl;
			dagp->printP();
			cerr << "\t Selected node i: " << i << endl;
			cerr << "\t Descendants of i: "; print(cerr, Di);
			cerr << "\t Allowed parents of i: "; print(cerr, Ui_old);
			cerr << "\t Score sum Zi: " << Zi << endl;
			cerr << "\t New parent set of i: "; print(cerr, Qi);
			cerr << "\t New allowed parents of i: "; print(cerr, Ui_new);
			cerr << "\t Score sum Z'i: " << Wi << endl; 
			//exit(1);			
		}		
				
		// Part II: The children of i.
		
		dagp->rep(Qi, i); // Change the current DAG. Note consider doing this in the static mode.

		// Draw a random permutation of the children of i.
		vint rCi = dagp->C[i]; rperm(rCi);

		if (debug){
			cerr << "\t Permuted children of i: "; print(cerr, rCi);
			dagp->printP();
		}
				
		// Save the old parent sets. Note: indexed in the order of the random permutation for brevity of notation.
		vvin Pchild(rCi.size()); for (int t = 0; t < (int) rCi.size(); t++) Pchild[t] = dagp->P[rCi[t]];
		// Will save also proposed parent sets.
		vvin Qchild(rCi.size());

		// Remove all parents other than i. Note: as dynamic rep() is slow, consider doing this in the static mode.
		for (auto j : rCi) dagp->rep({ }, j);
		
		// Go through the children of i in the sampled order.
		for (int t = 0; t < (int) rCi.size(); t++){
			int j = rCi[t];
			// Need Dj = the descendants of j in the graph built so far.
			vint Dj = dagp->descendants(j);
			vint Uj; Uj.reserve(n); // Non-descendants of j in the graph built so far.
			vboo mark(n);
			for (auto x : Dj) mark[x] = true;
			for (int x = 0; x < n; x++) if (!mark[x]) Uj.push_back(x);
			double Wj = scop->sum( j, { i }, Uj);
			vint   Qj = scop->cum( j, { i }, Uj, Wj + log(urnd()) );
			Qchild[t] = Qj;
			logratio += Wj;
			dagp->rep(Qj, j); // Change the current DAG. Note: no necessary for the last j.
	
			if (debug){
				cerr << "\t Child j: " << j << endl;
				cerr << "\t Descendants of j: "; print(cerr, Dj);
				cerr << "\t Allowed parents of j: "; print(cerr, Uj);
				cerr << "\t Score sum Z'j: " << Wj << endl;
				cerr << "\t New parent set of j: "; print(cerr, Qj);
			}		
		}
		// The reverse direction, from G' to G. First, remove all but i. Then add old parent sets in the order.
		if (debug){ cerr << "\n\t Reverse direction:\n\n"; }
		dagp->rep(Pi, i); // Change back. Note: the conribution to logratio was already computed.
		for (auto j : rCi) dagp->rep({ }, j);
		for (int t = 0; t < (int) rCi.size(); t++){
			int j = rCi[t];
			// Need Dj = the descendants of j in the graph built so far.
			vint Dj = dagp->descendants(j);
			vint Uj; Uj.reserve(n); // Non-descendants of j in the graph built so far.
			vboo mark(n);
			for (auto x : Dj) mark[x] = true;
			for (int x = 0; x < n; x++) if (!mark[x]) Uj.push_back(x);
			double Zj = scop->sum( j, { i }, Uj);
			logratio -= Zj;
			dagp->rep(Pchild[t], j); // Change the current DAG.
			
			if (debug){
				cerr << "\t Child j: " << j << endl;
				cerr << "\t Descendants of j: "; print(cerr, Dj);
				cerr << "\t Allowed parents of j: "; print(cerr, Uj);
				cerr << "\t Score sum Zj: " << Zj << endl;
			}
		}
		// Now the DAG is the original one. So, if the move is accepted, has to change again.
		if (debug) exit(1);

		if (urnd() < std::min(1.0, exp(logratio))){	// Accept.
			dagp->turn_static();
			dagp->rep(Qi, i); 
			for (int t = 0; t < (int) rCi.size(); t++){
				int j = rCi[t];
				dagp->rep(Qchild[t], j);
			}
			mbrstat.acc++;
			dagp->turn_dynamic();
		} else { // Reject.
			// No action.
		}
		mbrstat.tot++;
	}
	gibby.ref();
	//cerr << "\t sMBR: done...\n";	
}
// The MBR move using two independent random permutations of the children for the forward and backward moves.
void DAGsampler::sMBR_rnd(int t, bool disjoint){
	using namespace std;
	//cerr << "\t sMBR_alt: begin...\n";
	int n = dagp->n;
	while (t--){
		//dagp->turn_static();
	
		// Part I: Node i.
		// Draw a random node.
		int i; dagp->rnode(i); vint Pi = dagp->P[i]; // Save Pi.
				
		// Compute Zi, draw Qi and Zi' =: Wi.
		vint Di = dagp->descendants(i);
		vint Ui_old; Ui_old.reserve(n); // Non-descendants of i in the current graph, minus the parents of i.
		vcha mark(n);
		for (auto x : Di) mark[x] = 1;
		if (disjoint) for (auto x : Pi) mark[x] |= 2;
		for (int x = 0; x < n; x++) if (mark[x] == 0) Ui_old.push_back(x);
		
		double Wi = scop->sum( i, { }, Ui_old);
		vint   Qi = scop->cum( i, { }, Ui_old, Wi + log(urnd()) );
		
		vint Ui_new; Ui_new.reserve(n); // Non-descendants of i in the new graph, minus the new parents of i.
		if (disjoint) for (auto x : Qi) mark[x] |= 4;
		for (int x = 0; x < n; x++) if ((mark[x] & 5) == 0) Ui_new.push_back(x);
		
		double Zi = scop->sum( i, { }, Ui_new);
		double logratio = Wi - Zi;		
				
		// Part II: The children of i.
		
		dagp->rep(Qi, i); // Change the current DAG. Note consider doing this in the static mode.

		// Draw a random permutation of the children of i.
		vint rCi = dagp->C[i]; rperm(rCi);
		// Draw also the backward permutation.
		vint bCi = dagp->C[i]; rperm(bCi);
				
		// Save the old parent sets. Note: indexed in the order of the backward permutation for brevity of notation.
		vvin Pchild(bCi.size()); for (int t = 0; t < (int) bCi.size(); t++) Pchild[t] = dagp->P[bCi[t]];
		// Will save also proposed parent sets, to be indexed via the forward permution.
		vvin Qchild(rCi.size());

		// Remove all parents other than i. Note: as dynamic rep() is slow, consider doing this in the static mode.
		for (auto j : rCi) dagp->rep({ }, j);
		
		// Go through the children of i in the sampled order.
		for (int t = 0; t < (int) rCi.size(); t++){
			int j = rCi[t];
			// Need Dj = the descendants of j in the graph built so far.
			vint Dj = dagp->descendants(j);
			vint Uj; Uj.reserve(n); // Non-descendants of j in the graph built so far.
			vboo mark(n);
			for (auto x : Dj) mark[x] = true;
			for (int x = 0; x < n; x++) if (!mark[x]) Uj.push_back(x);
			double Wj = scop->sum( j, { i }, Uj);
			vint   Qj = scop->cum( j, { i }, Uj, Wj + log(urnd()) );
			Qchild[t] = Qj;
			logratio += Wj;
			dagp->rep(Qj, j); // Change the current DAG. Note: no necessary for the last j.	
		}
		// The reverse direction, from G' to G. 
		// First, remove all but i. 
		// Then add old parent sets in the independent backward random ordering of the children.
		dagp->rep(Pi, i); // Change back. Note: the conribution to logratio was already computed.
		for (auto j : rCi) dagp->rep({ }, j);
		
		for (int t = 0; t < (int) bCi.size(); t++){
			int j = bCi[t];
			// Need Dj = the descendants of j in the graph built so far.
			vint Dj = dagp->descendants(j);
			vint Uj; Uj.reserve(n); // Non-descendants of j in the graph built so far.
			vboo mark(n);
			for (auto x : Dj) mark[x] = true;
			for (int x = 0; x < n; x++) if (!mark[x]) Uj.push_back(x);
			double Zj = scop->sum( j, { i }, Uj);
			logratio -= Zj;
			dagp->rep(Pchild[t], j); // Change the current DAG.
		}
		// Now the DAG is the original one. So, if the move is accepted, has to change again.

		if (urnd() < std::min(1.0, exp(logratio))){	// Accept.
			dagp->turn_static();
			dagp->rep(Qi, i); 
			for (int t = 0; t < (int) rCi.size(); t++){
				int j = rCi[t];
				dagp->rep(Qchild[t], j);
			}
			mbrstat.acc++;
			dagp->turn_dynamic();
		} else { // Reject.
			// No action.
		}
		mbrstat.tot++;
	}
	//gibby.ref();
}
// The MBR move using the reversed permutations of the children for the backward move.
void DAGsampler::sMBR_rev(int t, bool disjoint){
	using namespace std;
	//cerr << "\t sMBR_rev: begin...\n";
	int n = dagp->n;
	while (t--){
		//dagp->turn_static();
	
		// Part I: Node i.
		// Draw a random node.
		int i; dagp->rnode(i); vint Pi = dagp->P[i]; // Save Pi.
				
		// Compute Zi, draw Qi and Zi' =: Wi.
		vint Di = dagp->descendants(i);
		vint Ui_old; Ui_old.reserve(n); // Non-descendants of i in the current graph, minus the parents of i.
		vcha mark(n);
		for (auto x : Di) mark[x] = 1;
		if (disjoint) for (auto x : Pi) mark[x] |= 2;
		for (int x = 0; x < n; x++) if (mark[x] == 0) Ui_old.push_back(x);
		
		double Wi = scop->sum( i, { }, Ui_old);
		vint   Qi = scop->cum( i, { }, Ui_old, Wi + log(urnd()) );
		
		vint Ui_new; Ui_new.reserve(n); // Non-descendants of i in the new graph, minus the new parents of i.
		if (disjoint) for (auto x : Qi) mark[x] |= 4;
		for (int x = 0; x < n; x++) if ((mark[x] & 5) == 0) Ui_new.push_back(x);
		
		double Zi = scop->sum( i, { }, Ui_new);
		double logratio = Wi - Zi;		
				
		// Part II: The children of i.
		
		dagp->rep(Qi, i); // Change the current DAG. Note consider doing this in the static mode.

		// Draw a random permutation of the children of i.
		vint rCi = dagp->C[i]; rperm(rCi);
		// Make the backward permutation.
		vint bCi = rCi; reverse(bCi.begin(), bCi.end());
				
		// Save the old parent sets. Note: indexed in the order of the backward permutation for brevity of notation.
		vvin Pchild(bCi.size()); for (int t = 0; t < (int) bCi.size(); t++) Pchild[t] = dagp->P[bCi[t]];
		// Will save also proposed parent sets, to be indexed via the forward permution.
		vvin Qchild(rCi.size());

		// Remove all parents other than i. Note: as dynamic rep() is slow, consider doing this in the static mode.
		for (auto j : rCi) dagp->rep({ }, j);
		
		// Go through the children of i in the sampled order.
		for (int t = 0; t < (int) rCi.size(); t++){
			int j = rCi[t];
			// Need Dj = the descendants of j in the graph built so far.
			vint Dj = dagp->descendants(j);
			vint Uj; Uj.reserve(n); // Non-descendants of j in the graph built so far.
			vboo mark(n);
			for (auto x : Dj) mark[x] = true;
			for (int x = 0; x < n; x++) if (!mark[x]) Uj.push_back(x);
			double Wj = scop->sum( j, { i }, Uj);
			vint   Qj = scop->cum( j, { i }, Uj, Wj + log(urnd()) );
			Qchild[t] = Qj;
			logratio += Wj;
			dagp->rep(Qj, j); // Change the current DAG. Note: no necessary for the last j.	
		}
		// The reverse direction, from G' to G. 
		// First, remove all but i. 
		// Then add old parent sets in the independent backward random ordering of the children.
		dagp->rep(Pi, i); // Change back. Note: the conribution to logratio was already computed.
		for (auto j : rCi) dagp->rep({ }, j);
		
		for (int t = 0; t < (int) bCi.size(); t++){
			int j = bCi[t];
			// Need Dj = the descendants of j in the graph built so far.
			vint Dj = dagp->descendants(j);
			vint Uj; Uj.reserve(n); // Non-descendants of j in the graph built so far.
			vboo mark(n);
			for (auto x : Dj) mark[x] = true;
			for (int x = 0; x < n; x++) if (!mark[x]) Uj.push_back(x);
			double Zj = scop->sum( j, { i }, Uj);
			logratio -= Zj;
			dagp->rep(Pchild[t], j); // Change the current DAG.
		}
		// Now the DAG is the original one. So, if the move is accepted, has to change again.

		if (urnd() < std::min(1.0, exp(logratio))){	// Accept.
			dagp->turn_static();
			dagp->rep(Qi, i); 
			for (int t = 0; t < (int) rCi.size(); t++){
				int j = rCi[t];
				dagp->rep(Qchild[t], j);
			}
			mbrstat.acc++;
			dagp->turn_dynamic();
		} else { // Reject.
			// No action.
		}
		mbrstat.tot++;
	}
	//gibby.ref();
	//cerr << "\t sMBR_rev: end.\n";
}
	
double DAGsampler::sump(int i, const vint& J, const vint& U){
	return scop->sum(i, J, U);
}
vint DAGsampler::rndp(int i, const vint& J, const vint& U){
	return scop->rnd(i, J, U);
}		

// Calling the Gibby object
//
void DAGsampler::sGib(int t){
	gibby.sim(t);
}
void DAGsampler::sGC(int t){
	gibby.sGC(t);
}
vint DAGsampler::rndg(){
	vint ij(2); gibby.rnd(ij[0], ij[1]); return ij;
}
void DAGsampler::remg(int i, int j){
	gibby.rem(i, j);
}
void DAGsampler::addg(int i, int j){
	gibby.add(i, j);
}
void DAGsampler::revg(int i, int j){
	gibby.rev(i, j);
}
void DAGsampler::repg(const vint& P, int j){
	gibby.rep(P, j);
}

// Testing
//
int	DAGsampler::test(){
	using namespace std;
	// Tests score sums.
	int n = scop->n;
	for (int i = 0; i < n; i++){
		vint L = { }; 
		vint U; U.reserve(n/2); for (int s = 0; s < n/2; s++) if (s != i) U.push_back(s);
		double delta = 1.0/(1ULL << 30);
		cerr << "\t i = " << i;
		for (int t = 0; t < 6; t++){
			double val = scop->sum(i, L, U, delta);
			cerr << ", val = " << scientific << val;
			if (t == 0) scop->srt(i);
			delta *= 100;
		}
		cerr << endl;
	}
	return 0;
	//return gibby.test();
}
void DAGsampler::info(){
	gibby.info();
	scop->info();
}

#endif
