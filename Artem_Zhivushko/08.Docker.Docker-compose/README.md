# 08. Docker. Docker compose

---

## Homework Assignment 1: Docker Compose for Application Stacks

### Select a combination of services (e.g., web app, database) to create a multi-container application.

```bash
╭─a.zhivushko at DESKTOP-NGTG70N in /mnt/c/src/my-study/Artem_Zhivushko/08.Docker.Docker-compose (ZhivArt-work ✚1…2)
╰─λ docker-compose --version
Docker Compose version v2.24.5-desktop.1
```

### Create a Docker Compose YAML file to define the services, networks, and volumes.

```yaml
version: "3"
services:

  db:
    image: postgres:16.1-alpine

    environment:
      POSTGRES_DB: ${DB_NAME}
      POSTGRES_PASSWORD: ${DB_PASSWORD}
      POSTGRES_USER: ${DB_USER}
    env_file: .env
    logging:
      driver: "none"
    restart: unless-stopped
    volumes:
      - db-data:/var/lib/postgresql/data

  wiki:
    image: requarks/wiki:latest
    depends_on:
      - db
    environment:
      DB_TYPE: ${DB_TYPE}
      DB_HOST: db
      DB_PORT: ${DB_PORT}
      DB_USER: ${DB_USER}
      DB_PASS: ${DB_PASSWORD}
      DB_NAME: ${DB_NAME}
    env_file: .env
    restart: unless-stopped
    ports:
      - "80:3000"

volumes:
  db-data:
```

### Configure environment variables and dependencies between services.

```
DB_TYPE=postgres
DB_PORT=5432
DB_NAME=wikijs
DB_USER=wiki-admin
DB_PASSWORD=Mega@dmin
```

### Run the application stack using the `docker-compose up` command.

```bash
╭─a.zhivushko at DESKTOP-NGTG70N in /mnt/c/src/my-study/Artem_Zhivushko/08.Docker.Docker-compose (ZhivArt-work ✚1…2)
╰─λ docker-compose up                                                                                                                                                                      0 (0.371s)
[+] Running 24/24
 ✔ wiki 13 layers [⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]      0B/0B      Pulled                                                                                                                                  36.9s
   ✔ 661ff4d9561e Pull complete                                                                                                                                                                 4.9s
   ✔ 0f158788f409 Pull complete                                                                                                                                                                10.3s
   ✔ f028dff98271 Pull complete                                                                                                                                                                 6.2s
   ✔ 18f25c33705d Pull complete                                                                                                                                                                 7.1s
   ✔ d9099eb02433 Pull complete                                                                                                                                                                10.4s
   ✔ 4f4fb700ef54 Pull complete                                                                                                                                                                11.1s
   ✔ d5d973a5a48d Pull complete                                                                                                                                                                12.7s
   ✔ bfe9cd4a73ce Pull complete                                                                                                                                                                16.7s
   ✔ b25d7b913d08 Pull complete                                                                                                                                                                12.2s
   ✔ 09d780c18fcb Pull complete                                                                                                                                                                12.9s
   ✔ b1ae5f098e80 Pull complete                                                                                                                                                                13.6s
   ✔ 4858a24b7b39 Pull complete                                                                                                                                                                13.7s
   ✔ 30f9e6b04988 Pull complete                                                                                                                                                                14.5s
 ✔ db 9 layers [⣿⣿⣿⣿⣿⣿⣿⣿⣿]      0B/0B      Pulled                                                                                                                                           16.3s
   ✔ 4abcf2066143 Pull complete                                                                                                                                                                 1.3s
   ✔ 064ad39e66f1 Pull complete                                                                                                                                                                 1.0s
   ✔ 969d8f83b78a Pull complete                                                                                                                                                                 1.1s
   ✔ f4f4346dbb5e Pull complete                                                                                                                                                                10.3s
   ✔ d0f74a286f0f Pull complete                                                                                                                                                                 1.8s
   ✔ a920b3af04e1 Pull complete                                                                                                                                                                 2.1s
   ✔ 5975d00404a2 Pull complete                                                                                                                                                                 3.2s
   ✔ c0c41f96aa70 Pull complete                                                                                                                                                                 3.5s
   ✔ 71444cd8dc14 Pull complete                                                                                                                                                                 4.0s
[+] Running 4/4
 ✔ Network 08dockerdocker-compose_default   Created                                                                                                                                             0.1s
 ✔ Volume "08dockerdocker-compose_db-data"  Created                                                                                                                                             0.0s
 ✔ Container 08dockerdocker-compose-db-1    Created                                                                                                                                             0.8s
 ✔ Container 08dockerdocker-compose-wiki-1  Created                                                                                                                                             0.1s
Attaching to db-1, wiki-1
db-1    | The files belonging to this database system will be owned by user "postgres".
db-1    | This user must also own the server process.
db-1    |
db-1    | The database cluster will be initialized with locale "en_US.utf8".
db-1    | The default database encoding has accordingly been set to "UTF8".
db-1    | The default text search configuration will be set to "english".
db-1    |
db-1    | Data page checksums are disabled.
db-1    |
db-1    | fixing permissions on existing directory /var/lib/postgresql/data ... ok
db-1    | creating subdirectories ... ok
db-1    | selecting dynamic shared memory implementation ... posix
db-1    | selecting default max_connections ... 100
db-1    | selecting default shared_buffers ... 128MB
db-1    | selecting default time zone ... UTC
db-1    | creating configuration files ... ok
db-1    | running bootstrap script ... ok
db-1    | sh: locale: not found
db-1    | 2024-02-11 20:53:10.398 UTC [30] WARNING:  no usable system locales were found
db-1    | performing post-bootstrap initialization ... ok
wiki-1  | Loading configuration from /wiki/config.yml... OK
wiki-1  | 2024-02-11T20:53:10.811Z [MASTER] info: =======================================
wiki-1  | 2024-02-11T20:53:10.812Z [MASTER] info: = Wiki.js 2.5.301 =====================
wiki-1  | 2024-02-11T20:53:10.813Z [MASTER] info: =======================================
wiki-1  | 2024-02-11T20:53:10.813Z [MASTER] info: Initializing...
db-1    | syncing data to disk ... ok
db-1    |
db-1    |
db-1    | Success. You can now start the database server using:
db-1    |
db-1    |     pg_ctl -D /var/lib/postgresql/data -l logfile start
db-1    |
db-1    | initdb: warning: enabling "trust" authentication for local connections
db-1    | initdb: hint: You can change this by editing pg_hba.conf or using the option -A, or --auth-local and --auth-host, the next time you run initdb.
db-1    | waiting for server to start....2024-02-11 20:53:11.090 UTC [36] LOG:  starting PostgreSQL 16.1 on x86_64-pc-linux-musl, compiled by gcc (Alpine 13.2.1_git20231014) 13.2.1 20231014, 64-bit
db-1    | 2024-02-11 20:53:11.097 UTC [36] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
db-1    | 2024-02-11 20:53:11.111 UTC [39] LOG:  database system was shut down at 2024-02-11 20:53:10 UTC
db-1    | 2024-02-11 20:53:11.121 UTC [36] LOG:  database system is ready to accept connections
db-1    |  done
db-1    | server started
db-1    | CREATE DATABASE
db-1    |
db-1    |
db-1    | /usr/local/bin/docker-entrypoint.sh: ignoring /docker-entrypoint-initdb.d/*
db-1    |
db-1    | waiting for server to shut down....2024-02-11 20:53:11.242 UTC [36] LOG:  received fast shutdown request
db-1    | 2024-02-11 20:53:11.249 UTC [36] LOG:  aborting any active transactions
db-1    | 2024-02-11 20:53:11.251 UTC [36] LOG:  background worker "logical replication launcher" (PID 42) exited with exit code 1
db-1    | 2024-02-11 20:53:11.251 UTC [37] LOG:  shutting down
db-1    | 2024-02-11 20:53:11.256 UTC [37] LOG:  checkpoint starting: shutdown immediate
wiki-1  | 2024-02-11T20:53:11.294Z [MASTER] info: Using database driver pg for postgres [ OK ]
wiki-1  | 2024-02-11T20:53:11.305Z [MASTER] info: Connecting to database...
wiki-1  | 2024-02-11T20:53:11.322Z [MASTER] error: Database Connection Error: ECONNREFUSED 172.18.0.2:5432
wiki-1  | 2024-02-11T20:53:11.322Z [MASTER] warn: Will retry in 3 seconds... [Attempt 1 of 10]
db-1    | 2024-02-11 20:53:11.381 UTC [37] LOG:  checkpoint complete: wrote 925 buffers (5.6%); 0 WAL file(s) added, 0 removed, 0 recycled; write=0.038 s, sync=0.061 s, total=0.130 s; sync files=301, longest=0.007 s, average=0.001 s; distance=4269 kB, estimate=4269 kB; lsn=0/191BA30, redo lsn=0/191BA30
db-1    | 2024-02-11 20:53:11.385 UTC [36] LOG:  database system is shut down
db-1    |  done
db-1    | server stopped
db-1    |
db-1    | PostgreSQL init process complete; ready for start up.
db-1    |
db-1    | 2024-02-11 20:53:11.469 UTC [1] LOG:  starting PostgreSQL 16.1 on x86_64-pc-linux-musl, compiled by gcc (Alpine 13.2.1_git20231014) 13.2.1 20231014, 64-bit
db-1    | 2024-02-11 20:53:11.469 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
db-1    | 2024-02-11 20:53:11.469 UTC [1] LOG:  listening on IPv6 address "::", port 5432
db-1    | 2024-02-11 20:53:11.479 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
db-1    | 2024-02-11 20:53:11.490 UTC [52] LOG:  database system was shut down at 2024-02-11 20:53:11 UTC
db-1    | 2024-02-11 20:53:11.498 UTC [1] LOG:  database system is ready to accept connections
wiki-1  | 2024-02-11T20:53:14.324Z [MASTER] info: Connecting to database...
wiki-1  | 2024-02-11T20:53:14.367Z [MASTER] info: Database Connection Successful [ OK ]
wiki-1  | 2024-02-11T20:53:14.994Z [MASTER] warn: DB Configuration is empty or incomplete. Switching to Setup mode...
wiki-1  | 2024-02-11T20:53:14.995Z [MASTER] info: Starting setup wizard...
wiki-1  | 2024-02-11T20:53:15.202Z [MASTER] info: Starting HTTP server on port 3000...
wiki-1  | 2024-02-11T20:53:15.202Z [MASTER] info: HTTP Server on port: [ 3000 ]
wiki-1  | 2024-02-11T20:53:15.208Z [MASTER] info: HTTP Server: [ RUNNING ]
wiki-1  | 2024-02-11T20:53:15.209Z [MASTER] info: 🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻
wiki-1  | 2024-02-11T20:53:15.209Z [MASTER] info:
wiki-1  | 2024-02-11T20:53:15.209Z [MASTER] info: Browse to http://YOUR-SERVER-IP:3000/ to complete setup!
wiki-1  | 2024-02-11T20:53:15.210Z [MASTER] info:
wiki-1  | 2024-02-11T20:53:15.210Z [MASTER] info: 🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺
```

### Access the application through a web browser or API client.

```shell
!❯ curl http://127.0.0.1/


StatusCode        : 200
StatusDescription : OK
Content           : <!DOCTYPE html><html><head><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta charset="UTF-8"><meta name="viewport" content="user-scalable=yes, width=device-width, initial-scale=1, maximum-sca...
RawContent        : HTTP/1.1 200 OK
                    Vary: Accept-Encoding
                    Connection: keep-alive
                    Keep-Alive: timeout=5
                    Content-Length: 1315
                    Content-Type: text/html; charset=utf-8
                    Date: Sun, 11 Feb 2024 21:00:21 GMT
                    ETag: W/"523-a...
Forms             : {}
Headers           : {[Vary, Accept-Encoding], [Connection, keep-alive], [Keep-Alive, timeout=5], [Content-Length, 1315]...}
Images            : {}
InputFields       : {}
Links             : {}
ParsedHtml        : System.__ComObject
RawContentLength  : 1315
```

![[Pasted image 20240211235915.png]]

---

## Homework Assignment 2: Docker build automation (github action)

### Choose a programming language (e.g., Java, Go, Python) and a sample application.

```bash
touch main.go
```

```go
package main

import (
	"net/http"
	"os"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

func main() {

	e := echo.New()

	e.Use(middleware.Logger())
	e.Use(middleware.Recover())

	e.GET("/", func(c echo.Context) error {
		return c.HTML(http.StatusOK, "Hello, Docker! <3")
	})

	e.GET("/health", func(c echo.Context) error {
		return c.JSON(http.StatusOK, struct{ Status string }{Status: "OK"})
	})

	httpPort := os.Getenv("PORT")
	if httpPort == "" {
		httpPort = "8080"
	}

	e.Logger.Fatal(e.Start(":" + httpPort))
}

func IntMin(a, b int) int {
	if a < b {
		return a
	}
	return b
}
```

```bash
touch main-test.go
```

```go
package main

import (
	"fmt"
	"testing"
)

func TestIntMinBasic(t *testing.T) {
	ans := IntMin(2, -2)
	if ans != -2 {
		t.Errorf("IntMin(2, -2) = %d; want -2", ans)
	}
}

func TestIntMinTableDriven(t *testing.T) {
	var tests = []struct {
		a, b int
		want int
	}{
		{0, 1, 0},
		{1, 0, 0},
		{2, -2, -2},
		{0, -1, -1},
		{-1, 0, -1},
	}
	for _, tt := range tests {
		testname := fmt.Sprintf("%d,%d", tt.a, tt.b)
		t.Run(testname, func(t *testing.T) {
			ans := IntMin(tt.a, tt.b)
			if ans != tt.want {
				t.Errorf("got %d, want %d", ans, tt.want)
			}
		})
	}
}
```

### Write a multi-stage Dockerfile to build the application with different stages for build and runtime.

```yaml
# syntax=docker/dockerfile:1

##
## Build the application from source
##

FROM golang:latest AS build-stage

# Set destination for COPY
WORKDIR /app

# Download Go modules
COPY go.mod go.sum ./
RUN go mod download

COPY *.go ./

# Build
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-gs-ping

##
## Run the tests in the container
##

FROM build-stage AS run-test-stage
RUN go test -v ./...

##
## Deploy the application binary into a lean image
##

FROM gcr.io/distroless/base-debian11 AS build-release-stage

WORKDIR /

COPY --from=build-stage /docker-gs-ping /docker-gs-ping

EXPOSE 8080

USER nonroot:nonroot

ENTRYPOINT ["/docker-gs-ping"]
```

### Compile or package the application in the build stage.

### Copy the compiled application into the runtime stage and configure it to run.

### Build the multi-stage Docker image and run a container based on it.

### Push/publish image to docker hub and/or github container register.

### Slack notification when build failed/success with image name/tag.

```yaml
name: Release to ghcr.io if tests OK (CI/CD)

on:
  push:
    branches:
      - 'main'
    tags:
      - 'v*'
  pull_request:
    branches:
      - 'main'

env:
  REGISTRY: ghcr.io
  IMAGE_NAME: ${{ github.repository }}

jobs:
  build-and-test:
    runs-on: ubuntu-latest

    permissions:
        contents: read
        packages: write

    steps:
      - name: Checkout code
        uses: actions/checkout@v4
        with:
          persist-credentials: false

      - name: Docker meta
        id: meta
        uses: docker/metadata-action@v4
        with:
          images: |
            ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}
          tags: |
            type=ref,event=branch
            type=ref,event=pr
            type=semver,pattern={{version}}
            type=semver,pattern={{major}}.{{minor}}
            type=semver,pattern={{major}}

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v2

      - name: Cache Docker layers
        uses: actions/cache@v3
        with: 
          path: /tmp/.buildx-cache
          key:  ${{ runner.os }}-buildx-${{ github.sha }}
          restore-keys: |
            ${{ runner.os }}-buildx-

      - name: Build app and run tests in Docker
        uses: docker/build-push-action@v2
        with:
          file: Dockerfile.multistage
          target: run-test-stage
          cache-from: type=local,src=/tmp/.buildx-cache
          cache-to:   type=local,dest=/tmp/.buildx-cache

      - name: Login to ghcr.io
        uses: docker/login-action@v2
        with:
          registry: ${{ env.REGISTRY }}
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}

      - name: Push release to ghcr.io
        uses: docker/build-push-action@v2
        with:
          context: .
          push: true    
          file: Dockerfile.multistage
          tags: ${{ steps.meta.outputs.tags }}
          labels: ${{ steps.meta.outputs.labels }}

      - name: Slack Notification
        uses: 8398a7/action-slack@v3
        if: always()
        with:
          status: ${{ job.status }}
          fields: workflow,job,commit,repo,ref,author,took
        env:
          SLACK_WEBHOOK_URL: ${{ secrets.SLACK_WEBHOOK_URL }}
```

```
12:43
:white_check_mark: Succeeded GitHub Actions
8398a7@action-slack
repo
ArtZhiv/my-workflows
commit
b492b8a4
author
Artem Zhivushko<zhiv-art@yandex.com>
job
build-and-test
took
48 sec
ref
refs/tags/v0.2.1-alpha
workflow
Release to ghcr.io if tests OK (CI/CD)
```

```
12:47
:no_entry: Failed GitHub Actions
8398a7@action-slack
repo
ArtZhiv/my-workflows
commit
63171706
author
Artem Zhivushko<zhiv-art@yandex.com>
job
build-and-test
took
32 sec
ref
refs/heads/main
workflow
Release to ghcr.io if tests OK (CI/CD)
```
