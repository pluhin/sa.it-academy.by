## Homework Assignment 1: Docker Installation and Basic Commands
```shell
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

To install the latest version
```shell
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
Check installed version:
```shell
user@vm5:~$ docker --version
Docker version 27.4.1, build b9d17ea
```

Verify that the installation is successful by running the hello-world image:
```shell
user@vm5:~$ sudo docker run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
c1ec31eb5944: Pull complete
Digest: sha256:5b3cc85e16e3058003c13b7821318369dad01dac3dbb877aac3c28182255c724
Status: Downloaded newer image for hello-world:latest

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

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```

List running containers:
```shell
user@vm5:~$ sudo docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

List all containers:
```shell
user@vm5:~$ sudo docker ps -a
CONTAINER ID   IMAGE         COMMAND    CREATED         STATUS                     PORTS     NAMES
17f62a7f9147   hello-world   "/hello"   3 minutes ago   Exited (0) 3 minutes ago             fervent_clarke
```

## Homework Assignment 2: Building a Docker Image with Dockerfile

Create [spring-boot application](../07.Docker/app) and in that folder add [Docker file](../07.Docker/app/Dockerfile).

Build docker image

```shell
user@vm5:~/sa.it-academy.by/Yuliya_Buyalskaya/07.Docker/app$ sudo docker build -t hello-app .
[+] Building 302.6s (13/13) FINISHED                                                                                                                   docker:default
 => [internal] load build definition from Dockerfile                                                                                                             0.1s
 => => transferring dockerfile: 343B                                                                                                                             0.0s
 => [internal] load metadata for docker.io/library/openjdk:17                                                                                                    1.5s
 => [internal] load metadata for docker.io/library/gradle:8.12-jdk-alpine                                                                                        1.5s
 => [internal] load .dockerignore                                                                                                                                0.1s
 => => transferring context: 2B                                                                                                                                  0.0s
 => [temp 1/4] FROM docker.io/library/gradle:8.12-jdk-alpine@sha256:3b7c1983b9e8980d37d1b9db79539bc89c8b0f8b6e140db4226800825d6eef84                             0.0s
 => [stage-1 1/3] FROM docker.io/library/openjdk:17@sha256:528707081fdb9562eb819128a9f85ae7fe000e2fbaeaf9f87662e7b3f38cb7d8                                      0.0s
 => [internal] load build context                                                                                                                                0.1s
 => => transferring context: 1.05kB                                                                                                                              0.0s
 => CACHED [temp 2/4] WORKDIR /home/user/app/                                                                                                                    0.0s
 => [temp 3/4] COPY . .                                                                                                                                          0.6s
 => [temp 4/4] RUN gradle build                                                                                                                                296.6s
 => CACHED [stage-1 2/3] WORKDIR /home/user/app/                                                                                                                 0.0s
 => [stage-1 3/3] COPY --from=temp /home/user/app/ .                                                                                                             0.7s
 => exporting to image                                                                                                                                           0.8s
 => => exporting layers                                                                                                                                          0.6s
 => => writing image sha256:5336cdd790ea38e83e7473222071154b17ed49f9dca3714b0ee1fd979a4455e2                                                                     0.0s
 => => naming to docker.io/library/hello-app 
```
Check that image was created

```shell
user@vm5:~/sa.it-academy.by/Yuliya_Buyalskaya/07.Docker/app$ sudo docker images
REPOSITORY    TAG       IMAGE ID       CREATED          SIZE
hello-app     latest    5336cdd790ea   29 seconds ago   492MB
hello-world   latest    d2c94e258dcb   20 months ago    13.3kB
```

Run docker container from created image and check that this container is running

```shell
user@vm5:~/sa.it-academy.by/Yuliya_Buyalskaya/07.Docker/app$ sudo docker run -d -p 80:80 --name hello-app hello-app
0238e875641306e6acfb4e6350eebf4d654eb5dd7bcd7dd8ee57d67efbf59a6e
user@vm5:~/sa.it-academy.by/Yuliya_Buyalskaya/07.Docker/app$ sudo docker ps
CONTAINER ID   IMAGE       COMMAND                  CREATED          STATUS         PORTS                                         NAMES
0238e8756413   hello-app   "sh -c 'java -jar $A…"   11 seconds ago   Up 9 seconds   0.0.0.0:80->80/tcp, :::80->80/tcp, 8080/tcp   hello-app
```

Check docker logs that spring-boot application started successfully

```shell
user@vm5:~/sa.it-academy.by/Yuliya_Buyalskaya/07.Docker$ sudo docker logs hello-app

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/

 :: Spring Boot ::                (v3.4.1)

2025-01-02T23:44:24.491Z  INFO 1 --- [           main] org.example.MainApplication              : Starting MainApplication v1.0-SNAPSHOT using Java 17.0.2 with PID 1 (/home/user/app/build/libs/app-1.0-SNAPSHOT.jar started by root in /home/user/app)
2025-01-02T23:44:24.516Z  INFO 1 --- [           main] org.example.MainApplication              : No active profile set, falling back to 1 default profile: "default"
2025-01-02T23:44:33.424Z  INFO 1 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port 8080 (http)
2025-01-02T23:44:33.608Z  INFO 1 --- [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
2025-01-02T23:44:33.610Z  INFO 1 --- [           main] o.apache.catalina.core.StandardEngine    : Starting Servlet engine: [Apache Tomcat/10.1.34]
2025-01-02T23:44:34.769Z  INFO 1 --- [           main] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
2025-01-02T23:44:34.774Z  INFO 1 --- [           main] w.s.c.ServletWebServerApplicationContext : Root WebApplicationContext: initialization completed in 9751 ms
2025-01-02T23:44:39.788Z  INFO 1 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port 8080 (http) with context path '/'
2025-01-02T23:44:40.092Z  INFO 1 --- [           main] org.example.MainApplication              : Started MainApplication in 19.572 seconds (process running for 24.952)
2025-01-02T23:45:14.460Z  INFO 1 --- [nio-8080-exec-1] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring DispatcherServlet 'dispatcherServlet'
2025-01-02T23:45:14.462Z  INFO 1 --- [nio-8080-exec-1] o.s.web.servlet.DispatcherServlet        : Initializing Servlet 'dispatcherServlet'
2025-01-02T23:45:14.465Z  INFO 1 --- [nio-8080-exec-1] o.s.web.servlet.DispatcherServlet        : Completed initialization in 2 ms
```

Check response from application endpoint in running container

```shell
user@vm5:~/sa.it-academy.by/Yuliya_Buyalskaya/07.Docker/app$ sudo docker exec -it hello-app sh
sh-4.4# curl http://localhost:8080/hello
Hello, World!sh-4.4#
```
