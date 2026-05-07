import unittest
from calculator import add, subtract, multiply, divide, calculate

class TestCalculator(unittest.TestCase):
    
    def test_add(self):
        """Тест сложения"""
        self.assertEqual(add(5, 3), 8)
        self.assertEqual(add(-1, 1), 0)
        self.assertEqual(add(0, 0), 0)
        self.assertEqual(add(2.5, 3.5), 6.0)
    
    def test_subtract(self):
        """Тест вычитания"""
        self.assertEqual(subtract(10, 4), 6)
        self.assertEqual(subtract(0, 5), -5)
        self.assertEqual(subtract(3, 3), 0)
        self.assertEqual(subtract(7.5, 2.5), 5.0)
    
    def test_multiply(self):
        """Тест умножения"""
        self.assertEqual(multiply(4, 3), 12)
        self.assertEqual(multiply(-2, 5), -10)
        self.assertEqual(multiply(0, 100), 0)
        self.assertEqual(multiply(2.5, 2), 5.0)
    
    def test_divide(self):
        """Тест деления"""
        self.assertEqual(divide(10, 2), 5)
        self.assertEqual(divide(7, 2), 3.5)
        self.assertEqual(divide(-6, 3), -2)
        self.assertEqual(divide(5, 1), 5)
    
    def test_divide_by_zero(self):
        """Тест деления на ноль"""
        with self.assertRaises(ValueError):
            divide(10, 0)
    
    def test_calculate(self):
        """Тест основной функции калькулятора"""
        self.assertEqual(calculate(5, 3, "+"), 8)
        self.assertEqual(calculate(10, 4, "-"), 6)
        self.assertEqual(calculate(7, 3, "*"), 21)
        self.assertEqual(calculate(15, 3, "/"), 5)
    
    def test_calculate_invalid_operator(self):
        """Тест на неверный оператор"""
        with self.assertRaises(ValueError):
            calculate(5, 3, "%")
    
    def test_calculate_divide_by_zero(self):
        """Тест деления на ноль через calculate"""
        with self.assertRaises(ValueError):
            calculate(10, 0, "/")

if __name__ == "__main__":
    unittest.main()