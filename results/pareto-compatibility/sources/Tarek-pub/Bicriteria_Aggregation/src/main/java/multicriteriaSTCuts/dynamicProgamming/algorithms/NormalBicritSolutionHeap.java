package multicriteriaSTCuts.dynamicProgamming.algorithms;

import multicriteriaSTCuts.dynamicProgamming.SolutionPointer;
import utils.ArrayMath;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

public class NormalBicritSolutionHeap extends BicritSolutionHeap{


    public NormalBicritSolutionHeap(List<SolutionPointer> firstSolutions, List<SolutionPointer> secondSolutions,
                                    double[] weightOverlap, boolean initHeap, int nodeNr, int childSBinary,
                                    int recursion_level) {
        super(firstSolutions, secondSolutions, weightOverlap,initHeap, nodeNr, childSBinary,recursion_level);
    }

    @Override
    protected List<NormalHeapNode> createHeapNodes() {
        List<NormalHeapNode> heapNodes = new LinkedList<>();
        size = aSolutions.size();
        for (int i = 0; i < size; i++) {
            
            double[] heapNodeWeight = Arrays.copyOf(aSolutions.get(i).getWeight(), aSolutions.get(i).getWeight().length);
            ArrayMath.increaseArray(heapNodeWeight, bSolutions.get(0).getWeight());
            ArrayMath.increaseArray(heapNodeWeight, weightOverlap, -1);

            heapNodes.add(new NormalHeapNode(this,i, heapNodeWeight));
        }
        return heapNodes;
    }

    static class NormalHeapNode extends HeapNode {
        NormalBicritSolutionHeap heapInstance;
        public NormalHeapNode(NormalBicritSolutionHeap heapInstance,int aSolutionIdx, double[] weight) {
            super(aSolutionIdx, weight);
            this.heapInstance = heapInstance;

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
            this.bSolutionIdx++;
            if (this.bSolutionIdx == heapInstance.bSolutions.size()) {
                return false;
            } else {
                this.weight = heapInstance.getAddedWeight(this.aSolutionIdx, this.bSolutionIdx);
                return true;
            }
        }
    }
}
