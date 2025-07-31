import unittest
from main import to_upper

class TestToUpper(unittest.TestCase):
    def test_basic(self):
        self.assertEqual(to_upper("привет"), "ПРИВЕТ")

    def test_with_numbers(self):
        self.assertEqual(to_upper("hello123"), "HELLO123")

    def test_empty(self):
        self.assertEqual(to_upper(""), "")

    def test_mixed_case(self):
        self.assertEqual(to_upper("HeLLo"), "HELLO")

if __name__ == "__main__":
    unittest.main()
