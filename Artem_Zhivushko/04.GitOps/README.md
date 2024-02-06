# Homework Assignment 1: Setting up a Basic GitHub Action

1. Create a new public repository on GitHub.
2. Inside the repository, create a simple Python or JavaScript script (e.g., "hello.py" or "hello.js") that prints "Hello, GitHub Actions!" to the console.
3. Create a new GitHub Action workflow (`.github/workflows/hello.yml`) that triggers on every push to the `main` branch.
4. Configure the workflow to run the script you created in step 2.
5. Push your changes to the repository and observe the GitHub Action run.

## .github/workflows/hello.yaml

```yaml
# This workflow will build a golang project
# For more information see: https://docs.github.com/en/actions/automating-builds-and-tests/building-and-testing-go

name: Go

on:
  push:
    branches:
    - main

jobs:

  prepare:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3

    - name: Set up Go
      uses: actions/setup-go@v4
      with:
        go-version: '1.21'
      # You can printing the current Go version
    - name: Display Go version
      run: go version

    - name: Run
      run: go run ./hello.go

```

## hello.go

```go
package main

import "fmt"

func main() {
	fmt.Println("Hello, GitHub Actions!")
}

```

## result push hello.go (Action log) 

![](./attachments/Pasted%20image%2020240130180308.png)

# Homework Assignment 2: Building and Testing with GitHub Actions

1. Choose a programming language of your choice.
2. Set up a new or use an existing repository.
3. Create a simple program that performs a basic operation (e.g., calculation, string manipulation).
4. Write unit tests for your program using a testing framework appropriate for the language.
5. Create a GitHub Action workflow that runs the unit tests whenever changes are pushed to the repository.
6. Ensure the workflow reports whether the tests passed or failed.

## .github/workflows/wtest.yaml

```yaml
# This workflow will build a golang project
# For more information see: https://docs.github.com/en/actions/automating-builds-and-tests/building-and-testing-go

name: Go

on:
  push:
    branches:
    - main

jobs:

  prepare:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        go-version: [ '1.21' ]


    steps:
    - uses: actions/checkout@v3

    - name: Set up Go
      uses: actions/setup-go@v4
      with:
        go-version: ${{ matrix.go-version }}

    # You can printing the current Go version
    - name: Display Go version
      run: go version

    # - name: Build
    #   run: go build -v ./cmd/...

    - name: Test
      run: go test -v ./cmd...

    - name: Test with Go
      run: go test -json ./cmd... > TestResults-${{ matrix.go-version }}.json
    - name: Upload Go test results
      uses: actions/upload-artifact@v4
      with:
        name: Go-results-${{ matrix.go-version }}
        path: TestResults-${{ matrix.go-version }}.json

```

## go basic server on Go

```go
package main

import (
	"bufio"
	"fmt"
	"io"
	"net"
	"os"
)

func main() {
	// obtain the port and prefix via program arguments
	port := fmt.Sprintf(":%s", os.Args[1])
	prefix := os.Args[2]

	// create a tcp listener on the given port
	listener, err := net.Listen("tcp", port)
	if err != nil {
		fmt.Println("failed to create listener, err:", err)
		os.Exit(1)
	}
	fmt.Printf("listening on %s, prefix: %s\n", listener.Addr(), prefix)

	// listen for new connections
	for {
		conn, err := listener.Accept()
		if err != nil {
			fmt.Println("failed to accept connection, err:", err)
			continue
		}

		// pass an accepted connection to a handler goroutine
		go handleConnection(conn, prefix)
	}
}

// handleConnection handles the lifetime of a connection
func handleConnection(conn net.Conn, prefix string) {
	defer conn.Close()
	reader := bufio.NewReader(conn)
	for {
		// read client request data
		bytes, err := reader.ReadBytes(byte('\n'))
		if err != nil {
			if err != io.EOF {
				fmt.Println("failed to read data, err:", err)
			}
			return
		}
		fmt.Printf("request: %s", bytes)

		// prepend prefix and send as response
		line := fmt.Sprintf("%s %s", prefix, bytes)
		fmt.Printf("response: %s", line)
		conn.Write([]byte(line))
	}
}

```

## test basic server on GO

```go
package main

import (
	"bufio"
	"net"
	"os"
	"strings"
	"testing"
	"time"
)

// TestTcpEchoServer tests the behavior of the TCP Echo Server.
func TestTcpEchoServer(t *testing.T) {
	// set up test parameters
	prefix := "hello"
	request := "world"
	want := prefix + " " + request

	// start the TCP Echo Server
	os.Args = []string{"main", "9000", prefix}
	go main()

	// wait for the TCP Echo Server to start
	time.Sleep(2 * time.Second)

	// connect to the TCP Echo Server
	conn, err := net.Dial("tcp", ":9000")
	if err != nil {
		t.Fatalf("couldn't connect to the server: %v", err)
	}
	defer conn.Close()

	// test the TCP Echo Server output
	if _, err := conn.Write([]byte(request + "\n")); err != nil {
		t.Fatalf("couldn't send request: %v", err)
	} else {
		reader := bufio.NewReader(conn)
		if response, err := reader.ReadBytes(byte('\n')); err != nil {
			t.Fatalf("couldn't read server response: %v", err)
		} else if !strings.HasPrefix(string(response), want) {
			t.Errorf("output doesn't match, wanted: %s, got: %s", want, response)
		}
	}
}

```

## result file ***`TestResults-1.21.json`***

```json
{"Time":"2024-01-30T22:29:06.939507373Z","Action":"start","Package":"my-workflows/cmd"}
{"Time":"2024-01-30T22:29:06.942407739Z","Action":"run","Package":"my-workflows/cmd","Test":"TestTcpEchoServer"}
{"Time":"2024-01-30T22:29:06.942433868Z","Action":"output","Package":"my-workflows/cmd","Test":"TestTcpEchoServer","Output":"=== RUN   TestTcpEchoServer\n"}
{"Time":"2024-01-30T22:29:06.94264896Z","Action":"output","Package":"my-workflows/cmd","Test":"TestTcpEchoServer","Output":"listening on [::]:9000, prefix: hello\n"}
{"Time":"2024-01-30T22:29:08.942902693Z","Action":"output","Package":"my-workflows/cmd","Test":"TestTcpEchoServer","Output":"request: world\n"}
{"Time":"2024-01-30T22:29:08.942959189Z","Action":"output","Package":"my-workflows/cmd","Test":"TestTcpEchoServer","Output":"response: hello world\n"}
{"Time":"2024-01-30T22:29:08.942985859Z","Action":"output","Package":"my-workflows/cmd","Test":"TestTcpEchoServer","Output":"--- PASS: TestTcpEchoServer (2.00s)\n"}
{"Time":"2024-01-30T22:29:08.942997821Z","Action":"pass","Package":"my-workflows/cmd","Test":"TestTcpEchoServer","Elapsed":2}
{"Time":"2024-01-30T22:29:08.943024631Z","Action":"output","Package":"my-workflows/cmd","Output":"PASS\n"}
{"Time":"2024-01-30T22:29:08.943491738Z","Action":"output","Package":"my-workflows/cmd","Output":"ok  \tmy-workflows/cmd\t2.004s\n"}
{"Time":"2024-01-30T22:29:08.943993025Z","Action":"pass","Package":"my-workflows/cmd","Elapsed":2.004}
```
![](./attachments/Pasted%20image%2020240131013855.png)
