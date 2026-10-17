#include <iostream>
#include <vector>
#include <fstream>


using namespace std;

void save_vector_of_vectors(const vector<vector<int>>& vec, const string& filename) {
    ofstream out(filename, ios::binary);

    size_t outer_size = vec.size();
    out.write(reinterpret_cast<char*>(&outer_size), sizeof(outer_size));

    for (const auto& inner_vec : vec) {
        size_t inner_size = inner_vec.size();
        out.write(reinterpret_cast<char*>(&inner_size), sizeof(inner_size));  
        out.write(reinterpret_cast<char*>(const_cast<int*>(inner_vec.data())), inner_size * sizeof(int));  
    }

    out.close();
}

void save_matrix_to_file(const vector<vector<int>>& adj, int iterations, const string& filename) {
    ofstream file(filename); 

    if (!file) {
        cerr << "Error opening file: " << filename << endl;
        return;
    }

    int n = adj.size();
    

    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            file << (adj[i][j] / static_cast<double>(iterations));  
            if (j < n - 1) file << " ";  
        }
        file << endl; 
    }

    file.close();
}


void add_post(DAGsampler& ds, int n_nodes, std::vector<std::vector<int>>& adj) {
    for (int i = 0; i < n_nodes; ++i) {

        std::vector<int> connections = ds.getp(i);


        for (int j : connections) {
            adj[j][i] += 1;  
        }
    }
}

