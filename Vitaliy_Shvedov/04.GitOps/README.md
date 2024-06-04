## 04.GitOps

---

### Setting up a Basic GitHub Action

---

1. Create a new public repository on GitHub:

[Github repo for task 1](https://github.com/Patsa-Vatsa/HW_04.GitOps_Task-1)

```bash
mkdir /home/vshvedov/04.GitOps/
cd  /home/vshvedov/04.GitOps/
git init
git config --global user.name "Vitaliy Shvedov"
git config --global user.email "patsa_vatsa@tut.by"
git remote add origin git@github.com:Patsa-Vatsa/HW_04.GitOps_Task-1.git
mkdir .github
cd .github
mkdir workflows
```

2. Inside the repository, create a simple Python or JavaScript script (e.g., "hello.py" or "hello.js") that prints "Hello, GitHub Actions!" to the console:

```bash
nano /home/vshvedov/04.GitOps/hello.py
```

- Hello script:

```python
print("Hello, GitHub Actions!")
```

3. Create a new GitHub Action workflow (.github/workflows/hello.yml) that triggers on every push to the main branch:

```bash
nano /home/vshvedov/04.GitOps/.github/workflows/hello.yaml
```

- Hello yaml file:

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

4. Configure the workflow to run the script you created in step 2.

5. Push your changes to the repository and observe the GitHub Action run:

```bash
cd  /home/vshvedov/04.GitOps/
git add .
git commit -m "Setting up a Basic GitHub Action"
git push -u origin master
```


### Building and Testing with GitHub Actions

---
1. Choose a programming language of your choice: python.

2. Set up a new or use an existing repository:

[Github repo for task 2](https://github.com/Patsa-Vatsa/HW_04.GitOps_Task-2)

```bash
mkdir /home/vshvedov/04.GitOps-t2/
cd  /home/vshvedov/04.GitOps-t2/
git init
git config --global user.name "Vitaliy Shvedov"
git config --global user.email "patsa_vatsa@tut.by"
git remote add origin git@github.com:Patsa-Vatsa/HW_04.GitOps_Task-2.git
mkdir .github
cd .github
mkdir workflows
```

3. Create a simple program that performs a basic operation (e.g., calculation, string manipulation):

```bash
nano /home/vshvedov/04.GitOps-t2/Calculator.py
```

- Calculator:

```python
#Calculator
class Calculator:
  #empty constructor
  def __init__(self):
    pass
  #Accepts two numbers (x1 and x2), returns the sum of these numbers: x1+x2
  def add(self, x1, x2):
    return x1 + x2
  #Accepts two numbers (x1 and x2), returns the product of these numbers: x1⋅x2
  def multiply(self, x1, x2):
    return x1 * x2
  #Accepts two numbers (x1 and x2), returns the difference between the first and second numbers: x1−x2
  def subtract(self, x1, x2):
    return x1 - x2
  #Accepts two numbers (x1 and x2), returns the difference between the first and second numbers: x1−x2
  def divide(self, x1, x2):
    if x2 != 0:
      return x1/x2
  #Accepts two numbers (x1 and x2), Returns the result of dividing the first number by the second: x1/x12 (if x2 is not equal to 0)
```

4. Write unit tests for your program using a testing framework appropriate for the language:

```bash
nano /home/vshvedov/04.GitOps-t2/TestCalculator.py
```

- TestCalculator.py:

```python
import unittest
from Calculator import Calculator
# Test cases to test Calulator
class TestCalculator(unittest.TestCase):
  def setUp(self):
    self.calculator = Calculator()
  def test_add(self):
    self.assertEqual(self.calculator.add(4,7), 11)
# Verifies that the add method correctly computes the sum of 4 and 7, resulting in 11.
  def test_subtract(self):
    self.assertEqual(self.calculator.subtract(10,5), 5)
# Ensures that the subtract method correctly calculates the difference between 10 and 5, yielding 5.
  def test_multiply(self):
    self.assertEqual(self.calculator.multiply(3,7), 21)
# Validates that the multiply method produces the correct product of 3 and 7, which is 21.
  def test_divide(self):
    self.assertEqual(self.calculator.divide(10,2), 5)
# Confirms that the divide method correctly divides 10 by 2, resulting in 5 (assuming x2 is not equal to 0).
if __name__ == "__main__":
  unittest.main()
```
5. Create a GitHub Action workflow that runs the unit tests whenever changes are pushed to the repository.

```bash
nano /home/vshvedov/04.GitOps-t2/.github/workflows/test_calculator.yml
```

- Yaml file for testing:

```yaml
name: Test Calcuator

on:
  push:
    branches:
      - master

jobs:
  prepare:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout repository
      uses: actions/checkout@v2
    - name: Run test script
      run: python TestCalculator.py
```

- Run command:

```bash
cd  /home/vshvedov/04.GitOps-t2/
git add .
git commit -m "Building and Testing with GitHub Actions"
git push -u origin master
```

6. Ensure the workflow reports whether the tests passed or failed:

```
Run python TestCalculator.py
  python TestCalculator.py
  shell: /usr/bin/bash -e {0}
....
----------------------------------------------------------------------
Ran 4 tests in 0.000s

OK
```