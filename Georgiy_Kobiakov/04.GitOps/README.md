# 04.GitOps
---

## Repo for Assignment 1: Setting up a Basic GitHub Action
[Github repo for task 1](https://github.com/Goshaker/GitOps.git)

hello script

```python
print("Hello, GitHub Actions!")
```

hello yaml file

```yaml
name: Hello Action
on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
    - name: Set up Python
      uses: actions/setup-python@v2
      with:
        python-version: '3.9' 
    - name: Check out
      uses: actions/checkout@v2     
    - name: Run Hello script
      run: python hello.py

```

## Repo for Assignment 2: Building and Testing with GitHub Actions
[Github repo for task 2](https://github.com/Goshaker/MathOperations.git)

Calculator class in MathOps.py

```python
#MathOps class
class Calculator:
  #empty constructor
  def __init__(self):
    pass
  #add method - given two numbers, return the addition
  def add(self, x1, x2):
    return x1 + x2
  #multiply method - given two numbers, return the 
  #multiplication of the two
  def multiply(self, x1, x2):
    return x1 * x2
  #subtract method - given two numbers, return the value
  #of first value minus the second
  def subtract(self, x1, x2):
    return x1 - x2
  #divide method - given two numbers, return the value
  #of first value divided by the second
  def divide(self, x1, x2):
    if x2 != 0:
      return x1/x2
```

Unit test in TestMathOps.py

```python
import unittest
from MathOps import Calculator
#Test cases to test Calulator methods
#You always create  a child class derived from unittest.TestCase
class TestCalculator(unittest.TestCase):
  #setUp method is overridden from the parent class TestCase
  def setUp(self):
    self.calculator = Calculator()
  #Each test method starts with the keyword test_
  def test_add(self):
    self.assertEqual(self.calculator.add(4,7), 11)
  def test_subtract(self):
    self.assertEqual(self.calculator.subtract(10,5), 5)
  def test_multiply(self):
    self.assertEqual(self.calculator.multiply(3,7), 21)
  def test_divide(self):
    self.assertEqual(self.calculator.divide(10,2), 5)
# Executing the tests in the above test case class
if __name__ == "__main__":
  unittest.main()
```

Yaml file for testing

```yaml
name: Unit test for MathOps.py

on:
  push:
    branches:
    - main

jobs:
  prepare:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout repository
      uses: actions/checkout@v2
    - name: Run script
      run: python TestMathOps.py
```