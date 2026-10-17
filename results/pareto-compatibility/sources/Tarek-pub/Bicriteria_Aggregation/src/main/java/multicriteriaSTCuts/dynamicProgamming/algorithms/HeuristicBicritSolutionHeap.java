package multicriteriaSTCuts.dynamicProgamming.algorithms;

import dataLogging.DataLog;
import multicriteriaSTCuts.benchmark.Benchmark;
import multicriteriaSTCuts.dynamicProgamming.SolutionPointer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.*;
import java.util.function.Function;


public class HeuristicBicritSolutionHeap extends BicritSolutionHeap{
    static private final Logger logger = LoggerFactory.getLogger(HeuristicBicritSolutionHeap.class);

    
    public static int numLowerLines = 500;
    public static int numUpperLines = 200;
    public static int numPoHeuristicSegments = 350;
    public static int lbMinCount = 10;
    public static int ubMinCount = 4;
    public static int segmentMinCount = 10;

    public static int segmentSubsampleRate = 1;
    public static int recursiveSumbsampleRate = 25;

    
    protected List<List<int[]>> areaSkipList;
    
    protected List<int[]> nodeSkipList;
    protected int numSkippedNodes;
    private List<BoundLine> smaller_lb; 

    
    private double pointCombs_skipped_percent;
    private double heapNodes_completely_skipped_percent;
    private double lineCombs_skipped_percent;
    public double poCalcSize_percent;

    public HeuristicBicritSolutionHeap(List<SolutionPointer> firstSolutions, List<SolutionPointer> secondSolutions,
                                       double[] weightOverlap, boolean initHeap, int nodeNr, int childSBinary,
                                       int recursion_level) {
        super(firstSolutions, secondSolutions, weightOverlap, initHeap, nodeNr, childSBinary, recursion_level);
    }


    @Override
    protected List<HeuristicHeapNode> createHeapNodes() {
        return createHeapNodes(null);
    }
    protected List<HeuristicHeapNode> createHeapNodes(List<double[]> po_heuristic_points) {
        areaSkipList = new ArrayList<>();
        nodeSkipList = new ArrayList<>();
        computeAreaSkipList(po_heuristic_points);
        compressAreaSkipList();
        computeNodeSkipList();

        size = this.aSolutions.size() - numSkippedNodes;

        List<HeuristicHeapNode> heapNodes = new LinkedList<>();




        
        int aSolutionIdx = 0;
        int nodeSkipIdx = 0;
        int currentAreaIdx = 0;
        while (true) {
            
            if (nodeSkipIdx < nodeSkipList.size() && nodeSkipList.get(nodeSkipIdx)[0] == aSolutionIdx) {
                aSolutionIdx = nodeSkipList.get(nodeSkipIdx)[1];
                nodeSkipIdx++;
            }

            
            if(aSolutionIdx == aSolutions.size())
                break;

            
            while (smaller_lb.get(currentAreaIdx).end_idx <= aSolutionIdx)
                currentAreaIdx++;


            
            HeuristicHeapNode newNode = new HeuristicHeapNode(this, aSolutionIdx, currentAreaIdx, null);
            heapNodes.add(newNode);

            
            if (newNode.getNextAreaStartIdx() == 0) {
                newNode.bSolutionIdx = newNode.getNextAreaEndIdx();
                newNode.areaTupelIdx++;
            }

            
            newNode.weight = getAddedWeight(newNode.aSolutionIdx, newNode.bSolutionIdx);

            
            aSolutionIdx++;
        }

        assert nodeSkipIdx == nodeSkipList.size() : "nodeSkipList nicht vollständig durchlaufen";
        return heapNodes;
    }

    public void doHeuristicDatalog(int numNewSolutions, int mainChildSBinary) {
        
        DataLog.heuristicNode(String.format(Locale.US, "%d,%d,%d,%s,%d,%s,%f,%f,%f,%f,%d,%d,%d,%d",
                Benchmark.currentResult.graph_id, nodeNr, childSBinary,
                mainChildSBinary == -1 ? "" : String.valueOf(mainChildSBinary),
                recursion_level,
                "yes",
                pointCombs_skipped_percent,heapNodes_completely_skipped_percent,lineCombs_skipped_percent,poCalcSize_percent,
                num_heapify,
                aSolutions.size(),bSolutions.size(),
                numNewSolutions));
    }

    private void computeAreaSkipList(List<double[]> po_heuristic_points) {
        boolean isFusedHeap = po_heuristic_points != null;

        smaller_lb = smallerLbFunc(aSolutions); 
        List<BoundLine> bigger_lb = biggerLbFunc(bSolutions); 
        if (!isFusedHeap) { 
            po_heuristic_points = poHeuristicFunc(aSolutions, bSolutions); 
        }
        List<BoundLine> po_heuristic_ub = poHeuristicUbFunc(po_heuristic_points);

        
        int num_skip_line_comb = 0;
        int num_skip_point_comb = 0;
        int num_calc_line_comb = 0;
        int num_calc_point_comb = 0;


        
        int last_outer_ub_idx = 0;

        for (int i = 0; i < smaller_lb.size(); i++) {
            BoundLine a_line = smaller_lb.get(i);
            List<int[]> currentTupelList = new ArrayList<>();
            areaSkipList.add(currentTupelList);

            int last_inner_ub_idx = last_outer_ub_idx;
            for (int j = 0; j < bigger_lb.size(); j++) {
                BoundLine b_line = bigger_lb.get(j);

                
                double[][] lb_line = computeLbLine(a_line, b_line, isFusedHeap);

                

                
                boolean skip_combination = true;

                

                
                if (lb_line[0][0] < po_heuristic_ub.get(0).p0[0]) {
                    skip_combination = false;
                }
                
                else if (lb_line[2][0] > po_heuristic_ub.get(po_heuristic_ub.size() - 1).p1[0]
                        && lb_line[2][1] < po_heuristic_ub.get(po_heuristic_ub.size() - 1).p1[1]) {
                    skip_combination = false;
                }
                
                else if (lb_line[0][0] > po_heuristic_ub.get(po_heuristic_ub.size() - 1).p1[0]
                        && lb_line[2][1] >= po_heuristic_ub.get(po_heuristic_ub.size() - 1).p1[1]) {
                    skip_combination = true;
                } else {

                    
                    
                    for (int k = last_inner_ub_idx; k < po_heuristic_ub.size(); k++) {
                        BoundLine ub_line = po_heuristic_ub.get(k);

                        
                        if (lb_line[0][0] > ub_line.p1[0]) {
                            continue; 
                        } else {
                            
                            last_inner_ub_idx = k; 
                            if (j == 0)
                                last_outer_ub_idx = k; 
                            break;
                        }
                    }

                    for (int k = last_inner_ub_idx; k < po_heuristic_ub.size(); k++) {
                        BoundLine ub_line = po_heuristic_ub.get(k);

                        
                        boolean test_a = !(lb_line[1][0] < ub_line.p0[0] || ub_line.p1[0] < lb_line[0][0]);

                        boolean test_b = !(lb_line[2][0] < ub_line.p0[0] || ub_line.p1[0] < lb_line[1][0]);


                        if (lb_line[2][0] < ub_line.p0[0])
                            break; 

                        
                        if ((test_a && isLbBelowUb(lb_line[0], lb_line[1], ub_line.p0, ub_line.p1))
                                || (test_b && isLbBelowUb(lb_line[1], lb_line[2], ub_line.p0, ub_line.p1))) {
                            skip_combination = false;
                            break;
                        }
                    }
                }

                
                if (skip_combination) {
                    currentTupelList.add(new int[]{b_line.start_idx, b_line.end_idx});
                }

                
                if (skip_combination) {
                    num_skip_line_comb++;
                    num_skip_point_comb += (a_line.end_idx - a_line.start_idx) * (b_line.end_idx - b_line.start_idx);
                } else {
                    num_calc_line_comb++;
                    num_calc_point_comb += (a_line.end_idx - a_line.start_idx) * (b_line.end_idx - b_line.start_idx);
                }
            }
        }

        
        int num_point_comb = aSolutions.size() * bSolutions.size();
        int num_line_comb = smaller_lb.size() * bigger_lb.size();
        if (num_skip_line_comb + num_calc_line_comb != num_line_comb) {
            logger.error("Not all line combinations were tested.");
        }
        if (num_skip_point_comb + num_calc_point_comb != num_point_comb) {
            logger.error("Not all point combinations were tested.");
        }

        pointCombs_skipped_percent = (double) num_skip_point_comb / num_point_comb;
        lineCombs_skipped_percent = (double) num_skip_line_comb / num_line_comb;








    }

    private double[][] computeLbLine(BoundLine a_line, BoundLine b_line, boolean isFusedHeap) {
        double slope_a = a_line.p0[0] == a_line.p1[0] ? Double.MAX_VALUE : (a_line.p1[1] - a_line.p0[1]) / (a_line.p1[0] - a_line.p0[0]);
        double slope_b = b_line.p0[0] == b_line.p1[0] ? Double.MAX_VALUE : (b_line.p1[1] - b_line.p0[1]) / (b_line.p1[0] - b_line.p0[0]);

        BoundLine smallerSlopeLine = (slope_a < slope_b) ? a_line : b_line;
        BoundLine biggerSlopeLine  = (slope_a < slope_b) ? b_line : a_line;

        
        return isFusedHeap ? new double[][]{
                new double[]{smallerSlopeLine.p0[0] + biggerSlopeLine.p0[0] - weightOverlap[0], smallerSlopeLine.p0[1] + biggerSlopeLine.p0[1] - weightOverlap[1]},
                new double[]{smallerSlopeLine.p1[0] + biggerSlopeLine.p0[0] - weightOverlap[0], smallerSlopeLine.p1[1] + biggerSlopeLine.p0[1] - weightOverlap[1]},
                new double[]{smallerSlopeLine.p1[0] + biggerSlopeLine.p1[0] - weightOverlap[0], smallerSlopeLine.p1[1] + biggerSlopeLine.p1[1] - weightOverlap[1]}}
                :
                new double[][]{
                new double[]{smallerSlopeLine.p0[0] + biggerSlopeLine.p0[0], smallerSlopeLine.p0[1] + biggerSlopeLine.p0[1]},
                new double[]{smallerSlopeLine.p1[0] + biggerSlopeLine.p0[0], smallerSlopeLine.p1[1] + biggerSlopeLine.p0[1]},
                new double[]{smallerSlopeLine.p1[0] + biggerSlopeLine.p1[0], smallerSlopeLine.p1[1] + biggerSlopeLine.p1[1]}};


    }

    
    private boolean isLbBelowUb(double[] lStart, double[] lEnd, double[] uStart, double[]uEnd) {
        
        double uSlope = (uEnd[0] != uStart[0]) ? (uEnd[1] - uStart[1]) / (uEnd[0] - uStart[0]) : Double.POSITIVE_INFINITY;
        double uIntercept = uStart[1] - uSlope * uStart[0];
        double lSlope = (lEnd[0] != lStart[0]) ? (lEnd[1] - lStart[1]) / (lEnd[0] - lStart[0]) : Double.POSITIVE_INFINITY;
        double lIntercept = lStart[1] - lSlope * lStart[0];

        
        double xStart = Math.max(uStart[0], lStart[0]);
        double xEnd = Math.min(uEnd[0], lEnd[0]);

        
        double uXStartY = uSlope * xStart + uIntercept;
        double uXEndY = uSlope * xEnd + uIntercept;

        double lXStartY = lSlope * xStart + lIntercept;
        double lXEndY = lSlope * xEnd + lIntercept;

        
        if (lStart[0] == lEnd[0] && lStart[1] == lEnd[1]) {
            lXStartY = lStart[1];
            lXEndY = lStart[1];
        }

        if (uStart[0] == uEnd[0] && uStart[1] == uEnd[1]) {
            uXStartY = uStart[1];
            uXEndY = uStart[1];
        }

        
        return lXStartY <= uXStartY || lXEndY <= uXEndY;
    }

    private List<BoundLine> smallerLbFunc(List<SolutionPointer> solutions) {
        return createDisjointLbLinesByLength(solutions, numLowerLines, lbMinCount);
    }

    private List<BoundLine> biggerLbFunc(List<SolutionPointer> solutions) {
        return createDisjointLbLinesByLength(solutions, numLowerLines, lbMinCount);
    }

    private List<BoundLine> poHeuristicUbFunc(List<double[]> poHeuristicPoints) {
        List<double[]> boundingPoints = getUpperBoundingPoints(poHeuristicPoints);
        return createConnectedUbLinesByLength(boundingPoints, numUpperLines, ubMinCount);
    }

    private List<double[]> poHeuristicFunc(List<SolutionPointer> aSolutions, List<SolutionPointer> bSolutions) {

        
        List<SolutionPointer> aLowerPoints;
        List<SolutionPointer> bLowerPoints;


        if (recursion_level == 0) {
            aLowerPoints = extremePointsOfSegments(aSolutions, numPoHeuristicSegments, segmentMinCount);
            bLowerPoints = extremePointsOfSegments(bSolutions, numPoHeuristicSegments, segmentMinCount);
        } else {
            
            aLowerPoints = getSubsamplePoints(aSolutions, recursiveSumbsampleRate);
            bLowerPoints = getSubsamplePoints(bSolutions, recursiveSumbsampleRate);
        }


        poCalcSize_percent = ((aLowerPoints.size()*bLowerPoints.size()) / (double) (aSolutions.size() * bSolutions.size()));

        return computePoCombinations(aLowerPoints, bLowerPoints);
    }

    private List<double[]> computePoCombinations(List<SolutionPointer> points1Lower, List<SolutionPointer> points2Lower) {


        BicritSolutionHeap smallHeap;
        int recursive_subsample_max = (int) Math.floor(1 / (float) recursiveSumbsampleRate * Math.max(points1Lower.size(), points2Lower.size()));
        if (HeuristicBicritSolutionHeap.lbMinCount * 2 <= recursive_subsample_max && recursiveSumbsampleRate >1) {
            smallHeap = new HeuristicBicritSolutionHeap(points1Lower, points2Lower, new double[]{0, 0}, true, nodeNr, childSBinary, recursion_level+1);
        } else {
            
            smallHeap = new NormalBicritSolutionHeap(points1Lower, points2Lower, new double[]{0,0}, true, nodeNr, childSBinary, recursion_level+1);
        }

        List<double[]> heuristicPoints = smallHeap.exhaustHeapPoints(true);

        smallHeap.doHeuristicDatalog(heuristicPoints.size(), -1);

        return heuristicPoints;
    }

    private static List<BoundLine> createDisjointLbLinesByLength(List<SolutionPointer> points, int numLines, int minCount) {
        int n = points.size();
        numLines = Math.min(numLines, n /  minCount);
        numLines = Math.max(numLines, 1);

        List<BoundLine> segments = new ArrayList<>();
        int pointsPerSegment = n / numLines;
        int remainder = n % numLines;

        int start = 0;
        for (int i = 0; i < numLines; i++) {
            int end = start + pointsPerSegment + (i < remainder ? 1 : 0);
            segments.add(new BoundLine(
                    Arrays.copyOf(points.get(start).getWeight(),2),
                    Arrays.copyOf(points.get(end-1).getWeight(),2),
                    start,end));
            start = end;
        }

        for (BoundLine segment : segments) {
            shiftLine(segment.p0, segment.p1,points,SolutionPointer::getWeight, segment.start_idx,segment.end_idx, 'l');
        }

        return segments;
    }

    private static List<BoundLine> createConnectedUbLinesByLength(List<double[]> points, int numLines, int minCount) {
        if (minCount < 2) {
            minCount = 2;
            logger.error("ubMinCount must be at least 2. Setting ubMinCount to 2.");
        }

        int n = points.size();
        numLines = Math.min(numLines, (n - 1) / (minCount-1));
        numLines = Math.max(numLines, 1);

        List<BoundLine> segments = new ArrayList<>();
        
        int pointsPerSegment = (n + numLines - 1) / numLines;
        int remainder = (n + numLines - 1) % numLines;

        int start = 0;
        for (int i = 0; i < numLines; i++) {
            int end = start + pointsPerSegment + (i < remainder ? 1 : 0);
            segments.add(new BoundLine(
                    Arrays.copyOf(points.get(start),2),
                    Arrays.copyOf(points.get(end-1),2),
                    start,end));
            start = end - 1; 
        }

        for (BoundLine segment : segments) {
            shiftLine(segment.p0, segment.p1, points,p -> p, segment.start_idx,segment.end_idx, 'u');
        }

        return segments;
    }

    public static List<SolutionPointer> extremePointsOfSegments(List<SolutionPointer> solutionPoints, int numLines, int minCount) {
        int n = solutionPoints.size();
        numLines = Math.min(numLines, (int) Math.floor(n / (double) minCount));
        numLines = Math.max(numLines, 1);

        List<List<SolutionPointer>> segments = new ArrayList<>();
        int pointsPerSegment = n / numLines;
        int remainder = n % numLines;

        int start = 0;
        for (int i = 0; i < numLines; i++) {
            int end = start + pointsPerSegment + (i < remainder ? 1 : 0);
            segments.add(solutionPoints.subList(start, end));
            start = end;
        }

        List<SolutionPointer> allExtremePoints = new ArrayList<>();
        for (List<SolutionPointer> segment : segments) {
            allExtremePoints.addAll(extremePoints(segment));
        }


        return getSubsamplePoints(allExtremePoints,segmentSubsampleRate);
    }

    protected static List<SolutionPointer> getSubsamplePoints(List<SolutionPointer> list, int subsampleRate) {
        if(subsampleRate <=1)
            return list;

        List<SolutionPointer> subsampledPoints = new ArrayList<>();
        for (int i = 0; i < list.size(); i += subsampleRate) {
            subsampledPoints.add(list.get(i));
        }

        
        if (list.size() % subsampleRate != 0) {
            subsampledPoints.add(list.get(list.size() - 1));
        }
        return subsampledPoints;
    }

    private static List<SolutionPointer> extremePoints(List<SolutionPointer> solutionPoints) {
        List<Integer> indices = extremePointsIndices(solutionPoints);
        List<SolutionPointer> result = new ArrayList<>(indices.size());
        for (int idx : indices) {
            result.add(solutionPoints.get(idx));
        }
        return result;
    }

    private static List<Integer> extremePointsIndices(List<SolutionPointer> solutionPoints) {
        List<Integer> indices = new ArrayList<>();

        
        for (int i = 0; i < solutionPoints.size(); i++) {
            while (indices.size() >= 2 && crossProduct(solutionPoints.get(indices.get(indices.size() - 2)).getWeight(), solutionPoints.get(indices.get(indices.size() - 1)).getWeight(), solutionPoints.get(i).getWeight()) <= 0) {
                indices.remove(indices.size() - 1);
            }
            indices.add(i);
        }

        return indices;
    }

    private static double crossProduct(double[] p1, double[] p2, double[] p3) {
        return (p2[0] - p1[0]) * (p3[1] - p1[1]) - (p2[1] - p1[1]) * (p3[0] - p1[0]);
    }

    private static List<double[]> getUpperBoundingPoints(List<double[]> points) {
        List<double[]> newArray = new ArrayList<>();
        newArray.add(new double[]{points.get(0)[0], points.get(0)[1]});
        for (int i = 1; i < points.size(); i++) {
            newArray.add(new double[]{points.get(i)[0], points.get(i - 1)[1]});
        }

        return newArray;
    }

    private static <T> void shiftLine(double[] p1, double[] p2, List<T> points, Function<T, double[]> getCoordinates, int pointsStartIdx, int pointsEndIdx, char type) {
        double x1 = p1[0], y1 = p1[1], x2 = p2[0], y2 = p2[1];

        if(x2==x1) 
            return;
        double m = (y2 - y1) / (x2 - x1);
        double b = y1 - m * x1;

        double maxShift = 0;
        for (int i = pointsStartIdx; i < pointsEndIdx; i++){
            double[] p = getCoordinates.apply(points.get(i));
            double yOnLine = m * p[0] + b;
            if (type == 'l' && p[1] < yOnLine) {
                maxShift = Math.max(maxShift, yOnLine - p[1]);
            } else if (type == 'u' && p[1] > yOnLine) {
                maxShift = Math.max(maxShift, p[1] - yOnLine);
            }
        }

        
        p1[1] += (type == 'l') ? -maxShift : maxShift;
        p2[1] += (type == 'l') ? -maxShift : maxShift;
    }

    private void compressAreaSkipList() {
        List<List<int[]>> mergedAreaSkipList = new ArrayList<>();

        for (List<int[]> skipList : areaSkipList) {
            if (skipList.isEmpty()) {
                mergedAreaSkipList.add(new ArrayList<>());
                continue;
            }

            List<int[]> mergedSkipList = new ArrayList<>();
            int[] currentTupel = skipList.get(0);

            for (int i = 1; i < skipList.size(); i++) {
                int[] nextTupel = skipList.get(i);

                
                if (currentTupel[1] == nextTupel[0]) {
                    
                    currentTupel[1] = nextTupel[1];
                } else {
                    
                    mergedSkipList.add(currentTupel);
                    currentTupel = nextTupel;
                }
            }

            
            mergedSkipList.add(currentTupel);
            mergedAreaSkipList.add(mergedSkipList);
        }
        areaSkipList = mergedAreaSkipList;
    }

    private void computeNodeSkipList() {
        int start = -1;

        for (int i = 0; i < areaSkipList.size(); i++) {
            List<int[]> skipList = areaSkipList.get(i);

            
            if (skipList.size() == 1 && skipList.get(0)[0] == 0 && skipList.get(0)[1] == bSolutions.size()) {
                numSkippedNodes += smaller_lb.get(i).end_idx - smaller_lb.get(i).start_idx;
                if (start == -1) {
                    start = smaller_lb.get(i).start_idx; 
                }
            } else {
                if (start != -1) {
                    
                    nodeSkipList.add(new int[]{start,  smaller_lb.get(i-1).end_idx});
                    start = -1; 
                }
            }
        }

        
        if (start != -1) {
            nodeSkipList.add(new int[]{start, smaller_lb.get(smaller_lb.size()-1).end_idx});
        }

        
        heapNodes_completely_skipped_percent = (double) numSkippedNodes / aSolutions.size();


    }

    static class HeuristicHeapNode extends HeapNode {
        private final HeuristicBicritSolutionHeap heapInstance;
        final int areaID;
        int areaTupelIdx = 0;
        public HeuristicHeapNode(HeuristicBicritSolutionHeap heapInstance, int aSolutionIdx, int areaID, double[] weight) {
            super(aSolutionIdx, weight);
            this.areaID = areaID;
            this.heapInstance = heapInstance;
        }

        int getNextAreaStartIdx() {
            if(areaTupelIdx == heapInstance.areaSkipList.get(areaID).size())
                return -1;
            return heapInstance.areaSkipList.get(areaID).get(areaTupelIdx)[0];
        }

        int getNextAreaEndIdx() {
            return heapInstance.areaSkipList.get(areaID).get(areaTupelIdx)[1];
        }

        @Override
        protected SolutionPointer createSolutionPointer() {
            return new SolutionPointer(
                    weight,
                    null,
                    heapInstance.swappedArrays ? heapInstance.bSolutions.get(bSolutionIdx) : heapInstance.aSolutions.get(aSolutionIdx),
                    heapInstance.swappedArrays ? heapInstance.aSolutions.get(aSolutionIdx) : heapInstance.bSolutions.get(bSolutionIdx));
        }

        @Override
        protected boolean increasePointerAndWeight() {
            bSolutionIdx++;
            
            if (getNextAreaStartIdx() == bSolutionIdx) {
                bSolutionIdx = getNextAreaEndIdx();
                areaTupelIdx++;
            }
            
            if (bSolutionIdx < heapInstance.bSolutions.size()) {
                
                weight = heapInstance.getAddedWeight(aSolutionIdx, bSolutionIdx);
                return true;
            } else {
                
                assert getNextAreaStartIdx() == -1 : "heap node sollte am ende der skip list sein";
                return false;
            }
        }
    }

    static class BoundLine {
        double[] p0;
        double[] p1;

        int start_idx;
        int end_idx;

        public BoundLine(double[] p0, double[] p1, int start_idx, int end_idx) {
            this.p0 = p0;
            this.p1 = p1;
            this.start_idx = start_idx;
            this.end_idx = end_idx;
        }
    }
}

