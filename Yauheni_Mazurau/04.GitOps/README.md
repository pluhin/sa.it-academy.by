Homework 04.GitOps


** Create a new public repository on GitHub. **

# Created a new repository on github  [https://github.com/YMazurau/04.GitOps]

- mkdir -p 04.GitOps/repo
- cd 04.GitOps/repo/
- git init
- git config --global init.defaultBranch master
- git config user.name "Yauheni Mazurau"
- git config user.email "mazurov1804@gmail.com"
- nano README.md
- git add --all
- git commit -m "Init commit"
- git push -u origin --all


** Inside the repository, create a simple Python or JavaScript script (e.g., "hello.py" or "hello.js") that prints "Hello, GitHub Actions!" to the console. **

- nano hello.py

```python

print("Hello, GitHub Actions!")

```



** Create a new GitHub Action workflow (.github/workflows/hello.yml) that triggers on every push to the main branch. **

- mkdir -p .github/workflows/
- nano .github/workflows/hello.yaml

```yaml

name: Print hello every time you push the master branch

on:
  push:
    branches:
    - master

jobs:
  prepare:
    runs-on: ubuntu-latest
    steps:
      - name: Install Python
        uses: actions/setup-python@v2
        with:
          python-version: '3.9'
      - name: Chech
        uses: actions/checkout@v2
      - name: Run python file
        run: python hello.py
        
```        



** Configure the workflow to run the script you created in step 2. **

- git add --all
- git commit -m "Test python 7"
- git push
# Getaction will work automatically when the hello.yml file gets into the master branch of the repository




** Choose a programming language of your choice **
Python

** Create a simple program that performs a basic operation (e.g., calculation, string manipulation). **

# 04.GitOps/repo/
- nano prog.py

```python

def concatenate_strings(a, b, c):
    new_string = f'{a} {b}{c}'
    return new_string
    
```

- nano test_py.py

```python

import unittest
import prog

class TestProgram(unittest.TestCase):
    def test_new_string(self):
        a = "Hello"
        b = "World"
        c = "!"
        expected_result = "Hello World!"
        new_string = prog.concatenate_strings(a, b, c)
        self.assertEqual(new_string, expected_result)

if __name__ == '__main__':
    unittest.main()
    
```


# 04.GitOps/repo/.github/workflows
- nano test_prog.yml

```yaml

name: Run test python program

on:
  push:
    branches:
    - master

jobs:
  prepare:
    runs-on: ubuntu-latest
    steps:
    - name: Check
      uses: actions/checkout@v2
    - name: Run test
      run: python test_py.py
      
```


** Create a GitHub Action workflow that runs the unit tests whenever changes are pushed to the repository **

- git add -- all
- git commit -m "Python program test"
- git push












