#include "src/DAGsampler.hpp"
#include "src/post_counts.cpp"

#include <iomanip>
#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <cstdlib>
#include <filesystem>
#include <chrono>
#include <cmath>
#include <random>

void append_adj_matrix(std::ofstream &file,
                       const std::vector<std::vector<int>> &adj,
                       int curr_iter) {
    if (!file) return;
    int n = static_cast<int>(adj.size());
    file << std::fixed << std::setprecision(6);
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            file << (adj[i][j] / static_cast<double>(curr_iter));
            if (j < n - 1) file << " ";
        }
        file << "\n";
    }
    file << "\n";
    file.flush();
}

int main(int argc, char* argv[]) {

    auto t_start = std::chrono::high_resolution_clock::now();
    auto t_precomp_end = t_start;
    auto t_sampling_end = t_start;

    if (argc < 2) {
        std::cerr << "Usage: " << argv[0] << " <datafile or -I file> [options]\n";
        return 1;
    }

    bool shortcut_mode = false;
    std::string datafile;
    datafile = argv[1];

    int iter = -1;
    int burn_in_iter = -1;
    int gibby_iter = 10000;
    int rev_iter = 200;

    int mbr_id_iter  = 0;
    int mbr_rev_iter = 100;
    int mbr_rnd_iter = 0;

    double ess = 1.0;
    int sig_bits = 10;
    int max_indegree1 = -1;
    int max_indegree2 = -1;
    int max_parents = 0;
    int structure_prior = 1;
    int pruning = 2;
    int s_flag = 1;
    int M_param = 16;

    std::string parent_scores_file = "";
    int seed_value = 0;
    int iMAD = 0;
    int n_nodes = 0;

    if (datafile.size() >= 4 && datafile.substr(datafile.size() - 4) == ".jkl") {
        // Read the first line as n_nodes
        std::ifstream f(datafile);
        if (!f) {
            std::cerr << "Cannot open .jkl data file: " << datafile << "\n";
            return 1;
        }
        std::string line;
        if (std::getline(f, line)) {
            std::istringstream ss(line);
            ss >> n_nodes;  // first number = n_nodes
        }
    } else {
        // Read first line and count columns = n_nodes
        std::ifstream f(datafile);
        if (!f) {
            std::cerr << "Cannot open data file: " << datafile << "\n";
            return 1;
        }
        std::string line;
        if (std::getline(f, line)) {
            std::istringstream ss(line);
            std::string token;
            while (ss >> token) ++n_nodes;
        }
    }

    // Now set default max indegree values
    if (max_indegree1 == -1) max_indegree1 = n_nodes - 1;
    if (max_indegree2 == -1) max_indegree2 = max_indegree1;
    
    
    for (int i = 2; i < argc; i++) {
        std::string arg = argv[i];
        if      (arg == "-iter"     && i + 1 < argc) iter = std::atoi(argv[++i]);
        else if (arg == "-burnin"   && i + 1 < argc) burn_in_iter = std::atoi(argv[++i]);
        else if (arg == "-FBM"      && i + 1 < argc) gibby_iter = std::atoi(argv[++i]);
        else if (arg == "-REV"      && i + 1 < argc) rev_iter = std::atoi(argv[++i]);
        else if (arg == "-MBR_id"   && i + 1 < argc) mbr_id_iter  = std::atoi(argv[++i]);
        else if (arg == "-MBR"  && i + 1 < argc) mbr_rev_iter = std::atoi(argv[++i]);
        else if (arg == "-MBR_rnd"  && i + 1 < argc) mbr_rnd_iter = std::atoi(argv[++i]);
        else if (arg == "-O"        && i + 1 < argc) parent_scores_file = argv[++i];
        else if (arg == "-e"        && i + 1 < argc) ess = std::stod(argv[++i]);
        else if (arg == "-s"        && i + 1 < argc) s_flag = std::atoi(argv[++i]);
        else if (arg == "-a"        && i + 1 < argc) sig_bits = std::atoi(argv[++i]);
        else if (arg == "-d"        && i + 1 < argc) {
            max_indegree1 = std::atoi(argv[++i]);
            // Optional second value
            if (i + 1 < argc && argv[i + 1][0] != '-') {
            max_indegree2 = std::atoi(argv[++i]);
            } else {
            max_indegree2 = max_indegree1;
            }
        }
        else if (arg == "-K"        && i + 1 < argc) max_parents = std::atoi(argv[++i]);
        else if (arg == "-M"        && i + 1 < argc) M_param = std::atoi(argv[++i]);
        else if (arg == "-p"        && i + 1 < argc) structure_prior = std::atoi(argv[++i]);
        else if (arg == "-P"        && i + 1 < argc) pruning = std::atoi(argv[++i]);
        else if (arg == "-R"        && i + 1 < argc) seed_value = std::atoi(argv[++i]);
        else if (arg == "-iPPE"     && i + 1 < argc) iMAD = std::atoi(argv[++i]);
    }
    

    if (iter < 0) iter = 10000;
    if (burn_in_iter < 0) burn_in_iter = std::max(1, iter / 10);

    if (seed_value == 0) {
        seed_value = static_cast<int>(
            std::chrono::system_clock::now().time_since_epoch().count() % 1000000);
    }

    std::string user_params;

    user_params = "-s " + std::to_string(s_flag) + " ";
    user_params += "-d " + std::to_string(max_indegree1) + " " + std::to_string(max_indegree2) + " ";
    user_params += "-p " + std::to_string(structure_prior) + " ";
    user_params += "-e " + std::to_string(ess) + " ";
    user_params += "-a " + std::to_string(sig_bits) + " ";
    user_params += "-P " + std::to_string(pruning) + " ";
    user_params += "-K " + std::to_string(max_parents) + " ";
    user_params += "-M " + std::to_string(M_param) + " ";
    user_params += "-R " + std::to_string(seed_value) + " ";
    if (!parent_scores_file.empty())
        user_params += "-O " + parent_scores_file + " ";
    

    std::filesystem::create_directories("results");

    DAGsampler ds;

    ds.init(datafile, true, user_params);

    n_nodes = ds.getn();
    std::vector<std::vector<int>> adj(n_nodes, std::vector<int>(n_nodes, 0));

    std::string moves_tag = "";
    if (gibby_iter > 0) moves_tag += (moves_tag.empty() ? "FBM" : "-FBM");
    if (rev_iter   > 0) moves_tag += (moves_tag.empty() ? "REV" : "-REV");
    if (mbr_id_iter  > 0) moves_tag += (moves_tag.empty() ? "MBRid" : "-MBRid");
    if (mbr_rev_iter > 0) moves_tag += (moves_tag.empty() ? "MBRrev" : "-MBRrev");
    if (mbr_rnd_iter > 0) moves_tag += (moves_tag.empty() ? "MBRnd" : "-MBRnd");
    if (moves_tag.empty()) moves_tag = "NONE";

    std::string base_name = datafile.substr(datafile.find_last_of("/\\") + 1);
    size_t lastdot = base_name.find_last_of(".");
    if (lastdot != std::string::npos) base_name = base_name.substr(0, lastdot);

    std::string score_output     = "results/" + base_name + "_gibby_scores_R" + std::to_string(seed_value) + "_" + moves_tag + ".txt";
    std::string posterior_output = "results/" + base_name + "_gibby_ppe_R" + std::to_string(seed_value) + "_" + moves_tag + ".txt";
    std::string mad_output       = "results/" + base_name + "_gibby_iPPE_R" + std::to_string(seed_value) + "_" + moves_tag + ".txt";
    std::string dags_file = "results/" + base_name + "_gibby_dags_R" + std::to_string(seed_value) + "_" + moves_tag + ".txt";

    // =======================
    // Prints
    // =======================
    std::string prior_str = (structure_prior == 0) ? "uniform" :
                            (structure_prior == 1) ? "fair" :
                            (structure_prior == 2) ? "fair+" :
                            "edge(" + std::to_string(std::abs(structure_prior)) + ")";
    std::string pruning_str = (pruning == 0) ? "no pruning" :
                              (pruning == 1) ? "top-down" :
                              (pruning == 2) ? "bottom-up" : "unknown";

    std::cout << "\n\n\n";
    std::cout << "█▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█\n";
    std::cout << "█                              Gibby DAGs Sampler                               █\n";
    std::cout << "█▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█\n";
    std::cout << "\n╭───────────────────────────── Scoring parameters ───────────────────────────────\n";
    std::cout << "│ \n";
    std::cout << "│ Dataset: " << datafile << "\n";
    int val1 = (max_indegree1 == -1 ? n_nodes - 1 : max_indegree1);
    int val2 = (max_indegree2 == -1 ? n_nodes - 1 : max_indegree2);
    std::cout << "│ Maximum in-degree : ";

    if (val1 == val2) {
        std::cout << val1 << "\n";
    } else {
        std::cout << "(" << val1 << ", " << val2 << ")\n";
    }
    std::cout << "│ Number of candidate parents per node: "
              << (max_parents == 0 ? "unrestricted" : std::to_string(max_parents)) << "\n";
    std::cout << "│ Structure prior: " << prior_str << "\n";
    std::cout << "│ Pruning: " << pruning_str << "\n";
    std::cout << std::fixed << std::setprecision(2);
    std::cout << "│ Score: BDeu (ESS=" << ess << ")\n";
    std::cout.unsetf(std::ios::floatfield);
    std::cout << "│ Number of significant bits in approximations: " << sig_bits << "\n";
    std::cout << "│ Amount of RAM available (GiB): " << M_param << "\n";
    std::cout << "│ \n";
    std::cout << "╭────────────────────────────── MCMC parameters ─────────────────────────────────\n";
    std::cout << "│ \n";
    std::cout << "│ Burn-in iterations: " << burn_in_iter << "\n";
    std::cout << "│ Main iterations: " << iter << "\n";
    std::cout << "│ Fast basic moves per iteration: " << gibby_iter << "\n";
    std::cout << "│ REV moves per iteration: " << rev_iter << "\n";
    std::cout << "│ MBR moves per iteration: " << mbr_rev_iter << "\n";
    if (mbr_id_iter > 0) {
        std::cout << "│ MBR-id moves per iteration: " << mbr_id_iter << "\n";
    }

    if (mbr_rnd_iter > 0) {
        std::cout << "│ MBR-rnd moves per iteration: " << mbr_rnd_iter << "\n";
    }
    std::cout << "│ Random seed (R): " << seed_value << "\n";
    std::cout << "│ \n";
    std::cout << "╭─────────────────────────────── Output files ───────────────────────────────────\n";
    std::cout << "│ \n";
    std::cout << "│ Sampled DAGs -> " << dags_file << "\n";
    std::cout << "│ Sampled DAGs scores -> " << score_output << "\n";
    std::cout << "│ Edge probability matrix -> " << posterior_output << "\n";
    if (iMAD > 0)
        std::cout << "│ Edge probability snapshots -> " << mad_output << " (every " << iMAD << " iters)\n";
    if (!parent_scores_file.empty())
        std::cout << "│ Parent sets scores ->  results/" << parent_scores_file << "\n";
    std::cout << "│ \n\n";
    std::cout << "♦ ♦ ♦ ♦ ♦ ♦ ♦ ♦ ♦ ♦ ♦ ♦ ♦ ♦ ♦ ♦ Sampling phase ♦ ♦ ♦ ♦ ♦ ♦ ♦ ♦ ♦ ♦ ♦ ♦ ♦ ♦ ♦ ♦ ♦ ♦\n\n";

    t_precomp_end = std::chrono::high_resolution_clock::now();

    if (gibby_iter == 0 && rev_iter > 0) {
        std::cout << " Performing one-time warm-up sGib(1000) since -FBM=0 and -REV>0...\n";
        ds.sGib(1000);
    }

    std::cout << " Starting burn-in phase..." << std::endl;
    int progress_interval1 = 100;
    for (int it = 0; it < burn_in_iter; it++) {
        if (gibby_iter > 0) ds.sGib(gibby_iter);
        ds.sREV(rev_iter);

        if (mbr_id_iter  > 0) ds.sMBR(mbr_id_iter,  false, 0);
        if (mbr_rev_iter > 0) ds.sMBR(mbr_rev_iter, false, 1);
        if (mbr_rnd_iter > 0) ds.sMBR(mbr_rnd_iter, false, 2);

        if ((it + 1) % progress_interval1 == 0 || it == burn_in_iter - 1)
            std::cout << "\r Burn-in iteration " << (it + 1)
                      << "/" << burn_in_iter << std::flush;
    }
    std::cout << std::endl << std::endl;

    std::ofstream outfile(score_output);
    if (!outfile) {
        std::cerr << " Error: cannot open output file for scores: "
                  << score_output << std::endl;
        return 1;
    }

    std::ofstream mad_file;
    if (iMAD > 0) {
        mad_file.open(mad_output, std::ios::out | std::ios::trunc);
        if (!mad_file) {
            std::cerr << " Error: cannot open iPPE output file: " << mad_output << std::endl;
            return 1;
        }
    }

    std::ofstream dags_out(dags_file, std::ios::out | std::ios::trunc);
    if (!dags_out) {
        std::cerr << "Error opening dags file: " << dags_file << std::endl;
        return 1;
    }

    std::cout << " Starting main sampling phase..." << std::endl;
    int progress_interval = 100;
    for (int it = 0; it < iter; it++) {
        if (gibby_iter > 0) ds.sGib(gibby_iter);
        ds.sREV(rev_iter);

        if (mbr_id_iter  > 0) ds.sMBR(mbr_id_iter,  false, 0);
        if (mbr_rev_iter > 0) ds.sMBR(mbr_rev_iter, false, 1);
        if (mbr_rnd_iter > 0) ds.sMBR(mbr_rnd_iter, false, 2);

        double t = 0.0;
        std::vector<int> P;
        for (int i = 0; i < n_nodes; ++i) {
            P = ds.getp(i);
            t += ds.gets(i, P);
        }
        outfile << std::fixed << std::setprecision(4) << t << std::endl;

        add_post(ds, n_nodes, adj);
        ds.dagp -> printDAG(dags_out);

        if (iMAD > 0 && (it + 1) % iMAD == 0) {
            append_adj_matrix(mad_file, adj, it + 1);
        }

        if ((it + 1) % progress_interval == 0 || it == iter - 1)
            std::cout << "\r Iteration " << (it + 1) << "/" << iter << std::flush;
    }

    std::cout << std::endl;
    outfile.close();
    dags_out.close();
    t_sampling_end = std::chrono::high_resolution_clock::now();

    save_matrix_to_file(adj, iter, posterior_output);

    double precomp_sec = std::chrono::duration<double>(t_precomp_end - t_start).count();
    double sampling_sec = std::chrono::duration<double>(t_sampling_end - t_precomp_end).count();



    std::ofstream post_append(posterior_output, std::ios::app);
    post_append << "\n# Pre-computation time (seconds): " << std::fixed << std::setprecision(4) << precomp_sec;
    post_append << "\n# Sampling time (seconds): " << std::fixed << std::setprecision(4) << sampling_sec;
    post_append << "\n";
    post_append.close();

    if (iMAD > 0) mad_file.close();

    std::cout << "\n Sampling complete.\n\n";
    std::cout << "Saved:\n  " << dags_file << "\n  " << score_output << "\n  " << posterior_output;
    if (iMAD > 0) std::cout << "\n  " << mad_output;
    std::cout << "\n\n";

    return 0;
}