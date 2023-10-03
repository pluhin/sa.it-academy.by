# HW 4 Anton Ivanov
## Hello.yaml
```yaml
name: Hello Workflow
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
    - name: Check out code
      uses: actions/checkout@v2     
    - name: Run Python script
      run: python hello.py
```
[First part with Operations link GITHUB](https://github.com/AntonIvanovDevOps/Operations)

## CalculatorTesting.yaml
```yaml
name: Testing Calculator
on:
  push:
    branches: [main]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v2
      - name: Set up Java
        uses: actions/setup-java@v1
        with:
          java-version: '18' 
      - name: Compile calculator.java
        run: javac Calculator.java 
      - name: Run CalculatorTest.java
        run: javac CalculatorTest.java 
        #run: java -jar junit-platform-console-standalone-1.6.2.jar
```
[Second part with Operations link GITHUB](https://github.com/AntonIvanovDevOps/Calculator2.0)
Need check last run.

