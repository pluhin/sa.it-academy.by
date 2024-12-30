# 03.GIT.Hosting

## Homework Assignment 1: Setting up a Basic GitHub Action

[New public repository](https://github.com/MisterRobo/sa.it-academy.by_04.GitOps)


Testing app:
```python
print("Hello, GitHub Actions!")
```

GitHub Action workflow:
```yaml
name: Hello-Git
on:
  push:
    branches:
    - main

jobs:
  hello-job:
    runs-on: ubuntu-latest
    steps:
      - name: Install python
        run: sudo apt update && sudo apt install -y python3

      - name: Copy Git repository
        uses: actions/checkout@v2

      - name: Run app
        run: python3 hello.py
```

[GitHub Action Result](https://github.com/MisterRobo/sa.it-academy.by_04.GitOps/actions/runs/12481607257/job/34834387400)


## Homework Assignment 2: Building and Testing with GitHub Actions

Testing app:
```python
def sum(a, b):
    """Returns the sum of two numbers."""
    return a + b

def subtract(a, b):
    """Returns the difference between two numbers."""
    return a - b

def multiply(a, b):
    """Returns the product of two numbers."""
    return a * b

def divide(a, b):
    """Returns the result of dividing two numbers.
       Throws an exception if the division is by zero.
    """
    if b == 0:
        raise ValueError("На ноль делить нельзя!")
    return a / b
```

Unit tests:
```python
import unittest
from math_operations import sum, subtract, multiply, divide

class TestMathOperations(unittest.TestCase):
    def test_sum(self):
        self.assertEqual(sum(2, 3), 5)
        self.assertEqual(sum(-1, 1), 0)

    def test_subtract(self):
        self.assertEqual(subtract(5, 3), 2)
        self.assertEqual(subtract(0, 11), -11)

    def test_multiply(self):
        self.assertEqual(multiply(2, 3), 6)
        self.assertEqual(multiply(-1, 5), -5)

    def test_divide(self):
        self.assertEqual(divide(6, 3), 2)
        self.assertAlmostEqual(divide(7, 2), 3.5)

        with self.assertRaises(ValueError):
            divide(1, 0)

if __name__ == '__main__':
    unittest.main()
```

GitHub Action workflow:
```yaml
name: Hello-Git
on:
  push:
    branches:
    - main

jobs:
  hello-job:
    runs-on: ubuntu-latest
    steps:
      - name: Copy Git repository
        uses: actions/checkout@v4
      
      - name: Install python
        uses: actions/setup-python@v5
        with:
          python-version: 'pypy3.10'

      - name: Run test app
        run: python3 test_math_operations.py
```


[GitHub Action Result](https://github.com/MisterRobo/sa.it-academy.by_04.GitOps/actions/runs/12543339203/job/34974297584)
