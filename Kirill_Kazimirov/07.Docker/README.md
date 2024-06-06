# 1. Homework Assignment 1: Docker Installation and Basic Commands
## 1.Install Docker on your local machine or a virtual environment.
Команды для установки

```
   apt update
   sudo apt-get install ca-certificates curl
   sudo install -m 0755 -d /etc/apt/keyrings
   sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
   sudo chmod a+r /etc/apt/keyrings/docker.asc
   echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/nullecho   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   sudo apt-get update
   docker version
 
```
 
## 2. Verify the Docker installation by running the docker --version command.
```
docker --version
Docker version 26.1.4, build 5650f9b
```
## 3.Pull the official "hello-world" Docker image and run a container based on it.
```
root@ubuntudev:~/07.Docker# sudo docker run hello-world

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
## 4. List the running containers using the docker ps command.
## 5. Document the installation process and the commands used for verification.

Демонстарция команды docker ps на примере запуска образа hello-world
```
docker run hello-world
root@ubuntudev:~# docker ps
CONTAINER ID   IMAGE         COMMAND    CREATED        STATUS                  PORTS     NAMES
350a512e6c24   hello-world   "/hello"   1 second ago   Up Less than a second             fervent_shamir
```
# 2. Homework Assignment 2: Building a Docker Image with Dockerfile
## 1.Create a new directory for your Dockerfile and application code.

Создал дирректорию 
```
mkdir 07.Docker/dockerdir
```
Подготовил код ,который будет возвращать по урлу http://localhost:8080 Hello World. Пример кода на Java ниже
```
package by.testweb;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class TestApp {

    public static void main(String[] args) {
        SpringApplication.run(TestApp.class, args);
    }
}


package by.testweb.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping
@RequiredArgsConstructor
public class TestController {

    @GetMapping
    public String hello() {
        return "Hello World";
    }
}

```

Затем подготовил сборку на компьютере. Положил в сборку в файл testweb.jar и запушил в гит.

Ссылка на репозиторий в гите: [https://github.com/Kirilllka1993/07Docker]

Затем скачал этот репозиторий на свою виртуальную машину

## 2.Write a Dockerfile to build an image for a simple web application (e.g., Flask or Node.js).

Находясь в директории вместе с testweb.jar добавил докер файл

Dockerfile

```
FROM openjdk:17-oracle
MAINTAINER kazimirov

COPY testweb.jar /app.jar
ENTRYPOINT ["sh", "-c"]
CMD ["java -jar /app.jar"]
```

## 3.Copy your application code into the image and set the necessary environment.

По сути мой код лежит в скомпилированном виде в testweb.jar

## 4.Build the Docker image using the docker build command. 

Создадим образ
```
docker build -t appweb:v1.0 .

```

## 5. Run a container based on the image and access the web application.

Запустим полученный образ в котейнере выставив 8080 порт
```
docker run --publish 8080:8080 -t appweb:v1.0
```
В результате увидим логи нашего приложения.

```
rootubuntudev:/07.Docker/dockerdir/07Docker docker run --publish 8080:8080 -t appweb:v1.0

  .   ____          _            __ _ _
 /\\ / ____ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___  _  _  _ \/ _  \ \ \ \
 \\/  ___) _)      (_   ) ) ) )
    ____ .___ __ _\__,  / / / /
 =========_==============___/=/_/_/_/
 :: Spring Boot ::                (v3.1.5)

2024-06-06T21:48:23.041Z  INFO 1 ---            main by.testweb.TestApp                       : Starting TestApp v1.0-SNAPSHOT using Java 17.0.2 with PID 1 (/app.jar started by root in /)
2024-06-06T21:48:23.055Z  INFO 1 ---            main by.testweb.TestApp                       : No active profile set, falling back to 1 default profile: "default"
2024-06-06T21:48:24.721Z  INFO 1 ---            main o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port(s): 8080 (http)
2024-06-06T21:48:24.747Z  INFO 1 ---            main o.apache.catalina.core.StandardService   : Starting service Tomcat
2024-06-06T21:48:24.751Z  INFO 1 ---            main o.apache.catalina.core.StandardEngine    : Starting Servlet engine: Apache Tomcat/10.1.15
2024-06-06T21:48:24.949Z  INFO 1 ---            main o.a.c.c.C.Tomcat.localhost./       : Initializing Spring embedded WebApplicationContext
2024-06-06T21:48:24.954Z  INFO 1 ---            main w.s.c.ServletWebServerApplicationContext : Root WebApplicationContext: initialization completed in 1788 ms
2024-06-06T21:48:25.905Z  INFO 1 ---            main o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port(s): 8080 (http) with context path 
2024-06-06T21:48:25.936Z  INFO 1 ---            main by.testweb.TestApp                       : Started TestApp in 3.62 seconds (process running for 4.356)
2024-06-06T21:49:06.631Z  INFO 1 --- nio-8080-exec-1 o.a.c.c.C.Tomcat.localhost./       : Initializing Spring DispatcherServlet dispatcherServlet
2024-06-06T21:49:06.634Z  INFO 1 --- nio-8080-exec-1 o.s.web.servlet.DispatcherServlet        : Initializing Servlet dispatcherServlet
2024-06-06T21:49:06.638Z  INFO 1 --- nio-8080-exec-1 o.s.web.servlet.DispatcherServlet        : Completed initialization in 1 ms
```
Выполним curl http://localhost:8080

```
root@ubuntudev:~# curl http://localhost:8080
Hello World
```

## 6. Document the steps taken to create the Dockerfile, build the image, and access the app.
