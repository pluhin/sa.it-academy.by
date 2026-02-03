
<https://github.com/poteenoka/ItAcademi_4lesson/actions>


# WorkFlow1: Setting up a Basic GitHub Action 

``` yaml

name: Run Hello Script

on:
  push:
    branches: [ master ]

jobs:
  run-hello:
    runs-on: ubuntu-latest
    
    steps:
    - name: Checkout code
      uses: actions/checkout@v4
      
    - name: Run Python script
      run: python hello.py
```

# WorkFlow2: Building and Testing with GitHub Actions

``` yaml
name: Tests Go 

on:
  push:
    branches: [master]

jobs:
  test:
    runs-on: ubuntu-latest
    
    steps:
    - name: Checkout code
      uses: actions/checkout@v3
    
    - name: Set up Go
      uses: actions/setup-go@v5
      with:
        go-version: '1.25.5'
    
    - name: Run tests
      run: go test -v
      
    - name: Run the program
      run: go run main.go

```

## Application

``` Go
package main

import "fmt"

// CalculateSum calculates sum of numbers in array
func CalculateSum(numbers []int) int {
    sum := 0
    for i := 0; i < len(numbers); i++ {
        sum += numbers[i]
    }
    return sum
}

func main() {
    // Example array
    numbers := []int{1, 2, 3, 4, 5}
    
    result := CalculateSum(numbers)
    fmt.Println("Numbers:", numbers)
    fmt.Println("Sum:", result)
}
```

``` go
package main

import "testing"

func TestCalculateSum(t *testing.T) {

	result1 := CalculateSum([]int{1, 2, 3, 4, 5})
	expected1 := 15
	if result1 != expected1 {
		t.Errorf("Test 1 failed: Sum was %d, expected %d", result1, expected1)
	}

	result2 := CalculateSum([]int{10, 20, 30})
	expected2 := 50
	if result2 != expected2 {
		t.Errorf("Test 2 failed: Sum of [10, 20, 30] was %d, expected %d", result2, expected2)
	}

	result3 := CalculateSum([]int{})
	expected3 := 1
	if result3 != expected3 {
		t.Errorf("Test 3 failed: Sum of empty array was %d, expected %d", result3, expected3)
	}

	result4 := CalculateSum([]int{-5, 5})
	expected4 := 10 // Должно быть 0!
	if result4 != expected4 {
		t.Errorf("Test 4 failed: Sum of [-5, 5] was %d, expected %d", result4, expected4)
	}

	t.Run("Always failing test", func(t *testing.T) {
		if 1 == 2 {
			t.Error("This should fail: 1 is not equal to 2")
		}
	})
}

```


### LOG

```
FailedTest4TestWorkflow
Tests Go #2: Commit 7a43a7c pushed by poteenoka
master	
8 minutes ago
 26s
FailedTest4TestWorkflow
Run Hello Script #7: Commit 7a43a7c pushed by poteenoka
master	
8 minutes ago
 9s
workflow4unitTestGoSimpleProgramm
Run Hello Script #6: Commit f59735c pushed by poteenoka
master	
28 minutes ago
 8s
workflow4unitTestGoSimpleProgramm
Tests Go #1: Commit f59735c pushed by poteenoka
master	
28 minutes ago
 24s
Simple Program with Unittest
Run Hello Script #5: Commit ef9f005 pushed by poteenoka
master	
37 minutes ago
 8s
historyCommand
Run Hello Script #4: Commit 1a368c9 pushed by poteenoka
master	
Feb 2, 12:09 AM GMT+3
 7s
fixBranch4Workflow3
Run Hello Script #3: Commit 3092261 pushed by poteenoka
master	
Feb 2, 12:04 AM GMT+3
 8s
test-adction3
Run Hello Script #2: Commit 9a62a9b pushed by poteenoka
master	
Feb 2, 12:00 AM GMT+3
 Failure
fixBranch4Workflow
Run Hello Script #1: Commit 4ccad1f pushed by poteenoka
master	
Feb 1, 11:58 PM GMT+3
 Failure
```


*History_Commands:

```
97  git init
   98  git remote add origin git@github.com:poteenoka/ItAcademi_4lesson.git
   99  git status
  100  git status
  101  git add .
  102  git status
  103  git commit "pyScript"
  104  git commit -m "pyScript"
  105  git status
  106  git remote -v
  107  git push origin
  108  git push origin master
  109  git pull
  110  git status
  111  git status
  112  git status
  113  git add,
  114  git add ,
  115  git add .
  116  git status
  117  git status
  118  git commit -m "Pipeline1"
  119  git push origin master
  120  echo test > testAction1.txt
  121  git add .
  122  git commit -m "test-adction"
  123  git push origin master
  124  git status
  125  ls -la .github/workflows/
  126  git status
  127  git add .
  128* git commit -m "FixWorkflow2"
  129*
  130  echo test > testAction2.txt
  131  git commit -m "test-adction2"
  132  git add .
  133  git commit -m "test-adction2"
  134  git push origin master
  135  git add .
  136  git status
  137  git commit -m "fixBranch4Workflow"
  138  git push origin master
  139  echo test > testAction3.txt
  140  git commit -m "test-adction3"
  141  git add .
  142  git commit -m "test-adction3"
  143  git push origin master
  144  git add .
  145  git commit -m "fixBranch4Workflow3"
  146  git push origin master
  147  history
  
   499  git -c fetch.parallel=0 -c submodule.fetchJobs=0 pull --progress "origin"
  500  git log -6
  501  git log -9
  502  cd ..
  503  cd ..
  504  cd Itacademy/
  505  ls
  506  cd ItAcademi_4lesson/
  507  git status
  508  git add .
  509  git commit -m  "Simple Program with Unittest"
  510  git push origin
  511  git add .
  512  git status
  513  git commit -m  "workflow4unitTestGoSimpleProgramm"
  514  git push origin
  515  git status
  516  git add .
  517  git commit -m  "FailedTest4TestWorkflow"
  518  git push origin
  
```