import unittest
from multiplication import multiplication

class TestSimpleMath(unittest.TestCase):
    def setUp(self):
        self.parameters = [(2, 9, 18),
                           (-3, -6, 18),
                           (24, 0, 0),
                           (-3, 2, -6),
                           (-7, 0, 0)]

    def test_multi(self):
        for i in self.parameters:
            a, b, c = i
            self.assertEqual(multiplication(a, b), c)
