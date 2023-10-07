# 04. GitOps

## Homework Assignment 1: Setting up a Basic GitHub Action

[https://github.com/Mazurovsasha/04.GitActions]

nano hello.py

```python

print('Hello, GitHub Actions!')

```

mkdir .github
cd .github
mkdir workflows
cd workflows
nano hello.yml

```yaml

name: Running a python script hello.py

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
    - name: Run script
      run: python hello.py
```

git ac git ac "Edit hello.yml, add new steps, Changed the file path"
git push -u origin master


## Homework Assignment 2: Building and Testing with GitHub Actions

git branch test

git switch test

nano string_1.py

```python

def concatenate_strings(a, b, c):
    new_string = f'{a} {b}{c}'
    return new_string

```

nano test_string_1.py

```python

import unittest
import string_1

class TestProgram(unittest.TestCase):
    def test_new_string(self):
        a = "Hello"
        b = "World"
        c = "!"
        expected_result = "Hello World!"
        new_string = string_1.concatenate_strings(a, b, c)
        self.assertEqual(new_string, expected_result)

if __name__ == '__main__':
    unittest.main()

```

cd /home/sasha/04.GitOps/repo/.github/workflows/

nano test.yml

```yaml

name: Running a test by commite in the test branch

on:
  push:
    branches:
    - test

jobs:
  prepare:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout repository
      uses: actions/checkout@v2
    - name: Run script
      run: python test_string_1.py

```

git ac "Add action test"

git push -u origin test