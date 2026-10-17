# **Gibby**

This repository provides an implementation of **Gibby**, a highly optimized **Markov chain Monte Carlo (MCMC)** algorithm for sampling **directed acyclic graphs (DAGs)** from their posterior distribution, as described in the paper **[Scaling Up Bayesian DAG Sampling ](https://arxiv.org/abs/2510.25254)**. 

## Algorithm Overview

Gibby efficiently explores the vast space of DAGs using several move types:

- **Gibby Fast Basic Moves (FBM):** Adds, removes, or reverses a single edge.  
- **[New Edge Reversal Move](https://link.springer.com/article/10.1007/s10994-008-5057-7) (REV):** Reverses edges while resampling entire parent sets.
- **[Markov Blanket Resampling Move](https://jmlr.org/papers/v17/su16a.html) (MBR):** Performs large-scale resampling of Markov blankets.  

A **score-pruning technique** can optionally be enabled to discard low-probability parent sets during local score computation, improving scalability and memory efficiency.

## Compilation and Execution

Gibby is implemented in **C++** and can be compiled with **g++** as follows:

```bash
g++ -std=c++17 -march=native -O3 -o gibby gibby.cpp
```
The only mandatory parameter is the data file or the local scores file in `.jkl` format (`.jkl` extension is needed for a correct detection of the score file). The datasets and the score file used in the experiments are located in the `data` folder. For example, run:

```bash
./gibby  ./data/asia1k.dat 
```

Currently, Gibby can generate scores only from discrete data, scored using the BDeu system. We recommend using [GOBNILP](https://benchpressdocs.readthedocs.io/en/latest/structure_learning_algorithms/gobnilp.html) to generate local score files for continuous data. 

If you are only interested in the pruning algorithm, set `-O <filename>` to generate the new score file, and `iter=0` to skip the sampling phase. 

### Optional Parameters

| Parameter | Description | Default |
|-----------|-------------|---------|
| `-d` | Maximum in-degree per node | `-1` (unrestricted) |
| `-e` | Equivalent sample size (ESS) parameter for BDeu score | `1.0` |
| `-p` | Structure prior: `0` uniform, `1` fair, `2` fair+, `-w` edge(w) | `1` |
| `-K` | Number of candidate parents per node | `0` (unrestricted) |
| `-P` | Score pruning mode: `0` none, `1` top-down, `2` bottom-up; if preceded by digit `k>0`, only up to `min{k, maxind}` parents | `0` |
| `-a` | Number of significant bits in approximations | `15` |
| `-R` | Seed for random number generator | random |
| `-O` | Name of the generated output file name for local scores (in `.jkl` format) | none |
| `-M` | Amount of RAM available (in GiB) | `16` |
| `-iter` | Number of main iterations | `10 000` |
| `-burnin` | Number of burn-in iterations | `iter / 10` |
| `-FBM` | Number of Fast Basic Moves  per iteration | `10 000` |
| `-REV` | Number of REV moves per iteration | `200` |
| `-MBR` | Number of MBR moves per iteration | `100` |
| `-iPPE` | Generates a file showing edge posterior probabilities every iPPE `<n>` iterations | none |


## Output Files

After execution, Gibby produces the following outputs:

- **Sampled DAGs** — contains the sampled DAGs over iterations. Each DAG is listed as node–parent relationships in the format `node: parent1,parent2,...`. Nodes with empty parent sets are omitted.
- **Sampled DAGs scores** — contains the sampled DAGs scores over iterations.
- **Edge probability matrix** — contains the posterior probability of the edges  (row = parent, column = child).
- **(Optional) Edge probability matrix per iPPE** — if -iPPE `<n>` is specified, Gibby generates a file showing edge posterior probabilities every n iterations.
- **(Optional) Parent sets scores** — if `-O <filename>` is specified, Gibby also outputs the computed local scores in `.jkl` format.
