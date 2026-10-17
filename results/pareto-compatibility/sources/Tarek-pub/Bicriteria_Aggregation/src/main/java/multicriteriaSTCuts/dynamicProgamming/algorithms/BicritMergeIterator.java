package multicriteriaSTCuts.dynamicProgamming.algorithms;

import multicriteriaSTCuts.dynamicProgamming.SolutionPointer;
import utils.ArrayMath;

import java.util.List;
import java.util.NoSuchElementException;

public class BicritMergeIterator {

   private List<SolutionPointer> aSolutions;
   private List<SolutionPointer> bSolutions;

   private int aIdx;
   private int bIdx;

    private boolean hasNext;

    public BicritMergeIterator(List<SolutionPointer> aSolutions, List<SolutionPointer> bSolutions) {
        this.aSolutions = aSolutions;
        this.bSolutions = bSolutions;
        aIdx = 0;
        bIdx = 0;
        hasNext = aIdx < aSolutions.size() || bIdx < bSolutions.size();
    }

    public boolean hasNext() {
        return hasNext;
    }

    public SolutionPointer next() {
        SolutionPointer next;
        if (aIdx < aSolutions.size() && bIdx < bSolutions.size()) {
            if(ArrayMath.isLess(aSolutions.get(aIdx).getWeight(),bSolutions.get(bIdx).getWeight())){
                
                next = aSolutions.get(aIdx);
                aIdx++;
            } else {
                
                next = bSolutions.get(bIdx);
                bIdx++;
            }
        } else if (aIdx < aSolutions.size()) {
            next = aSolutions.get(aIdx);
            aIdx++;
            hasNext = aIdx < aSolutions.size();
        } else if (bIdx < bSolutions.size()) {
            next = bSolutions.get(bIdx);
            bIdx++;
            hasNext = bIdx < bSolutions.size();
        } else {
            throw new NoSuchElementException();
        }
        return next;
    }
}
