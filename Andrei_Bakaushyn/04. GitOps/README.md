# 04. GitOps

## Homework Assignment 1: Setting up a Basic GitHub Action

[https://github.com/AndreiBakaushyn/Demo_repository]


```python

print('Hello, GitHub Actions!')

```

```yaml

name: Python application

on: [push]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2
    - name: Set up Python
      uses: actions/setup-python@v2
      with:
        python-version: '3.x' # Установите версию Python, которая вам нужна
    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        # Если у вас есть зависимости, добавьте их сюда
    - name: Run Python script
      run: |
        python hello.py
```




## Homework Assignment 2: Building and Testing with GitHub Actions



```Bash

echo $((1 + 1))
```

test

```Bash

result=$(./math.sh)
if [ "$result" -eq 2 ]; then
  exit 0
else
  exit 1
fi
```



```yaml

name: Run Tests

on: [push]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Test Script
      run: ./test.sh
```

