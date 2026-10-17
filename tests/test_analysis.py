import math
from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]/'scripts'))
from compare import summarize
from analyze_experiments import logs, aggregate


def synthetic(factor=1.0):
    rows=[]
    for trial in range(12):
        first=trial%2
        for pos,engine in enumerate((first,1-first,1-first,first)):
            # Linear time drift cancels in each symmetric quartet.
            value=(1000+4*trial+pos)*(factor if engine else 1)
            rows.append({'trial':trial,'position':pos,'engine':engine,
                         'iterations':5,'ns_per_op':value,'cpu_ns_per_op':value})
    return rows


class AnalysisTests(unittest.TestCase):
    def test_null_and_drift(self):
        result=summarize(synthetic(),bootstrap=100)
        for key in ('reduction_pct','ci95_low_pct','ci95_high_pct'):
            self.assertEqual(result[key],0.0)

    def test_known_reduction(self):
        result=summarize(synthetic(.98),bootstrap=100)
        self.assertAlmostEqual(result['reduction_pct'],2.0)
        for x in logs(synthetic(.98),'cpu_ns_per_op'):
            self.assertAlmostEqual(x,-math.log(.98))

    def test_bad_quartet_is_rejected(self):
        rows=synthetic()
        rows[0]['iterations']=6
        with self.assertRaises(AssertionError): logs(rows,'ns_per_op')

    def test_fixed_case_aggregation(self):
        result=aggregate([[0.0]*10,[-math.log(.96)]*10])
        self.assertAlmostEqual(result['reduction_pct'],100*(1-math.sqrt(.96)))
        self.assertAlmostEqual(result['ci95_low_pct'],result['ci95_high_pct'])


if __name__=='__main__':unittest.main()
