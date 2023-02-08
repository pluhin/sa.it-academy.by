### Dockerfile
```Dockerfile
FROM maven:3.8.5-openjdk-17 as build

WORKDIR /opt
COPY ./echo/*pom.xml /opt/
COPY ./echo /opt/
RUN mvn package -DskipTests

FROM openjdk:17-slim

COPY --from=build /opt/target/echo-*.jar /opt/app.jar
CMD java -jar /opt/app.jar
```

### Build
```
docker build -t echo:v1 .
Sending build context to Docker daemon   29.7kB
Step 1/8 : FROM maven:3.8.5-openjdk-17 as build
3.8.5-openjdk-17: Pulling from library/maven
38a980f2cc8a: Pull complete
de849f1cfbe6: Pull complete
a7203ca35e75: Pull complete
3337662e6dc9: Pull complete
81485058ab89: Pull complete
b548970362bb: Pull complete
dbd02ad382f5: Pull complete
Digest: sha256:3a9c30b3af6278a8ae0007d3a3bf00fff80ec3ed7ae4eb9bfa1772853101549b
Status: Downloaded newer image for maven:3.8.5-openjdk-17
 ---> db741528e48a
Step 2/8 : WORKDIR /opt
 ---> Running in ba8a07b27c07
Removing intermediate container ba8a07b27c07
 ---> 8f2865866e6a
Step 3/8 : COPY ./echo/*pom.xml /opt/
 ---> 107d2ef5c878
Step 4/8 : COPY ./echo /opt/
 ---> 8ace6ed8358b
Step 5/8 : RUN mvn package -DskipTests
 ---> Running in 9ef3ebe52f10
[INFO] Scanning for projects...
[INFO] Replacing main artifact with repackaged archive
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  33.373 s
[INFO] Finished at: 2022-12-26T11:03:34Z
[INFO] ------------------------------------------------------------------------
Removing intermediate container 9ef3ebe52f10
 ---> 424da04b7841
Step 6/8 : FROM openjdk:17-slim
17-slim: Pulling from library/openjdk
1fe172e4850f: Pull complete
44d3aa8d0766: Pull complete
6ce99fdf16e8: Pull complete
Digest: sha256:aaa3b3cb27e3e520b8f116863d0580c438ed55ecfa0bc126b41f68c3f62f9774
Status: Downloaded newer image for openjdk:17-slim
 ---> 37cb44321d04
Step 7/8 : COPY --from=build /opt/target/echo-*.jar /opt/app.jar
 ---> 3c676bef9879
Step 8/8 : CMD java -jar /opt/app.jar
 ---> Running in 0b89f57c5a31
Removing intermediate container 0b89f57c5a31
 ---> ef1fbc077b97
Successfully built ef1fbc077b97
Successfully tagged echo:v1


docker images
REPOSITORY   TAG                IMAGE ID       CREATED              SIZE
echo         v1                 ef1fbc077b97   38 seconds ago       426MB
<none>       <none>             424da04b7841   About a minute ago   869MB
maven        3.8.5-openjdk-17   db741528e48a   8 months ago         798MB
openjdk      17-slim            37cb44321d04   8 months ago         408MB

```

### Run
```
docker run -it -d -p 8080:8080 echo:v1
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS                                       NAMES
c90db04999fa   echo:v1   "/bin/sh -c 'java -j…"   20 seconds ago   Up 19 seconds   0.0.0.0:8080->8080/tcp, :::8080->8080/tcp   jolly_elion
```

### Result
```
maksim@maksim:~$ curl http://localhost:8080/echo/Test_request
Test_request
maksim@maksim:~$
```
