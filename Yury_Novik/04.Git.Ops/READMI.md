

# Setting up a Basic GitHub Action

[https://github.com/yurymn/04_Git_Action]

```
cat .git/config 
[core]
	repositoryformatversion = 0
	filemode = true
	bare = false
	logallrefupdates = true
[remote "origin"]
	url = git@github.com:yurymn/04_Git_Action.git
	fetch = +refs/heads/*:refs/remotes/origin/*
[branch "main"]
	remote = origin
	merge = refs/heads/main
```

```
cat hello.py 
# This is a test Python script
print("Hello, GitHub Actions!")
```

```
cat .github/workflows/hello.yml 

name: Test Git Action2

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
      run: python hello.py
```

# Building and Testing with GitHub Actions

[https://github.com/yurymn/04_Git_Action_2]

```
cat .git/config
[core]
	repositoryformatversion = 0
	filemode = true
	bare = false
	logallrefupdates = true
[remote "origin"]
	url = git@github.com:yurymn/04_Git_Action_2.git
	fetch = +refs/heads/*:refs/remotes/origin/*
[branch "main"]
	remote = origin
	merge = refs/heads/main
```

```
cat test_my_mod.py
def my_function(x,y):

    return x + y


def test_my_function():

    assert my_function(2,3) == 5
```

```
cat .github/workflows/test.yml
name: Test Git Action2

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
      run: python test_my_mod.py
```

```
cat calc.py 

def add(a, b):
    return a + b
    
def sub(a, b):
    return a-b
 
def mul(a, b):
    return a * b
 
def div(a, b):
    return a / b
```

```
cat unitest_calc.py 

import unittest
import calc
 
class CalcTest(unittest.TestCase):
    def test_add(self):
        self.assertEqual(calc.add(1, 2), 3)
        
    def test_sub(self):
        self.assertEqual(calc.sub(4, 2), 2)
        
    def test_mul(self):
        self.assertEqual(calc.mul(2, 5), 10)
        
    def test_div(self):
        self.assertEqual(calc.div(8, 4), 2)
if __name__ == '__main__':
    unittest.main()
```

```
cat ~/04B.Git/.github/workflows/calc.yml 
name: Test Git Action2

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
      run: python unitest_calc.py
```
