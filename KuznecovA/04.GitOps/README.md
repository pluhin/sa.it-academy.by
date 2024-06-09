# Home task 04. GitOps
Training working with scripts for GitHab.
-----------------------------------------------------------------------------
## Homework Assignment 1: Setting up a Basic GitHub Action
New repository: 
[AlexKWGit.GitHub.io](https://github.com/AlexKWGit/AlexKWGit.GitHub.io)

[hello.py](https://github.com/AlexKWGit/AlexKWGit.GitHub.io/blob/main/hello.py)
```Python
print("Hello, GitHub Actions!")
```

[hello.yml](https://github.com/AlexKWGit/AlexKWGit.GitHub.io/blob/main/.github/workflows/hello.yml)
```YAML
name: Hello-action
on: 
  push:
    branches: 
      - main

jobs:
  my_hello:
    runs-on: [ubuntu-latest]
    
    steps:
      - name: Copying Git repository in container
        uses: actions/checkout@v2

      - name: Set up Python
        uses: actions/setup-python@v2
        with:
          python-version: 3.x

      - name: Install requests module
        run: pip install requests

      - name: Run hello.py
        run: |
          echo "Run: Hello.py"
          python hello.py

      - name: Test execution completed
        run: echo "Test execution completed." 
```
Result Action:

```YAML
Run echo "Run: Hello.py"
Run: Hello.py
Hello, GitHub Actions!
```
-----------------------------------------------------------------------------
## Homework Assignment 2: Building and Testing with GitHub Actions

[name_city.py](https://github.com/AlexKWGit/AlexKWGit.GitHub.io/blob/main/name_city.py)
```Python
class name_city:

  def __init__(self):
    pass

  # name_user = input('Enter your name: ')
  # city_user = input('Enter your city: ')

  def add(self, name_user , city_user ):
    result = 'Your name is ' + name_user + '. Your city is ' + city_user
    return result

  # print(result)
```

[test_name_city_program.py](https://github.com/AlexKWGit/AlexKWGit.GitHub.io/blob/main/test_name_city_program.py)

```Python
class name_city:

  def __init__(self):
    pass

  # name_user = input('Enter your name: ')
  # city_user = input('Enter your city: ')

  def add(self, name_user , city_user ):
    result = 'Your name is ' + name_user + '. Your city is ' + city_user
    return result

  # print(result)
```

Result Action:

```bash
Run autotest test_name_city_program.py
  Run echo "Run: test_name_city_program.py"
  Run: test_name_city_program.py
  ..
  ----------------------------------------------------------------------
  Ran 2 tests in 0.000s

  OK
```

-----------------------------------------------------------------------------
## Homework Assignment 3 - 4
Website created

[test_name_city_program.py](https://github.com/AlexKWGit/AlexKWGit.GitHub.io/blob/main/test_name_city_program.py)

(According to the instructions in the link)

Some of points 3 and 4 have been completed.
I'll try to come back and finish it in the future.
And then display the finished result.
