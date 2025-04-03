# 04.GitOps

## Homework Assignment 1: Setting up a Basic GitHub Action

[Repository](https://github.com/toyvoKalevala/git-actions)


Hello app:
```python
print("Hello, GitHub Actions!")
```

GitHub Action workflow:
```yaml
name: Run script hello.py on push
on:
  push:
    branches:
    - master
jobs:
  prepare:
    #runs-on: [my_runner]
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Set up Python 3.10
        uses: actions/setup-python@v3
        with:
         python-version: "3.10"
      - name: Start script hello.py
        run: python3 hello.py
```

[GitHub Action Result](https://github.com/toyvoKalevala/git-actions/actions/runs/14157031895/job/39657620997)


## Homework Assignment 2: Building and Testing with GitHub Actions

Testing app:
```python
def sum(a, b):
    return a + b

def subtract(a, b):
    return a - b
```

Unit tests:
```python
import unittest
from basicCalc import sum, subtract

class TestMathOperations(unittest.TestCase):
    def test_sum(self):
        self.assertEqual(sum(2, 3), 5)
        self.assertEqual(sum(-1, 1), 0)

    def test_subtract(self):
        self.assertEqual(subtract(5, 3), 2)
        self.assertEqual(subtract(0, 11), -11)

if __name__ == '__main__':
    unittest.main()
```

GitHub Action workflow:
```yaml
name: Basic calc test
on:
  push:
    branches:
    - master
jobs:
  testing:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Install python
        uses: actions/setup-python@v5
        with:
          python-version: 'pypy3.10'

      - name: Run test
        run: python3 testBasicCalc.py
```


[GitHub Action Result](https://github.com/toyvoKalevala/git-actions/actions/runs/14157031896/job/39657621004)
