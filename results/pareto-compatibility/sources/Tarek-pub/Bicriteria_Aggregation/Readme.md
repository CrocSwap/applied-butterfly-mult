# Bicriteria Aggregation

This repository contains the Java implementation of our bicriteria aggregation algorithm presented in our paper 'Parameterized Algorithms for Computing Pareto Sets' (link to be added).  

## Requirements

- Java 21 (recommended).  
  The code may also compile and run with lower versions, but this has not been tested.
- Optional: Maven (for dependency and build management)

## Building

To build the project yourself, clone the repository and use Maven:

```bash
mvn clean package
```

This will generate a new .jar file in the target/ directory.

If you prefer not to build the project manually, a pre-built .jar file is already included in the target/ directory. Maven is not required to run the tool in this case.

## Running
You can run the program using:

```bash
java -jar "target/Bicriteria_Aggregation-1.0.jar" --dataset <datasetPath> --threads <threadNumber>
```


### Important arguments
- --dataset \<path>: Specifies the dataset to be processed. Replace \<path> with a valid dataset path (any folder in 'res/graphs and ntds'). 

- --threads \<number>: Sets the maximum number of threads that the algorithm may use.

- --help: Displays a help text including additional optional parameters for advanced configuration.

### Java options
As usual in Java, you can specify the maximum amount of memory the program may use via the -Xmx option.
For example, -Xmx100g allows the program to use up to 100 GB of RAM.


### Example execution

If you want to run the Algorithm for Osterloh using up to 16 threads and 100GB of RAM, you can use:
```bash
java -jar -Xmx100g "target/Bicriteria_Aggregation-1.0.jar" --dataset "res/graphs and ntds/osterloh" --threads 16
```

## Precomputed Tree Decompositions
For all available datasets, we precomputed tree decompositions, which are stored under 'res/graphs and ntds/'. These are automatically used by the algorithm.

For some datasets, the included tree decomposition is exactly the one selected by our algorithm as the best one (for the final version) after running exactly 1 hour of tree decomposition generation using 16 threads – as described in the paper.
This applies to the datasets osterloh, ahrem, hambach, schobuell, bockelskamp, lottbek, sabbenhausen, gevenich, duengenheim, butzweiler, norheim, stetternich, erlenbach, berga, kelberg, groebzig, bokeloh, heiligenhaus, hillesheim, riesheim, siersdorf, erp, gruppe8, goddula.

For all other datasets, the decomposition included is simply the first one we generated.

## Miscellaneous Notes
- Rounding of weights:
During preprocessing, we round weights to improve performance. In some cases, this can lead to weights being rounded to zero.
As a result, the solution with the minimal area (which should correspond to the empty set) might contain some vertices.

- Component filtering:
For each dataset, we only solve the largest connected component of the graph, since other components were trivial in all tested datasets.
This also means that the constant-weight edge between source s and sink t is ignored, as it is unclear which component it belongs to.
However, this only affects the final solution by a constant offset.
