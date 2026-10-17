package multicriteriaSTCuts.dynamicProgamming;

import dataLogging.DataLog;
import datastructures.NtdNode;

import static multicriteriaSTCuts.dynamicProgamming.algorithms.HeuristicBicritSolutionHeap.lbMinCount;
import static utils.ArrayMath.increaseArray;

import improvements.Multithreader;
import main.Settings;
import multicriteriaSTCuts.dynamicProgamming.algorithms.*;
import multicriteriaSTCuts.dynamicProgamming.outsourcing.OutsourcedSolutionArray;
import multicriteriaSTCuts.dynamicProgamming.outsourcing.SolutionArray;
import utils.ArrayMath;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.*;
import java.util.concurrent.atomic.AtomicLong;
import java.util.stream.IntStream;

public class MincutSolutionVector {

    static private final Logger logger = LoggerFactory.getLogger(MincutSolutionVector.class);

    public SolutionArray solutionArray;

    public HashMap<Integer, Integer> pathIndex;

    private int pathMaxBagSize;

    private final MincutDynprog dynprog;
    private static final int[] binary = IntStream.range(0, 31).map(i -> 1 << i).toArray(); 

    
    private long numSolutions;
    private int numIntroducedVertices;
    private int numForgottenVertices;

    private List<Integer> sampleMainChildIndices; 


    public MincutSolutionVector(MincutDynprog dynprog, HashMap<Integer, Integer> pathIndex, int pathMaxBagSize, int stackIdx) {
        this(dynprog, pathIndex, pathMaxBagSize,null,null,stackIdx);
    }

    public MincutSolutionVector(MincutDynprog dynprog, HashMap<Integer, Integer> pathIndex, int pathMaxBagSize,
                                MincutSolutionVector first_sv, MincutSolutionVector second_sv, int stackIdx) {

        
        if (Settings.outsource && first_sv != null && second_sv != null) {
            ((OutsourcedSolutionArray) first_sv.solutionArray).addFolderSuffix("_old");
            ((OutsourcedSolutionArray) second_sv.solutionArray).addFolderSuffix("_old");
        }

        this.dynprog = dynprog;

        
        
        this.pathIndex = pathIndex;
        this.pathMaxBagSize = pathMaxBagSize;
        
        solutionArray = SolutionArray.createSolutionArray((int) Math.pow(2, pathMaxBagSize),stackIdx, dynprog);

    }

    public void leaf() {
        
        numSolutions = 1;
        numIntroducedVertices = 0;
        numForgottenVertices = 0;

        
        ArrayList<SolutionPointer> entry = new ArrayList<>();
        entry.add(new SolutionPointer(dynprog.mincutGraph.getWeightDimension()));
        solutionArray.set(0,entry);
    }

    public void introduce(NtdNode node) {
        
        numIntroducedVertices++;
        numSolutions *= 2;



        int v = node.getSpecialVertex();

        
        double[] nodeWeightChange = getIntroduceNodeWeightChange(v);

        
        HashMap<Integer, Integer> invPathIndex = getInvPathIndex(node.getBag(), pathIndex);

        int v_binary = binary[pathIndex.get(v)];

        
        Multithreader multithreader = new Multithreader();

        
        HashSet<Integer> targetBag = new HashSet<>(node.getBag());
        targetBag.remove(v);

        for (Iterator<Integer> it = solutionArray.getNonNullIndexIterator(targetBag,pathIndex); it.hasNext(); ) {
            if(Thread.interrupted()){
                multithreader.waitForFinish();
                throw new RuntimeException();
            }
            int S_binary = it.next();

            
            int S_cup_v_binary = S_binary | v_binary;
            multithreader.submit(() -> {
                solutionArray.set(S_cup_v_binary, introduceComputeEntry(solutionArray.get(S_binary), v, nodeWeightChange, S_binary, invPathIndex, pathMaxBagSize));
                return null;
            });
        }

        
        multithreader.waitForFinish();

    }

    private ArrayList<SolutionPointer> introduceComputeEntry(ArrayList<SolutionPointer> oSolutions, int v, double[] nodeWeightChange, int S_binary, HashMap<Integer, Integer> invPathIndex, int pathMaxBagSize) {
        ArrayList<SolutionPointer> newSolutions = new ArrayList<>(oSolutions.size());

        
        double[] entryWeightChange = getIntroduceEntryWeightChange(v, S_binary, invPathIndex);


        
        for (SolutionPointer oSolution : oSolutions) {

            
            double[] newSolutionWeight = Arrays.copyOf(oSolution.getWeight(), oSolution.getWeight().length);

            
            increaseArray(newSolutionWeight, nodeWeightChange);

            
            increaseArray(newSolutionWeight, entryWeightChange, -2);

            
            newSolutions.add(new SolutionPointer(
                    newSolutionWeight,
                    v,
                    oSolution,
                    null
            ));
        }
        return newSolutions;
    }

    private double[] getIntroduceNodeWeightChange(int v) {
        double[] nodeWeightChange = new double[dynprog.mincutGraph.getWeightDimension()];
        increaseArray(nodeWeightChange, dynprog.mincutGraph.getEdgeWeight("s", v), -1);
        increaseArray(nodeWeightChange, dynprog.mincutGraph.getEdgeWeight("t", v));
        for (int u : dynprog.mincutGraph.getJd_graph().getNeighborhood(v)) {
            increaseArray(nodeWeightChange, dynprog.mincutGraph.getEdgeWeight(u, v));
        }
        return nodeWeightChange;
    }

    private double[] getIntroduceEntryWeightChange(int v, int S_binary, HashMap<Integer, Integer> invPathIndex) {
        double[] entryWeightChange = new double[dynprog.mincutGraph.getWeightDimension()];
        Set<Integer> S = getVerticesFromBinary(S_binary, invPathIndex);
        for (int u : S) {
            increaseArray(entryWeightChange, dynprog.mincutGraph.getEdgeWeight(u, v));
        }
        return entryWeightChange;
    }

    public void forget(NtdNode node) {
        
        numForgottenVertices++;

        
        int v = node.getSpecialVertex();
        int v_binary = binary[pathIndex.get(v)];

        
        HashSet<Integer> targetBag = new HashSet<>(node.getBag());
        targetBag.remove(v);

        for (Iterator<Integer> it = solutionArray.getNonNullIndexIterator(targetBag,pathIndex); it.hasNext(); ) {
            if(Thread.interrupted()) throw new RuntimeException();

            int S_binary = it.next();

            
            List<SolutionPointer> S_solutions = solutionArray.get(S_binary);

            
            int S_cup_v_binary = S_binary | v_binary;
            List<SolutionPointer> S_cup_v_solutions = solutionArray.get(S_cup_v_binary);
            solutionArray.set(S_cup_v_binary, null);

            
            numSolutions -= S_solutions.size() + S_cup_v_solutions.size();

            
            solutionArray.set(S_binary, poMerge(S_solutions, S_cup_v_solutions));

            
            numSolutions += solutionArray.getEntrySize(S_binary);
        }


    }

    private ArrayList<SolutionPointer> poMerge(List<SolutionPointer> aSolutions, List<SolutionPointer> bSolutions) {
        
        if (dynprog.mincutGraph.getWeightDimension() != 2) {
            throw new RuntimeException("Merge has so far only been implemented for the bicriteria case");
        } else {
            return poMergeBicrit(aSolutions, bSolutions);
        }
    }

    private ArrayList<SolutionPointer> poMergeBicrit(List<SolutionPointer> aSolutions, List<SolutionPointer> bSolutions) {
        ArrayList<SolutionPointer> mergedSolutions = new ArrayList<>();
        BicritMergeIterator mergeIterator = new BicritMergeIterator(aSolutions, bSolutions);

        double[] lastPOSWeight = new double[]{Double.MAX_VALUE, Double.MAX_VALUE};

        while (mergeIterator.hasNext()) {
            if(Thread.interrupted()) throw new RuntimeException();

            SolutionPointer currentSolution = mergeIterator.next();
            if ((currentSolution.getWeight()[1] < lastPOSWeight[1]) ||
                    (!dynprog.uniqueWeights && currentSolution.getWeight()[1] == lastPOSWeight[1] && currentSolution.getWeight()[0] == lastPOSWeight[0])) {
                
                lastPOSWeight = currentSolution.getWeight();
                mergedSolutions.add(currentSolution);
            }
        }
        return mergedSolutions;
    }


    public void join(NtdNode node, MincutSolutionVector first_sv, MincutSolutionVector second_sv) {
        
        numSolutions = 0;
        numIntroducedVertices = first_sv.getNumIntroducedVertices() + second_sv.getNumIntroducedVertices() - node.getBag().size();
        numForgottenVertices = first_sv.numForgottenVertices + second_sv.numForgottenVertices;


        
        
        HashMap<Integer, Integer> childInvPathIndex = getInvPathIndex(node.getBag(), first_sv.pathIndex);

        
        Multithreader multithreader = new Multithreader();
        int entryCount = (int) Math.pow(2, node.getBag().size())-1;
        AtomicLong numSolutionsAtomic = new AtomicLong();

        
        if(Settings.dataLogJoinDetailed)
            joinSampleEntryInput(first_sv, second_sv);


        
        HashSet<Integer> targetBag = new HashSet<>(node.getBag());

        
        
        for (Iterator<Integer> it = solutionArray.getNonNullIndexIterator(targetBag,first_sv.pathIndex); it.hasNext(); ) {
            if(Thread.interrupted()){
                multithreader.waitForFinish();
                throw new RuntimeException();
            }

            int child_S_binary = it.next();

            multithreader.submit(() -> {
                joinComputeEntry(child_S_binary, childInvPathIndex, pathMaxBagSize,  first_sv.solutionArray, second_sv.solutionArray, entryCount, numSolutionsAtomic);
                return null;
            });
        }

        
        multithreader.waitForFinish();

        
        numSolutions = numSolutionsAtomic.get();

        
        if (Settings.outsource) {
            ((OutsourcedSolutionArray) first_sv.solutionArray).deleteFolder();
            ((OutsourcedSolutionArray) second_sv.solutionArray).deleteFolder();
        }

        
        if (Settings.dataLogJoinDetailed)
            joinSampleEntryOutput(childInvPathIndex, node);


    }

    private void joinComputeEntry(int child_S_binary, HashMap<Integer, Integer> childInvPathIndex, int pathMaxBagSize, SolutionArray aSolutionArray, SolutionArray bSolutionArray, int entryCount, AtomicLong numSolutionsAtomic) {
        logger.trace("starting computeJoinFor [{}/{}]",child_S_binary,entryCount);

        
        HashSet<Integer> S = getVerticesFromBinary(child_S_binary, childInvPathIndex);

        
        int parentSBinary = getBinaryFromVertices(S, pathIndex);

        
        double[] weightOverlap = getWeightOverlap(S);

        
        if (dynprog.mincutGraph.getWeightDimension() != 2) {
            throw new RuntimeException("Combining has so far only been implemented for the bicriteria case");
        } else {
            solutionArray.set(parentSBinary, poCombineBicrit(aSolutionArray.get(child_S_binary), bSolutionArray.get(child_S_binary), weightOverlap,dynprog.currentNodeNr,child_S_binary, dynprog.uniqueWeights));
        }

        
        if (Settings.outsource) {
            ((OutsourcedSolutionArray) aSolutionArray).deleteEntryFile(child_S_binary);
            ((OutsourcedSolutionArray) bSolutionArray).deleteEntryFile(child_S_binary);
        }

        numSolutionsAtomic.addAndGet(solutionArray.getEntrySize(parentSBinary));
    }

    public static ArrayList<SolutionPointer> poCombineBicrit(ArrayList<SolutionPointer> aSolutions, ArrayList<SolutionPointer> bSolutions, double[] weightOverlap,int nodeNr, int child_S_binary, boolean useUniqueWeights) {


        BicritSolutionHeap heap = Settings.useJoinNodeHeuristic &&
                HeuristicBicritSolutionHeap.lbMinCount*2<=Math.max(aSolutions.size(),bSolutions.size()) 
                ?
                new HeuristicBicritSolutionHeap(aSolutions, bSolutions, weightOverlap, true, nodeNr, child_S_binary, 0) :
                new NormalBicritSolutionHeap(aSolutions, bSolutions, weightOverlap, true, nodeNr, child_S_binary, 0);

        ArrayList<SolutionPointer> newSolutions = heap.exhaustHeapSolutions(useUniqueWeights);

        
        heap.doHeuristicDatalog(newSolutions.size(), -1);

        return newSolutions;
    }


    public void joinForget(NtdNode node, MincutSolutionVector first_sv, MincutSolutionVector second_sv) {
        
        numSolutions = 0;
        numIntroducedVertices = first_sv.getNumIntroducedVertices() + second_sv.getNumIntroducedVertices() - node.getBag().size();
        numForgottenVertices = first_sv.numForgottenVertices + second_sv.numForgottenVertices;
        numForgottenVertices += node.getForgottenVertices().size();
        if(node.getNodeType()== NtdNode.NodeType.INTRODUCE_JOIN_FORGET)
            numIntroducedVertices += node.getFirstChildIntroducedVertices().size() + node.getSecondChildIntroducedVertices().size();


        
        
        HashMap<Integer, Integer> childInvPathIndex = getInvPathIndex(node.getBag(), first_sv.pathIndex);

        
        Multithreader multithreader = new Multithreader();
        int entryCount = (int) Math.pow(2, node.getBag().size())-1;
        AtomicLong numSolutionsAtomic = new AtomicLong();

        
        int forgotten_binary = getBinaryFromVertices(node.getForgottenVertices(), first_sv.pathIndex);

        
        if (Settings.dataLogJoinDetailed) {
            joinForgetSampleEntryInput(node, first_sv, second_sv, forgotten_binary, childInvPathIndex);
        }

        
        HashSet<Integer> targetBag = new HashSet<>(node.getBag());
        targetBag.removeAll(node.getForgottenVertices());

        
        for (Iterator<Integer> it = solutionArray.getNonNullIndexIterator(targetBag,first_sv.pathIndex); it.hasNext(); ) {
            if (Thread.interrupted()) {
                multithreader.waitForFinish();
                throw new RuntimeException();
            }
            int child_S_binary = it.next();

            multithreader.submit(() -> {
                joinForgetComputeEntry(first_sv,second_sv,node, child_S_binary, pathMaxBagSize, first_sv.solutionArray, second_sv.solutionArray,
                        first_sv.pathIndex, childInvPathIndex, entryCount, numSolutionsAtomic);
                return null;
            });
        }

        
        multithreader.waitForFinish();


        
        numSolutions = numSolutionsAtomic.get();

        
        if (Settings.outsource) {
            ((OutsourcedSolutionArray) first_sv.solutionArray).deleteFolder();
            ((OutsourcedSolutionArray) second_sv.solutionArray).deleteFolder();
        }

        
        if (Settings.dataLogJoinDetailed) {
            joinSampleEntryOutput(childInvPathIndex, node);
        }


    }

    private void joinForgetComputeEntry(MincutSolutionVector first_sv, MincutSolutionVector second_sv, NtdNode node, int child_S_binary, int pathMaxBagSize, SolutionArray aSolutionArray, SolutionArray bSolutionArray,
                                        HashMap<Integer, Integer> childPathIndex,
                                        HashMap<Integer, Integer> childInvPathIndex, int entryCount, AtomicLong numSolutionsAtomic) {

        logger.trace("starting computeJoinForgetFor [{}/{}]",child_S_binary,entryCount);

        
        HashSet<Integer> target_S = getVerticesFromBinary(child_S_binary, childInvPathIndex);
        int target_parentSBinary = getBinaryFromVertices(target_S,pathIndex);

        
        List<HeapTuple> heapTupleList = new ArrayList<>((int) Math.pow(2,node.getForgottenVertices().size()));
        List<Integer> child_S_binary_list = new ArrayList<>();

        for(Set<Integer> forgotten_subset : getAllSubsets(node.getForgottenVertices())){ 
            Set<Integer> other_S = new HashSet<>(target_S);
            other_S.addAll(forgotten_subset);
            int other_child_S_binary = child_S_binary | getBinaryFromVertices(other_S,childPathIndex);
            child_S_binary_list.add(other_child_S_binary);

            double[] other_weightOverlap = getWeightOverlap(other_S);

            List<SolutionPointer> other_aSolutions;
            List<SolutionPointer> other_bSolutions;

            

            if (node.getNodeType() == NtdNode.NodeType.INTRODUCE_JOIN_FORGET) {
                other_aSolutions = getProxySolutions(first_sv,node,true,other_S,childPathIndex,childInvPathIndex);
                other_bSolutions = getProxySolutions(second_sv,node,false,other_S,childPathIndex,childInvPathIndex);
            } else {
                other_aSolutions = aSolutionArray.get(other_child_S_binary);
                other_bSolutions = bSolutionArray.get(other_child_S_binary);
            }

            heapTupleList.add(new HeapTuple(other_aSolutions, other_bSolutions, other_weightOverlap,other_child_S_binary));
        }

        ArrayList<SolutionPointer> newSolutions = poCombineFusedBicrit(heapTupleList,dynprog.currentNodeNr, child_S_binary,dynprog.uniqueWeights);

        
        if(node.getNodeType() == NtdNode.NodeType.INTRODUCE_JOIN_FORGET && Settings.outsource){
            for (int i = 0; i < newSolutions.size(); i++) {
                SolutionPointer newSolution = newSolutions.get(i);

                
                

                if (newSolution.solutionOrigin.joinNodeId != -1) {
                    ((OutsourcedSolutionArray) first_sv.solutionArray).createOriginPointerEntry(newSolution.solutionOrigin);
                }
                if (newSolution.secondSolutionOrigin.joinNodeId != -1) {
                    ((OutsourcedSolutionArray) first_sv.solutionArray).createOriginPointerEntry(newSolution.secondSolutionOrigin);
                }
            }
        }

        solutionArray.set(target_parentSBinary,newSolutions);

        
        if (Settings.outsource && !(node.getNodeType() == NtdNode.NodeType.INTRODUCE_JOIN_FORGET)) {
            for (int other_child_S_binary : child_S_binary_list) {
                ((OutsourcedSolutionArray) aSolutionArray).deleteEntryFile(other_child_S_binary);
                ((OutsourcedSolutionArray) bSolutionArray).deleteEntryFile(other_child_S_binary);
            }
        }

        numSolutionsAtomic.addAndGet(solutionArray.getEntrySize(target_parentSBinary));
    }

    private List<SolutionPointer> getProxySolutions(
            MincutSolutionVector side_sv, NtdNode node, boolean firstChild,
            Set<Integer> S, HashMap<Integer, Integer> childPathIndex, HashMap<Integer, Integer> childInvPathIndex){

        SolutionArray side_solutionArray = side_sv.solutionArray;



        List<Integer> side_introduced_vertices = firstChild ? node.getFirstChildIntroducedVertices() : node.getSecondChildIntroducedVertices();

        
        List<Integer> S_side_introduced_vertices = new ArrayList<>(side_introduced_vertices);
        S_side_introduced_vertices.retainAll(S);


        
        if(S_side_introduced_vertices.isEmpty()){
            return side_solutionArray.get(getBinaryFromVertices(S,childPathIndex));
        }

        
        List<Integer> side_base_vertices = new ArrayList<>(node.getBag());
        side_base_vertices.removeAll(side_introduced_vertices);
        side_base_vertices.sort(Comparator.naturalOrder());

        
        List<Integer> S_base_vertices = new ArrayList<>(side_base_vertices);
        S_base_vertices.retainAll(S);

        
        List<SolutionPointer> baseSolutions = side_solutionArray.get(getBinaryFromVertices(new HashSet<>(S_base_vertices),childPathIndex));

        
        double[] weightChange = new double[dynprog.mincutGraph.getWeightDimension()];
        for(int v : S_side_introduced_vertices){
            
            double[] nodeWeightChange = getIntroduceNodeWeightChange(v);
            increaseArray(weightChange,nodeWeightChange);
        }

        
        Set<Integer> S_during_introduce = new HashSet<>(S_base_vertices);
        for (int v : S_side_introduced_vertices) {
            
            double[] entryWeightChange = getIntroduceEntryWeightChange(v, getBinaryFromVertices(S_during_introduce,childPathIndex), childInvPathIndex);
            increaseArray(weightChange,entryWeightChange,-2);
            S_during_introduce.add(v);
        }

        

        List<SolutionPointer> proxySolutions = new ArrayList<>();
        for(SolutionPointer baseSolution : baseSolutions){
            double[] proxyWeight = Arrays.copyOf(baseSolution.getWeight(),baseSolution.getWeight().length);
            increaseArray(proxyWeight,weightChange);


            
            SolutionPointer sp = new SolutionPointer(dynprog.mincutGraph.getWeightDimension());
            sp.weight = proxyWeight;
            sp.joinNodeId = node.id;
            sp.ivMask = getListMask(S_side_introduced_vertices,side_introduced_vertices);
            sp.isFromFirstChild = firstChild;

            if (Settings.outsource) { 
                sp.id = baseSolution.getId();
            } else { 
                sp.solutionOrigin = baseSolution;
            }


            proxySolutions.add(sp);
        }

        return proxySolutions;
    }

    private static int getListMask(List<Integer> subset, List<Integer> superset) {
        
        int mask = 0;
        for(int i = 0; i < subset.size(); i++){
            mask |= 1 << superset.indexOf(subset.get(i));
        }
        return mask;
    }

    public static List<Integer> reverseListMask(int mask, List<Integer> superset) {
        List<Integer> subset = new ArrayList<>();
        for(int i = 0; i < superset.size(); i++){
            if((mask & (1 << i)) != 0){
                subset.add(superset.get(i));
            }
        }
        return subset;
    }


    public static ArrayList<SolutionPointer> poCombineFusedBicrit(List<HeapTuple> heapTupleList, int nodeNr, int child_S_binary, boolean useUniqueWeights) {
        double aSolutionsAvg = (double) heapTupleList.stream().mapToInt(tuple -> tuple.other_aSolutions.size()).sum() / heapTupleList.size();
        double bSolutionsAvg = (double) heapTupleList.stream().mapToInt(tuple -> tuple.other_bSolutions.size()).sum() / heapTupleList.size();

        
        boolean useHeuristic = Settings.useJoinNodeHeuristic && lbMinCount * 2 <= Math.max(aSolutionsAvg, bSolutionsAvg);

        List<BicritSolutionHeap> heapList = new ArrayList<>(heapTupleList.size());
        for (HeapTuple tuple : heapTupleList) {
            if (useHeuristic) {
                heapList.add(new HeuristicBicritSolutionHeap(tuple.other_aSolutions, tuple.other_bSolutions, tuple.other_weightOverlap, false, nodeNr, tuple.other_entryIndex, 0));
            } else {
                heapList.add(new NormalBicritSolutionHeap(tuple.other_aSolutions, tuple.other_bSolutions, tuple.other_weightOverlap, false, nodeNr, tuple.other_entryIndex, 0));
            }
        }
        FusedBicritSolutionHeap heap = new FusedBicritSolutionHeap(useHeuristic, heapList, child_S_binary, nodeNr, 0);

        
        ArrayList<SolutionPointer> newSolutions = heap.exhaustHeapSolutions(useUniqueWeights);
        return newSolutions;
    }

    private static HashMap<Integer, Integer> getInvPathIndex(Collection<Integer> bag, HashMap<Integer, Integer> pathIndex) {
        HashMap<Integer, Integer> childInvPathIndex = new HashMap<>();
        for (int vertex : bag) {
            childInvPathIndex.put(pathIndex.get(vertex), vertex);
        }
        return childInvPathIndex;
    }

    private Set<Set<Integer>> getAllSubsets(Set<Integer> input_set) {
        List<Integer> input = new ArrayList<>(input_set);
        Set<Set<Integer>> result = new HashSet<>();
        int n = input.size();
        int numberOfSubsets = 1 << n; 

        for (int i = 0; i < numberOfSubsets; i++) {
            Set<Integer> subset = new HashSet<>();
            for (int j = 0; j < n; j++) {
                
                if ((i & (1 << j)) != 0) {
                    subset.add(input.get(j));
                }
            }
            result.add(subset);
        }
        return result;
    }

    private double[] getWeightOverlap(Set<Integer> S) {
        double[] weightOverlap = new double[dynprog.mincutGraph.getWeightDimension()];
        
        for (Integer v : S) {
            for (Integer u : dynprog.mincutGraph.getJd_graph().getNeighborhood(v)) {
                if (!S.contains(u)) {
                    
                    ArrayMath.increaseArray(weightOverlap, dynprog.mincutGraph.getEdgeWeight(u, v));
                }
            }
        }
        
        for (Integer v : S) {
            ArrayMath.increaseArray(weightOverlap, dynprog.mincutGraph.getEdgeWeight("s", v), -1);
            ArrayMath.increaseArray(weightOverlap, dynprog.mincutGraph.getEdgeWeight("t", v), 1);
        }
        return weightOverlap;
    }

    private int getBinaryFromVertices(Set<Integer> S, Map<Integer,Integer> pathIndex) {
        int SBinary = 0;
        for (Integer v : S) {
            int vPathIndex = pathIndex.get(v);
            SBinary = SBinary | binary[vPathIndex];
        }
        return SBinary;
    }

    private HashSet<Integer> getVerticesFromBinary(int SBinary, Map<Integer, Integer> invPathIndex) {
        HashSet<Integer> S = new HashSet<>();

        for (int vPathIndex = 0; true; vPathIndex++) {
            int vBinary = binary[vPathIndex];
            if (vBinary > SBinary) break;
            if ((vBinary & SBinary) != 0) {
                int v = invPathIndex.get(vPathIndex);
                S.add(v);
            }
        }
        return S;
    }

    private void joinSampleEntryInput(MincutSolutionVector first_sv, MincutSolutionVector second_sv) {
        int vBinary = 0;
        sampleMainChildIndices = ((OutsourcedSolutionArray) first_sv.solutionArray).getNonNullIndices(vBinary);
        Collections.shuffle(sampleMainChildIndices);
        sampleMainChildIndices = sampleMainChildIndices.subList(0,Math.min(16, sampleMainChildIndices.size()));
        File firstArrayFolder = ((OutsourcedSolutionArray) first_sv.solutionArray).getArrayFolder();
        File secondArrayFolder = ((OutsourcedSolutionArray) second_sv.solutionArray).getArrayFolder();

        for(int sampleIndex : sampleMainChildIndices){
            File firstEntry = new File(firstArrayFolder + "/" + sampleIndex + ".data");
            File secondEntry = new File(secondArrayFolder + "/" + sampleIndex + ".data");
            File destFolder = new File(DataLog.currentJdDatasetFolder + "/" + dynprog.currentNodeNr + "/" + sampleIndex);
            File firstEntryDest = new File(destFolder + "/first.data");
            File secondEntryDest = new File(destFolder + "/second.data");
            destFolder.mkdirs();
            try {
                Files.copy(firstEntry.toPath(), firstEntryDest.toPath());
                Files.copy(secondEntry.toPath(), secondEntryDest.toPath());
            } catch (IOException e) {
                logger.error("Error when copying the entries for joinDetailed",e);
            }
        }
    }

    private void joinForgetSampleEntryInput(NtdNode node, MincutSolutionVector first_sv, MincutSolutionVector second_sv, int vBinary, HashMap<Integer, Integer> childInvPathIndex) {
        sampleMainChildIndices = ((OutsourcedSolutionArray) first_sv.solutionArray).getNonNullIndices(vBinary);
        Collections.shuffle(sampleMainChildIndices);
        sampleMainChildIndices = sampleMainChildIndices.subList(0,Math.min(16, sampleMainChildIndices.size()));
        File firstArrayFolder = ((OutsourcedSolutionArray) first_sv.solutionArray).getArrayFolder();
        File secondArrayFolder = ((OutsourcedSolutionArray) second_sv.solutionArray).getArrayFolder();

        for(int sampleMainChildIndex : sampleMainChildIndices){
            for(Set<Integer> forgotten_subset : getAllSubsets(node.getForgottenVertices())){ 
                HashSet<Integer> main_S = getVerticesFromBinary(sampleMainChildIndex, childInvPathIndex);
                Set<Integer> other_S = new HashSet<>(main_S);
                other_S.addAll(forgotten_subset);
                int other_childIndex = sampleMainChildIndex | getBinaryFromVertices(other_S, first_sv.pathIndex);


                File firstEntry = new File(firstArrayFolder + "/" + other_childIndex + ".data");
                File secondEntry = new File(secondArrayFolder + "/" + other_childIndex + ".data");
                File destFolder = new File(DataLog.currentJdDatasetFolder + "/" + dynprog.currentNodeNr + "/" + sampleMainChildIndex+ "/" + other_childIndex);
                File firstEntryDest = new File(destFolder + "/first.data");
                File secondEntryDest = new File(destFolder + "/second.data");
                destFolder.mkdirs();
                try {
                    Files.copy(firstEntry.toPath(), firstEntryDest.toPath());
                    Files.copy(secondEntry.toPath(), secondEntryDest.toPath());
                } catch (IOException e) {
                    logger.error("Error when copying the entries for joinDetailed",e);
                }

            }
        }
    }

    private void joinSampleEntryOutput(HashMap<Integer, Integer> childInvPathIndex, NtdNode node) {
        File iArrayFolder = ((OutsourcedSolutionArray) this.solutionArray).getArrayFolder();
        for(int sampleChildIndex : sampleMainChildIndices){
            
            HashSet<Integer> S = getVerticesFromBinary(sampleChildIndex, childInvPathIndex);
            int parentSBinary = getBinaryFromVertices(S,pathIndex);
            File iEntry = new File(iArrayFolder + "/" + parentSBinary + ".data");
            File iEntryDest = new File(DataLog.currentJdDatasetFolder + "/" + dynprog.currentNodeNr + "/" + sampleChildIndex + "/i.data");
            try {
                Files.copy(iEntry.toPath(), iEntryDest.toPath());
            } catch (IOException e) {
                logger.error("Error when copying the entries for joinDetailed",e);
            }
        }
        File infoFile = new File(DataLog.currentJdDatasetFolder + "/" + dynprog.currentNodeNr + "/info.txt");
        try {
            String infoString =
                    "bag_size " + node.getBag().size() + "\n" +
                    "forgotten_size " + (node.getForgottenVertices() == null ? 0 : node.getForgottenVertices().size());
            Files.write(infoFile.toPath(),infoString.getBytes());
        } catch (IOException e) {
            logger.error("Error when writing the info file for joinDetailed",e);
        }



        sampleMainChildIndices = null;
    }

    public long getNumSolutions() {
        return numSolutions;
    }

    public int getNumIntroducedVertices() {
        return numIntroducedVertices;
    }

    public int getNumForgottenVertices() {
        return numForgottenVertices;
    }


    public record HeapTuple(List<SolutionPointer> other_aSolutions, List<SolutionPointer> other_bSolutions, double[] other_weightOverlap, int other_entryIndex) {}
}
