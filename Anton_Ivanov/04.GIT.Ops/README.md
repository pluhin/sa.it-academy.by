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
name: Tesing Calculator  using JUnit
on:
  push:
    branches: [main]
jobs:
  linux:
    name: Linux
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: 'Set up JDK 11'
        uses: actions/setup-java@v3
        with:
          java-version: 11
          distribution: temurin
      - name: Build with Maven
        run: mvn package
      - name: Run CalculatorTest.java
        run: mvn test --batch-mode --file pom-SNAPSHOT.xml
```
[Second part with Operations link GITHUB](https://github.com/AntonIvanovDevOps/LastCalculator)

