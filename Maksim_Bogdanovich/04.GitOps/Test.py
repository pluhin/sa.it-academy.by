import unittest
from calc import calc
class calcTest(unittest.TestCase):
    def test_add(self):
        self.assertEqual(calc.add(4,7), 11)
    def test_subtract(self):
        self.assertEqual(calc.sub(10,5), 7)
    def test_multiply(self):
        self.assertEqual(calc.mult(3,7), 21)
    def test_divide(self):
        self.assertEqual(calc.div(10,2), 3)
if __name__ == "__main__":
    unittest.main()
