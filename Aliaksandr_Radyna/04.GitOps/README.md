#Homework Assignment 1: Setting up a Basic GitHub Action
##1.Create a new public repository on GitHub.
```bash
https://github.com/Ratchet772/Homework_04.git
$ mkdir Private

$ git init
Initialized empty Git repository in D:/DevOps/Private/.git/

$ git remote

$ git remote -v

$ git remote add origin git@github.com:Ratchet772/Homework_04.git

$ git remote -v
origin  git@github.com:Ratchet772/Homework_04.git (fetch)
origin  git@github.com:Ratchet772/Homework_04.git (push)
```
##2.Inside the repository, create a simple Python or JavaScript script (e.g., "hello.py" or "hello.js") that prints "Hello, GitHub Actions!" to the console.
```bash
$ ls
Hello.py

$ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        Hello.py

nothing added to commit but untracked files present (use "git add" to track)

$ git add Hello.py

$ git commit -m "Hello.py script has been added"
[master (root-commit) 397b25c] Hello.py script has been added
 1 file changed, 1 insertion(+)
 create mode 100644 Hello.py

$ git branch -M main

$ git push -u origin main
Enumerating objects: 3, done.
Counting objects: 100% (3/3), done.
Writing objects: 100% (3/3), 263 bytes | 263.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To github.com:Ratchet772/Homework_04.git
 * [new branch]      main -> main
branch 'main' set up to track 'origin/main'.
```
##3.Create a new GitHub Action workflow (.github/workflows/hello.yml) that triggers on every push to the main branch.
##4.Configure the workflow to run the script you created in step 2.
```bash

$ mkdir -p .github/workflows

$ vim .github/workflows/hello.yml

$ cat .github/workflows/hello.yml
name: Play Hello.py on push
on:
  push:
    branches:
      - main
jobs:
  prepare:
    runs-on: ubuntu-latest
      steps:
      - name: Install python
        run: sudo apt update && sudo apt install -y python3
        run: echo "python has been installed"

      - name: PlayScript
        run: python Hello.py

$ git status
On branch main
Your branch is up to date with 'origin/main'.

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        .github/

nothing added to commit but untracked files present (use "git add" to track)

$ git add --all
warning: in the working copy of '.github/workflows/hello.yml', LF will be replaced by CRLF the next time Git touches it

$ git commit -m "Added workflow hello.yml"
[main 82594b3] Added workflow hello.yml
 1 file changed, 16 insertions(+)
 create mode 100644 .github/workflows/hello.yml

$ git push
Enumerating objects: 6, done.
Counting objects: 100% (6/6), done.
Delta compression using up to 6 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (5/5), 552 bytes | 552.00 KiB/s, done.
Total 5 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To github.com:Ratchet772/Homework_04.git
   397b25c..82594b3  main -> main

$ vim .github/workflows/hello.yml

$ git commit -m "Fixed workflow hello.yml"
On branch main
Your branch is up to date with 'origin/main'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   .github/workflows/hello.yml

no changes added to commit (use "git add" and/or "git commit -a")

$ git add --all
warning: in the working copy of '.github/workflows/hello.yml', LF will be replaced by CRLF the next time Git touches it

$ git commit -m "Fixed workflow hello.yml"
[main a20d689] Fixed workflow hello.yml
 1 file changed, 1 insertion(+), 1 deletion(-)

$ git push
Enumerating objects: 9, done.
Counting objects: 100% (9/9), done.
Delta compression using up to 6 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (5/5), 419 bytes | 419.00 KiB/s, done.
Total 5 (delta 1), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To github.com:Ratchet772/Homework_04.git
   82594b3..a20d689  main -> main

$ vim .github/workflows/hello.yml

$ git add --all
warning: in the working copy of '.github/workflows/hello.yml', LF will be replaced by CRLF the next time Git touches it

$ git commit -m "Fixed-2 workflow hello.yml"
[main 3b57552] Fixed-2 workflow hello.yml
 1 file changed, 1 insertion(+), 1 deletion(-)

$ git push
Enumerating objects: 9, done.
Counting objects: 100% (9/9), done.
Delta compression using up to 6 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (5/5), 422 bytes | 422.00 KiB/s, done.
Total 5 (delta 1), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To github.com:Ratchet772/Homework_04.git
   a20d689..3b57552  main -> main

$ vim .github/workflows/hello.yml

$ git add --all
warning: in the working copy of '.github/workflows/hello.yml', LF will be replaced by CRLF the next time Git touches it

$ git commit -m "Fixed-3 workflow hello.yml"
[main 30029b8] Fixed-3 workflow hello.yml
 1 file changed, 1 insertion(+)

```
##5.Push your changes to the repository and observe the GitHub Action run.
```bash
$ git push
Enumerating objects: 9, done.
Counting objects: 100% (9/9), done.
Delta compression using up to 6 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (5/5), 446 bytes | 446.00 KiB/s, done.
Total 5 (delta 1), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To github.com:Ratchet772/Homework_04.git
   3b57552..30029b8  main -> main
```
### Link to successful action report   
```bash
https://github.com/Ratchet772/Homework_04/actions/runs/11130259771
```

#Homework Assignment 2: Building and Testing with GitHub Actions
##1.Choose a programming language of your choice.
```bash
Python
```
##2.Set up a new or use an existing repository.
```bash
https://github.com/Ratchet772/Homework_04.git
```
##3.Create a simple program that performs a basic operation (e.g., calculation, string manipulation).
```bash
class Calc:

    def __init__(self):
        pass

    def divide(self, a, b):

        self.a = a
        self.b = b
        
        try:
            self.result = self.a / self.b

        except TypeError:
            raise TypeError

        except ZeroDivisionError:
            raise ZeroDivisionError

        return self.result

    def multiply(self, a, b):

        self.a = a
        self.b = b

        try:
            self.result = self.a * self.b
        except TypeError:
            raise TypeError

        return self.result

    def sum(self, a, b):
        
        self.a = a
        self.b = b

        try:
            self.result = self.a + self.b

        except TypeError:
            raise TypeError

        return self.result

    def subtract(self, a, b):

        self.a = a
        self.b = b

        try:
            self.result = self.a - self.b

        except TypeError:
            raise TypeError

        return self.result

```
##4.Write unit tests for your program using a testing framework appropriate for the language.
```bash
import unittest
from Calc import Calc

class UnitTest(unittest.TestCase):
  def setUp(self):
    self.calc = Calc()
  def test_divide(self):
    self.assertEqual(self.calc.divide(100,4), 25)
  def test_multiply(self):
    self.assertEqual(self.calc.multiply(100,4), 400)
  def test_sum(self):
    self.assertEqual(self.calc.sum(100,4), 104)
  def test_subtract(self):
    self.assertEqual(self.calc.subtract(100,4), 96)

if __name__ == "__main__":
  unittest.main()
```
##5.Create a GitHub Action workflow that runs the unit tests whenever changes are pushed to the repository.
```bash
$ cat .github/workflows/Calc_unittest.yaml
name: Calc Unittesting
on:
  push:
    branches:
      - main
jobs:
  unittesting:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Install python
        run: sudo apt update && sudo apt install -y python3
      - run: echo "python has been installed"

      - name: Unittesting Calc
        run: python ~/work/Homework_04/Homework_04/4.GitOps-02/Calc_Unittest.py
```
##6.Ensure the workflow reports whether the tests passed or failed.
```bash
Successful report
https://github.com/Ratchet772/Homework_04/actions/runs/11131400674/job/30932886217

Failed report
https://github.com/Ratchet772/Homework_04/actions/runs/11131461708/job/30933080783
```