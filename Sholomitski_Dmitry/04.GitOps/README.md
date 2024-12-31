## Homework Assignment 1: Setting up a Basic GitHub Action

Created repository - [GitHub](https://github.com/xaos613/gitaction)

Created python script

``` python 
print("Hello, GitHub Actions!")
```
Created python githab action

``` yaml
name: Check remote host and push report

on:
  push:
    branches:
    - master
jobs:
  hello:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - name: Set up Python
      uses: actions/setup-python@v4
      with:
        python-version: '3.13'

    - run: python hello.py
```
Result on github action

[Link to action](https://github.com/xaos613/gitaction/actions/workflows/hello.yml)

![alt text](images/image.png)

## Homework Assignment 2: Building and Testing with GitHub Actions

Created python script

``` python 
def square_number(number: float) -> float:
    """
    Squares a number (second degree).

    Args:
        number (float): The number to square

    Returns:
        Float: The result of squaring

    Raises:
        TypeError: If the input parameter is not a number
    """
    if not isinstance(number, (int, float)):
        raise TypeError("The input parameter must be a number")
    return number ** 2

import unittest

class TestSquareNumber(unittest.TestCase):
    def test_positive_numbers(self):
        self.assertEqual(square_number(2), 4)
        self.assertEqual(square_number(5), 25)
        self.assertEqual(square_number(10), 100)

    def test_negative_numbers(self):
        self.assertEqual(square_number(-2), 4)
        self.assertEqual(square_number(-5), 25)

    def test_zero(self):
        self.assertEqual(square_number(0), 0)

    def test_float_numbers(self):
        self.assertAlmostEqual(square_number(1.5), 2.25)
        self.assertAlmostEqual(square_number(-1.5), 2.25)

    def test_invalid_types(self):
        # Check that the function calls TypeError for invalid types
        with self.assertRaises(TypeError):
            square_number("2")
        with self.assertRaises(TypeError):
            square_number([1, 2, 3])
        with self.assertRaises(TypeError):
            square_number(None)
        with self.assertRaises(TypeError):
            square_number({"number": 2})

if __name__ == '__main__':
    unittest.main()
```
Created python githab action

``` yaml
name: Test py file
on:
  push:
    branches:
    - master
jobs:
  hello:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - name: Set up Python
      uses: actions/setup-python@v4
      with:
        python-version: '3.10'

    - run: python square.py
```
Result on github action 

[Link to action](https://github.com/xaos613/gitaction/actions/workflows/test_py.yml)

![alt text](images/image2.png)
