import unittest
from calc import add_numbers  # Импортируем функцию

class TestCalculator(unittest.TestCase):
    def test_add_positive_numbers(self):
        """Сложение двух положительных чисел."""
        self.assertEqual(add_numbers(2, 3), 5)

    def test_add_negative_numbers(self):
        """Сложение двух отрицательных чисел."""
        self.assertEqual(add_numbers(-1, -1), -2)

    def test_add_mixed_numbers(self):
        """Сложение положительного и отрицательного числа."""
        self.assertEqual(add_numbers(-2, 5), 3)

    def test_add_zeros(self):
        """Сложение двух нулей."""
        self.assertEqual(add_numbers(0, 0), 0)

if __name__ == "__main__":
    unittest.main()
