##GIT04

## НА1: Setting up a Basic GitHub Action

```yaml
name: Hello Action
on: [push]

jobs:
  print:
    runs-on: ubuntu-latest
    steps:
      - name: Add repo
        uses: actions/checkout@v4
      - name: Set up python3
        uses: actions/setup-python@v5
        with:
          python-version: '3.10' 
      - name: Run hello script
        run: python hello.py
```

## НА2:2: Building and Testing with GitHub Actions

```yaml
name: Test script Action
on: [push]

jobs:
  print:
    runs-on: ubuntu-latest
    steps:
      - name: Add repo
        uses: actions/checkout@v4
      - name: Set up python3
        uses: actions/setup-python@v5
        with:
          python-version: '3.10' 
      - name: Run unit tests
        run: python testfactorial.py -v
```		

### Unit tests

```python
from factorial import Factorial
import unittest


class TestFactorial(unittest.TestCase):

  def setUp(self):
    self.factor = Factorial(self)

  def test_factorial(self):
    self.assertEqual(self.factor.factorial(10), 3628800,
                     "Factorial of 10 is 3628800")
    self.assertEqual(self.factor.factorial(2), 2, "Factorial of 2 is 2")

if __name__ == "__main__":
  unittest.main()
```

### Python script

```python
from math import factorial

class Factorial:
   def __init__(self, num):
      self.num=num

   def factorial(self,num):
      if num == 0:
        return 1
      factor=1
      for i in range(1, num+1):
        factor=factor*i
      return factor

def main():

    factor=Factorial(int(input()))
    print(factor.factorial(factor.num))

if __name__ == "__main__":
    main()
```