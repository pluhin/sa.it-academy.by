# 1.Homework Assignment 1: Setting up a Basic GitHub Action
## 1. Create a new public repository on GitHub.

[Ссылка на мой репозиторий] (https://github.com/Kirilllka1993/04GitOps)

## 2. Inside the repository, create a simple Python or JavaScript script (e.g., "hello.py" or "hello.js") that prints "Hello, GitHub Actions!" to the console. 
```
print("Hello, GitHub Actions!")

```
## 3. Create a new GitHub Action workflow (.github/workflows/hello.yml) that triggers on every push to the main branch.

Саму историю создания файлов и пуша смотрите ниже в истории команд дополнительным пунктом

Код по workflow предоставлен ниже

hello.yaml

```
name: Trigger to the main branch on every push

on:
  push:
    branches:
      - main

jobs:
  print:
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
## 4.Configure the workflow to run the script you created in step 2.

## 5.Push your changes to the repository and observe the GitHub Action run:

```

    1  cd /home/kirill/courses/devops
    2  ls
    3  cd /home/kirill/courses/devops/sa.it-academy.by
    4  ls
    5  cd /home/kirill/courses/devops/sa.it-academy.by/Kirill_Kazimirov
    6  ls
    7  mkdir 04.GitOps
    8  cd /home/kirill/courses/devops/sa.it-academy.by/Kirill_Kazimirov/04.GitOps
    9  ls
   10  nano README.md
   11  cd /root
   12  ls
   13  mkdir 04. GitOps
   14  ls
   15  rmdir 04.
   16  rmdir GitOps
   17  mkdir 04.GitOps
   18  ls
   19  cd 04.GitOps
   20  git clone git@github.com:Kirilllka1993/04GitOps.git
   21  ls -a
   22  cd /home/kirill/courses/devops/sa.it-academy.by/
   23  ls -a
   24  cd /root/04.GitOps
   25  git init
   26  nano hello.py
   27  mkdir .github
   28  ls
   29  ls -a
   30  mkdir /.github/workflows
   31  cd .github
   32  mkdir workflows
   33  cd workflows
   34  nano hello.yml
   35  cd /04.GitOps/
   36  cd /04.GitOps
   37  cd 04.GitOps
   38  cd /root/04.GitOps
   39  ls -a
   40  git add --all
   41  git branch
   42  git branch -a
   43  git checkout main
   44  git remote add origin git@github.com:Kirilllka1993/04GitOps.git
   45  git remote
   46  git branch
   47  git branch main
   48  git add .
   49  git commit -m "first commit"
   50  git add .
   51  cd /root
   52  ls -a
   53  cd /root/04.GitOps
   54  ls -a
   55  ls /.git
   56  ls .git
   57  git add
   58  git add .
   59  git branch -M main
   60  git add .
   61  git branch
   62  git branch -a
   63  ls -a
   64  cd  04GitOps
   65  ls -a
   66  cd /root/04.GitOps
   67  rm -r 04GitOps
   68  ls -a
   69  git add .
   70  git commit -m "first commit"
   71  git branch -M main
   72  git remote add origin git@github.com:Kirilllka1993/04GitOps.git
   73  git push -u origin main
   74  ls
   75  nano hello.py
   76  cd /home/kirill/courses/devops
   77  ls
   78  cd /home/kirill/courses/devops/sa.it-academy.by
   79  ls
   80  cd /home/kirill/courses/devops/sa.it-academy.by/Kirill_Kazimirov
   81  ls
   82  cd /home/kirill/courses/devops/sa.it-academy.by/Kirill_Kazimirov/04.GitOps
   83  ls
   84  nano /root/04.GitOps/.github/workflows/hello.yaml
   85  nano README.md
   86  history
```
# 2. Homework Assignment 2: Building and Testing with GitHub Actions

Запуск тестов производился с помощью инструмента сборки maven. 

## 1. Choose a programming language of your choice.
 Java

## 2. Set up a new or use an existing repository. 

Second Repository [https://github.com/Kirilllka1993/04GitOpsJava]

## 3. Create a simple program that performs a basic operation (e.g., calculation, string manipulation).

```
package org.example;

public class BasicCalculator {

    public Double calculate(char op, double num1, double num2) {
        System.out.println("Hello Git 1");
        Double o = 0.0;
        switch (op) {
            // case to add two numbers
            case '+':
                o = num1 + num2;
                break;

            // case to subtract two numbers
            case '-':
                o = num1 - num2;
                break;

            // case to multiply two numbers
            case '*':
                o = num1 * num2;
                break;

            // case to divide two numbers
            case '/':
                o = num1 / num2;
                break;

            default:
                System.out.println("You enter wrong input");
        }
        return o;
    }
}
  
```
## 4. Write unit tests for your program using a testing framework appropriate for the language.

Tests

```
import org.example.BasicCalculator;
import org.junit.Assert;
import org.junit.Test;

import static junit.framework.Assert.assertEquals;

public class BasicCalculatorTest {

    @Test
    public void checkPlus() {
        BasicCalculator basicCalculator = new BasicCalculator();
        Double result = basicCalculator.calculate('+', 5.0, 6.0);
        assertEquals(result, 11.0);
    }
}

```

## 5. Create a GitHub Action workflow that runs the unit tests whenever changes are pushed to the repository.

```
name: Run tests with maven on main branch on every push

on:
  push:
    branches:
      - main

jobs:
  print:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout action 2
        uses: actions/checkout@v2
      - name: Set JDK 11
        uses: actions/setup-java@v2
        with:
          java-version: '11'
          distribution: 'temurin'
      - name: Run the Maven verify phase
        run: mvn test
      - name: Upload report
        uses: actions/upload-artifact@v2
        with:
          path: nc_report.log

```
## 6. Ensure the workflow reports whether the tests passed or failed. 

Ссылка на результат отработки тестов: [https://github.com/Kirilllka1993/04GitOpsJava/actions/runs/9374851317/job/25811828448]

Пример результат работы кода по запуску тестов:

```
 T E S T S
-------------------------------------------------------
Running BasicCalculatorTest
Hello Git 1
Tests run: 1, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.034 sec

Results :

Tests run: 1, Failures: 0, Errors: 0, Skipped: 0

INFO ------------------------------------------------------------------------
INFO BUILD SUCCESS
INFO ------------------------------------------------------------------------
INFO Total time:  3.909 s
INFO Finished at: 2024-06-04T22:07:02Z
INFO ------------------------------------------------------------------------

```
