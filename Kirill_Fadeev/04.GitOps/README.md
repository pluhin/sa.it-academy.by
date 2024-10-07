# 04. GitOps

## Homework Assignment 1: Setting up a Basic GitHub Action
1. Create a new public repository on GitHub.
New repository https://github.com/Pro100chok91/GitOps

```bash
 512  cd GitOps/
  513  touch README.md
  514  git init
  515  git status
  516  git ad
  517  git status
  518  git ci -m "Init"
  519  git log --oneline
  520  git remote add origin git@github.com:Pro100chok91/GitOps.git
  522  git remote
  523  git push -u origin master
```
2. Inside the repository, create a simple Python or JavaScript script (e.g., "hello.py" or "hello.js") that prints "Hello, GitHub Actions!" to the console.
```bash
nano hello.py
    print("Hello, Git Actions!")
```
3. Create a new GitHub Action workflow (.github/workflows/hello.yml) that triggers on every push to the main branch.

```bash
nano hello.yaml

name: Run script after push in master

on:
  push:
    branches:
    - master

jobs:
  print:
    runs-on: ubuntu-latest

    steps:
        - uses: actions/checkout@v4
        - name: Install python
          uses: actions/setup-python@v3
          with:
            python-version: "3.10"

        - name: Run script
          run: python hello.py
```
4. Configure the workflow to run the script you created in step 2
5. Push your changes to the repository and observe the GitHub Action run.

```bash
git push origin master
```
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/04.GitOps/img/1.jpg)

![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/04.GitOps/img/2.jpg)

# Homework Assignment 2: Building and Testing with GitHub Actions

1. Choose a programming language of your choice: python
2. Set up a new or use an existing repository: [existing](https://github.com/Pro100chok91/GitOps "GitOps")
3. Create a simple program that performs a basic operation (e.g., calculation, string manipulation).
Calculator.py
```bash
class Calculator:
    def __init__(self):
        pass
    #Add methods
    # This function adds two numbers
    def add(self, x, y):
     return x + y
    # This function subtracts two numbers
    def subtract(self, x, y):
     return x - y
    # This function multiplies two numbers
    def multiply(self, x, y):
     return x * y
    # This function divides two numbers
    def divide(self, x, y):
     return x / y
```
4. Write unit tests for your program using a testing framework appropriate for the language.
Test_calc.py
```bash
import unittest
from Calculator import Calculator

class TestCalculator(unittest.TestCase):
  #setUp method is overridden from the parent class TestCase
  def setUp(self):
    self.calculator = Calculator()
  #Each test method starts with the keyword test_
  def test_add(self):
    self.assertEqual(self.calculator.add(3,5), 8)
  def test_subtract(self):
    self.assertEqual(self.calculator.subtract(7,2), 5)
  def test_multiply(self):
    self.assertEqual(self.calculator.multiply(4,8), 32)
  def test_divide(self):
    self.assertEqual(self.calculator.divide(25,5), 5)
# Executing the tests in the above test case class
if __name__ == "__main__":
  unittest.main()
```
5. Create a GitHub Action workflow that runs the unit tests whenever changes are pushed to the repository.
Test_calc.yaml
```bash
name: Unit test for Calculator.py
on:
  push:
    branches:
    - master

jobs:
  unit:
    runs-on: ubuntu-latest

    steps:
        - name: Checkout repository
          uses: actions/checkout@v4
        - name: Install python
          uses: actions/setup-python@v3
          with:
            python-version: "3.10"

        - name: Run test
          run: python Test_calc.py
```
6. Ensure the workflow reports whether the tests passed or failed.
### Success test
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/04.GitOps/img/3.jpg)

### Failed test

![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/04.GitOps/img/4.jpg)

# Homework Assignment 3: Continuous Deployment with GitHub Actions (Optional)

1. Choose a static website or a simple web application project.  
  * Static website

2. Create a GitHub repository for your project.  
https://github.com/Pro100chok91/HTML

3. Set up a basic HTML/CSS or the appropriate project structure.
```bash
nano index.html

<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="styles.css">
</head>
<body>

<h1>This is page for GitOps Lab</h1>
<p>This is my first HTML page.</p>
<p>It contains a 
             <strong>main heading</strong> and <em> paragraph </em>.
        </p>
</body>
</html>

nano styles.css
body {
  background-color: powderblue;
}
h1 {
  color: blue;
}
p {
  color: red;
}
```
4. Create a GitHub Action workflow that automatically builds and deploys the project to GitHub Pages or another hosting service of your choice.
```bash
mkdir .github/workflows -p
cd .github/workflows/
nano static.yaml

name: Deploy static content to Pages

on:
    push:
    branches: ["master"]

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: false

jobs:
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Setup Pages
        uses: actions/configure-pages@v5
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          # Upload entire repository
          path: '.'
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```
  * В настройках репозитория, раздел Pages, были опробованы варианты источника "Deploy from a branch" и "GitHub Actions"  
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/04.GitOps/img/5.jpg)

5. Configure the workflow to trigger on every push to the main branch.
```bash
on:
    push:
    branches: ["master"]
```
6. Push changes to your repository and verify that the website or application is automatically deployed.

  * Success Action  
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/04.GitOps/img/6.jpg)  

  * Working website  
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/04.GitOps/img/7.jpg)  