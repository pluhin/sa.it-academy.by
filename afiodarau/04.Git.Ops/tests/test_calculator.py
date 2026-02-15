
#!/usr/bin/env python3
"""
Unit tests for the Simple Calculator Program
"""

import unittest
from app.calculator import add, subtract, multiply, divide


class TestCalculator(unittest.TestCase):
    """Test cases for calculator functions"""

    # Test addition
    def test_add_positive_numbers(self):
        """Test adding two positive numbers"""
        self.assertEqual(add(5, 3), 8)

    def test_add_negative_numbers(self):
        """Test adding two negative numbers"""
        self.assertEqual(add(-5, -3), -8)

    def test_add_mixed_numbers(self):
        """Test adding positive and negative numbers"""
        self.assertEqual(add(10, -3), 7)

    def test_add_floats(self):
        """Test adding floating point numbers"""
        self.assertAlmostEqual(add(2.5, 1.5), 4.0)

    def test_add_zero(self):
        """Test adding zero"""
        self.assertEqual(add(5, 0), 5)

    # Test subtraction
    def test_subtract_positive_numbers(self):
        """Test subtracting two positive numbers"""
        self.assertEqual(subtract(10, 3), 7)

    def test_subtract_negative_numbers(self):
        """Test subtracting two negative numbers"""
        self.assertEqual(subtract(-5, -3), -2)

    def test_subtract_mixed_numbers(self):
        """Test subtracting positive and negative numbers"""
        self.assertEqual(subtract(10, -3), 13)

    def test_subtract_floats(self):
        """Test subtracting floating point numbers"""
        self.assertAlmostEqual(subtract(5.5, 2.5), 3.0)

    def test_subtract_zero(self):
        """Test subtracting zero"""
        self.assertEqual(subtract(5, 0), 5)

    # Test multiplication
    def test_multiply_positive_numbers(self):
        """Test multiplying two positive numbers"""
        self.assertEqual(multiply(5, 3), 15)

    def test_multiply_negative_numbers(self):
        """Test multiplying two negative numbers"""
        self.assertEqual(multiply(-5, -3), 15)

    def test_multiply_mixed_numbers(self):
        """Test multiplying positive and negative numbers"""
        self.assertEqual(multiply(5, -3), -15)

    def test_multiply_floats(self):
        """Test multiplying floating point numbers"""
        self.assertAlmostEqual(multiply(2.5, 4), 10.0)

    def test_multiply_by_zero(self):
        """Test multiplying by zero"""
        self.assertEqual(multiply(5, 0), 0)

    def test_multiply_by_one(self):
        """Test multiplying by one"""
        self.assertEqual(multiply(5, 1), 5)

    # Test division
    def test_divide_positive_numbers(self):
        """Test dividing two positive numbers"""
        self.assertAlmostEqual(divide(10, 2), 5.0)

    def test_divide_negative_numbers(self):
        """Test dividing two negative numbers"""
        self.assertAlmostEqual(divide(-10, -2), 5.0)

    def test_divide_mixed_numbers(self):
        """Test dividing positive and negative numbers"""
        self.assertAlmostEqual(divide(10, -2), -5.0)

    def test_divide_floats(self):
        """Test dividing floating point numbers"""
        self.assertAlmostEqual(divide(7.5, 2.5), 3.0)

    def test_divide_by_zero(self):
        """Test dividing by zero returns error message"""
        result = divide(10, 0)
        self.assertEqual(result, "Error: Division by zero")

    def test_divide_result_is_float(self):
        """Test that division always returns a float"""
        result = divide(6, 2)
        self.assertIsInstance(result, float)


if __name__ == "__main__":
    unittest.main()
