### Github actions
- add hello.py
- add hello.yml
- add calculator.py
- add test_calculator.py

### Scripts
#### calculator.py
```python
def add(a, b):
    return a + b
```
#### test_calculator.py
```python
import pytest
from calculator import add

def test_add():
    assert add(2, 3) == 5
    assert add(-1, 1) == 0
    assert add(0, 0) == 0
```
###hello.py
```python
print("Hello world!")
```

### Yml files
#### Hello.yml
```yaml
name: Hello Action

on:
  push:
    branches: [ "main" ]

jobs:
  run-script:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Run Python script
        if: contains(github.event.commits[0].message, 'python')
        run: python hello.py
```
