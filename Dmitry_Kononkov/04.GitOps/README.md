# link to github repo with all assigments (1-4)
[GitHub-04.GitOps](https://github.com/ussnorma/GitOps)

## Branch purpose:
## scripts - branch which includes golang scripts and workflows wich usin scripts.
## production - branch which includes static website and workflow for deploying site to github pages.
## development - branch which include static website and workflow. This brunch is used for tests.
## hot-fix - branch is used for hot fix.

## Assigment 1-2:

### Hello script:

```go
package main

import "fmt"

func main() {
	fmt.Println("Hello, GitHub Actions!!")
}
```

### Workflow for hello script:

```yml
name: Hello to CLI

on:
  push:
    branches:
    - scripts

jobs:
  say_hello:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Install golang
        uses: actions/setup-go@v3
        with:
          go-version: '1.21.1'
      - run: go version
      - name: Run hello-actions script
        run: sudo go run hello_actions.go 
      - run: sudo go run hello_actions.go > hello_report.log
      - name: Upload report
        uses: actions/upload-artifact@v2
        with:
          path: ./hello_report.log
```

### Calculation script:

```go
package scripts

func Add(a, b int) (res int) {
	return a + b
}

func Subtract(a, b int) (res int) {
	return a - b
}

```

### Test script

```go
package tests

import (
	"scripts"
	"testing"
)

type calcTest struct {
	arg1, arg2, expected int
}

var addTests = []calcTest{
	calcTest{1, 1, 2},
	calcTest{2, 2, 4},
	calcTest{3, 3, 6},
}

var subTests = []calcTest{
	calcTest{2, 1, 1},
	calcTest{3, 1, 2},
	calcTest{4, 1, 3},
}

func TestCalc(t *testing.T) {

	for _, test := range addTests {
		if output := scripts.Add(test.arg1, test.arg2); output != test.expected {
			t.Errorf("Output %q not equal to expected %q", output, test.expected)
		}
	}

	for _, test := range subTests {
		if output := scripts.Subtract(test.arg1, test.arg2); output != test.expected {
			t.Errorf("Output %q not equal to expected %q", output, test.expected)
		}
	}
}
```

### workflow for testing script:

```yml
name: Testing Go scripts

on:
  push:
    branches:
    - scripts

jobs:
  testing:
    runs-on: ubuntu-22.04
    steps:
      - uses: actions/checkout@v4
      - name: Install golang
        uses: actions/setup-go@v4
        with:
          go-version: '1.21.x'
      - run: go version 
      - name: Init workspace 
        run: sudo go work init ./scripts ./tests
      - name: Run tests
        run: cd ./tests && sudo go test -v > tests_report.log
      - name: Upload report
        uses: actions/upload-artifact@v2
        with:
          path: ./tests/tests_report.log
```

## Assigment 3-4 (Optional):

### Workflow to build static site:

```yml
name: Build Jekyll site
on:
 push:
   branches: ["development"]
permissions:
  contents: read
  pages: write
  id-token: write
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Setup Pages
        uses: actions/configure-pages@v3
      - name: Build
        uses: actions/jekyll-build-pages@v1
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
  deploy:
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
  tests:
    runs-on: ubuntu-latest
    needs: [build, deploy]
    steps:
      - name: Checking healt of site
        uses: jtalk/url-health-check-action@v3
        with:
          url: https://kdimakon.github.io/static2/
          max-attempts: 3
          retry-delay: 5s
      - name: The job has failed
        if: ${{ failure() }}
        run: echo fails
  merge_to_production:
    runs-on: ubuntu-latest
    needs: [build, deploy, tests]
    if: contains(needs.tests.result, 'success' ) 
    steps:
      - uses: actions/checkout@master
      - name: Merge development into production
        uses: devmasx/merge-branch@master
        with:
          type: now
          from_branch: development
          target_branch: production
          github_token: ${{ secrets.MERGE_TOKEN }}
```

