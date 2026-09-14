# 09.Docker.Basic.concept


## 📂 Project Structure
```
09.Docker.Basic.concept/
├── .github/
│   └── workflows/
│       └── docker-build.yml    
├── homework2/                 
│   ├── app.py                   
│   └── Dockerfile              
├── homework3/                   
│   ├── app.py                  
│   ├── Dockerfile 
└── README.md
```

## 🛠️ Homework Assignment 1: Docker Installation and Basic Commands

### 1. Verifying Docker Installation

```bash
docker --version
Docker version 29.8.0, build 88096ef
```

#### 2. Running the Test "hello-world" Container
```bash
docker run hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

```

### 3. Listing Containers

```
docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```
To view all containers.
```bash
docker ps -a
CONTAINER ID   IMAGE                COMMAND           CREATED              STATUS                          PORTS     NAMES
02f52f8c1b57   hello-world:latest   "/hello"          About a minute ago   Exited (0) About a minute ago             stupefied_lovelace
```

---

## 🏗️ Homework Assignment 2: Building a Docker Image with Dockerfile

A basic Docker image was created for a web application built with **Python (Flask)**.

1. **Building the Docker image:**
```bash
docker build -t my-flask-app:v1

   IMAGE                ID             DISK USAGE   CONTENT SIZE   EXTRA
my-flask-app:v1      0d2b63ec67ac        212MB           52MB 
```
2. **Running the container in background mode with port forwarding:**
```bash
docker run -d -p 80:5000 --name my_flask my-flask-app:v1
3188e3318c137c8198bb69f742c82636cc7e49c05156b60539b14b20a5e2e4dd
```
3. **Verifying the container status**
```bash
docker ps
CONTAINER ID   IMAGE             COMMAND           CREATED         STATUS         PORTS                                     NAMES
3188e3318c13   my-flask-app:v1   "python app.py"   6 minutes ago   Up 6 minutes   0.0.0.0:80->5000/tcp, [::]:80->5000/tcp   my_flask
```
4. **Accessing the application:**
``` 
curl localhost
<h1>Hello from Docker Container! 🚀</h1>
```
---

## 🚀 Homework Assignment 3: Docker Build Automation (GitHub Actions)

This assignment implements a **Multi-stage build** for the Docker image and configures a complete CI/CD workflow that pushes the final image to Docker Hub and triggers a Slack notification.


### Multi-stage Dockerfile (`homework3/Dockerfile`):
```dockerfile
# === STAGE 1: Build stage ===
FROM python:3.10-slim AS builder
WORKDIR /build
RUN pip install --no-cache-dir wheel && \
    pip install --no-cache-dir --user flask

# === STAGE 2: Runtime stage ===
FROM python:3.10-slim AS runner
WORKDIR /app
# Copy dependencies from Build
COPY --from=builder /root/.local /root/.local
COPY app.py .
ENV PATH=/root/.local/bin:\$PATH
EXPOSE 5000
CMD ["python", "app.py"]
```

1. **Automation via GitHub Actions:**

[https://github.com/maksimsolapai-gif/09.Docker.Basic/actions/runs/34767163414/job/103750077313]

3. **Build and Push Docker image to Docker Hub:** 

[https://hub.docker.com/r/maksimsolap/flask-app]
   
5. **Slack Notification:**
**Docker Build Success!** 
 ```
Actions URL                    Commit
Build and Push Docker Image    3b8305
Docker Build Success!
Image: maksimsolap/flask-app:latest successfully built and pushed.
 ```

**Or Docker Build Failed ❌** 






