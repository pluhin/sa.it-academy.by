## 07.Docker

---

### 1. Install Docker on your local machine or a virtual environment.

---

- Docker Installation and Basic Commands

    > I have Docker Desktop installed for my MacOS M1Pro
  
- Verify the Docker installation by running the docker --version command.

    ```bash
    docker --version
    ```

    ```bash
    Docker version 20.10.21, build baeda1f
    ```

- Pull the official "hello-world" Docker image and run a container based on it.

    ```bash
    docker pull hello-world
    ```
    
    ```bash
    docker run hello-world
    ```
    
    ```bash
    Hello from Docker!
    This message shows that your installation appears to be working correctly.
    
    To generate this message, Docker took the following steps:
     1. The Docker client contacted the Docker daemon.
     2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
        (arm64v8)
     3. The Docker daemon created a new container from that image which runs the
        executable that produces the output you are currently reading.
     4. The Docker daemon streamed that output to the Docker client, which sent it
        to your terminal.
    
    To try something more ambitious, you can run an Ubuntu container with:
     $ docker run -it ubuntu bash
    
    Share images, automate workflows, and more with a free Docker ID:
     https://hub.docker.com/
    
    For more examples and ideas, visit:
     https://docs.docker.com/get-started/
    ```

- List the running containers using the docker ps command.

    ```bash
    docker ps -a
    ```

    ```bash
    CONTAINER ID   IMAGE         COMMAND    CREATED         STATUS                     PORTS     NAMES
    6a71cc6ad26d   hello-world   "/hello"   7 minutes ago   Exited (0) 7 minutes ago             festive_joliot
    ```

### 2. Building a Docker Image with Dockerfile

---

- Write a Dockerfile to build an image for a simple web application (e.g., Flask or Node.js).

    ```docker
    FROM node:alpine
    WORKDIR /app
    COPY package*.json .
    RUN npm ci
    COPY . .
    EXPOSE 8080
    CMD npm run start
    ```

- Build the Docker image using the docker build command.

    ```bash
    docker build -t nodejs-app .  
    ```

- Run a container based on the image and access the web application.

    ```bash
    docker run -p 8080:8080 nodejs-app    
    ```

    ```bash
    NodeJs express is listening on port: 8080
    ```

    ```bash
    echo -e "GET / HTTP/1.1\r\nHost: localhost\r\nConnection: close\r\n\r\n" | nc localhost 8080
    ```

    ```bash
    HTTP/1.1 200 OK
    X-Powered-By: Express
    Content-Type: text/html; charset=utf-8
    Content-Length: 32
    Date: Wed, 07 Feb 2024 20:51:36 GMT
    Connection: close
    
    My nodeJs express App in Docker!
    ```
