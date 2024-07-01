# GitOps

## 1.0 Setting up a Basic GitHub Action
1.new rep 
```bash
https://github.com/pascal-gitos/04GitOps
```

2.code in `hello.py`
 
```python
print("hello")
```


## 2.0 Building and Testing with GitHub Actions

### Create a simple program that performs a basic operation

`main file`
```go
package main

import (
	"fmt"
	"goCode/stringUtils"
)

func main() {
	str1 := "hello"
	str2 := "goUtils"
	concatenated := stringUtils.Concatenate(str1, str2)
	fmt.Println("Concatenate string:", concatenated)

	lowercase := "lower string"
	uppercase := stringUtils.ToUppercase(lowercase)
	fmt.Println("uppercase string:", uppercase)
}
```

`stringutils.go`
```go 
package stringUtils

import "strings"

func Concatenate(a, b string) string {
	return a + b
}

func ToUppercase(s string) string {
	return strings.ToUpper(s)
}
```
`stringutils_test.go`
```go
package stringUtils

import "testing"

func TestConcatenate(t *testing.T) {
	result := Concatenate("Hello, ", "test")
	expected := "Hello, test"
	if result != expected {
		t.Errorf("concatenate(\"hello, \", \"test\") = %q, want %q", result, expected)
	}
}

func TestToUpperCase(t *testing.T) {
	result := ToUppercase("hello")
	expected := "HELLO"
	if result != expected {
		t.Errorf("ToUppercase(\"hello\") = %q, want %q", result, expected)
	}
}
```

### GitHubActions

```yml
name: Go

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]

jobs:

  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4

    - name: Set up Go
      uses: actions/setup-go@v4
      with:
        go-version: '1.21.8'

    - name: Build
      run: cd goCode && go build main.go

    - name: Test
      run: cd goCode && go run main.go

```
```yml
name: Test Go

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]

jobs:

  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4

    - name: Set up Go
      uses: actions/setup-go@v4
      with:
        go-version: '1.21.8'

    - name: Build
      run: cd goCode && go test ./...

    - name: Test
      run: cd goCode && go test ./...

```     



### Continuous Deployment with GitHub Actions (Optional)

`work in progress`


### Customizing GitHub Actions Workflow (Optional)

`work in progress`
