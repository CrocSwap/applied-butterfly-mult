import sys
from pathlib import Path
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]/'scripts'))
from reduction_schedule import evaluate, search, ORIGINAL, SELECTED
import reduction_schedule16 as hot16


class ReductionScheduleTests(unittest.TestCase):
    def test_unique_minimum_in_fixed_graph(self):
        report = search()
        self.assertEqual(report['schedules_checked'], 4096)
        self.assertEqual(report['minimum_reductions'], 3)
        self.assertEqual([r['cuts'] for r in report['minimum_schedules']], [sorted(SELECTED)])
        self.assertTrue(evaluate(ORIGINAL)['valid'])
        self.assertEqual(evaluate(SELECTED)['output_bounds'], ['2', '1', '1', '1'])

    def test_unsafe_removal_is_rejected(self):
        self.assertEqual(evaluate(SELECTED-{'Y0'})['reason'], 'integer addition may exceed 2**53')
        self.assertEqual(evaluate(SELECTED-{'Z1'})['reason'], 'output exceeds inverse interface bound')

    def test_hot16_original_is_unique_minimum_in_fixed_graph(self):
        report = hot16.search()
        self.assertEqual(report['schedules_checked'], 65536)
        self.assertEqual(report['minimum_simd_reductions'], 2)
        self.assertEqual([r['cuts'] for r in report['minimum_schedules']], [sorted(hot16.ORIGINAL)])

    def test_hot16_missing_cut_rejected(self):
        self.assertFalse(hot16.evaluate({'0.Z0'})['valid'])
        self.assertFalse(hot16.evaluate({'1.Z0'})['valid'])


if __name__ == '__main__':
    unittest.main()
