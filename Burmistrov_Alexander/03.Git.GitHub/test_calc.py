import unittest
from calc import sum, div

class TestCalculator(unittest.TestCase):

    def test_add_positive_numbers(self):
        self.assertEqual(sum(2, 3), 5)

    def test_add_negative_numbers(self):
        self.assertEqual(sum(-1, -1), -2)

    def test_divide_success(self):
        self.assertEqual(div(10, 2), 5)

    def test_divide_by_zero(self):
        with self.assertRaises(ValueError):
            div(10, 0)

if __name__ == '__main__':
    unittest.main()
