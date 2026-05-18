"""Unit tests for calculator module."""

import unittest
from calc import (
    Calculator, 
    reverse_string, 
    count_vowels, 
    is_palindrome
)


class TestCalculator(unittest.TestCase):
    """Test cases for Calculator class."""
    
    def setUp(self):
        """Set up test fixture."""
        self.calc = Calculator()
    
    def test_add(self):
        """Test addition operation."""
        self.assertEqual(self.calc.add(2, 3), 5)
        self.assertEqual(self.calc.add(-1, 1), 0)
        self.assertEqual(self.calc.add(0, 0), 0)
        self.assertEqual(self.calc.add(2.5, 3.5), 6.0)
    
    def test_subtract(self):
        """Test subtraction operation."""
        self.assertEqual(self.calc.subtract(10, 5), 5)
        self.assertEqual(self.calc.subtract(0, 5), -5)
        self.assertEqual(self.calc.subtract(-5, -3), -2)
    
    def test_multiply(self):
        """Test multiplication operation."""
        self.assertEqual(self.calc.multiply(4, 5), 20)
        self.assertEqual(self.calc.multiply(-3, 4), -12)
        self.assertEqual(self.calc.multiply(0, 100), 0)
        self.assertEqual(self.calc.multiply(2.5, 4), 10.0)
    
    def test_divide(self):
        """Test division operation."""
        self.assertEqual(self.calc.divide(10, 2), 5)
        self.assertEqual(self.calc.divide(7, 2), 3.5)
        self.assertEqual(self.calc.divide(-10, 2), -5)
    
    def test_divide_by_zero(self):
        """Test division by zero raises ValueError."""
        with self.assertRaises(ValueError) as context:
            self.calc.divide(10, 0)
        self.assertEqual(str(context.exception), "Cannot divide by zero!")
    
    def test_power(self):
        """Test exponentiation operation."""
        self.assertEqual(self.calc.power(2, 3), 8)
        self.assertEqual(self.calc.power(5, 0), 1)
        self.assertEqual(self.calc.power(4, 0.5), 2.0)
    
    def test_modulo(self):
        """Test modulo operation."""
        self.assertEqual(self.calc.modulo(10, 3), 1)
        self.assertEqual(self.calc.modulo(10, 5), 0)
        
    def test_modulo_by_zero(self):
        """Test modulo by zero raises ValueError."""
        with self.assertRaises(ValueError):
            self.calc.modulo(10, 0)


class TestStringFunctions(unittest.TestCase):
    """Test cases for string manipulation functions."""
    
    def test_reverse_string(self):
        """Test string reversal."""
        self.assertEqual(reverse_string("hello"), "olleh")
        self.assertEqual(reverse_string("Python"), "nohtyP")
        self.assertEqual(reverse_string(""), "")
        self.assertEqual(reverse_string("a"), "a")
        self.assertEqual(reverse_string("12345"), "54321")
    
    def test_count_vowels(self):
        """Test vowel counting."""
        self.assertEqual(count_vowels("hello"), 2)  # e, o
        self.assertEqual(count_vowels("Python"), 1)  # o
        self.assertEqual(count_vowels("AEIOU"), 5)
        self.assertEqual(count_vowels("bcdfg"), 0)
        self.assertEqual(count_vowels(""), 0)
    
    def test_is_palindrome(self):
        """Test palindrome checking."""
        self.assertTrue(is_palindrome("radar"))
        self.assertTrue(is_palindrome("A man, a plan, a canal: panama"))
        self.assertTrue(is_palindrome("Racecar"))
        self.assertTrue(is_palindrome(""))
        self.assertTrue(is_palindrome("a"))
        
        self.assertFalse(is_palindrome("hello"))
        self.assertFalse(is_palindrome("python"))
    
    def test_palindrome_with_spaces(self):
        """Test palindrome with spaces and punctuation."""
        self.assertTrue(is_palindrome("Was it a car or a cat I saw?"))
        self.assertTrue(is_palindrome("Never odd or even"))


class TestIntegration(unittest.TestCase):
    """Integration tests combining multiple operations."""
    
    def setUp(self):
        self.calc = Calculator()
    
    def test_calc_chain_with_string(self):
        """Test calculator chain with string operations."""
        # Calculate something
        result = self.calc.add(10, 5)
        result = self.calc.multiply(result, 2)
        
        # Convert to string and reverse
        str_result = str(result)
        reversed_result = reverse_string(str_result)
        
        self.assertEqual(reversed_result, "03")  # 30 reversed is "03"
    
    def test_calc_and_palindrome(self):
        """Test if calculation results can form palindromes."""
        result = self.calc.power(3, 2)  # 9
        self.assertTrue(is_palindrome(str(result)))


if __name__ == '__main__':
    unittest.main(verbosity=2)
