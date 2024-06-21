# 1.Homework Assignment 1: Docker Compose for Application Stacks
## 1.Select a combination of services (e.g., web app, database) to create a multi-container application.

Для работы подготовил небольшую программу на java которая добавляет делает круд операции с пользоватлеями

Код с контролерами

```
package by.testweb.controller;

import by.testweb.entity.User;
import by.testweb.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("users")
public class UserController {

    private final UserService userService;

    @PostMapping
    public User addUser(@RequestBody User user) {
        return userService.add(user);
    }

    @GetMapping
    public List<User> getAllUser() {
        return userService.findAllUsers();
    }

    @GetMapping(value = "/{id}")
    public User getUserById(@PathVariable("id") Long id) {
        return userService.getUserById(id);
    }

    @GetMapping(value = "/name")
    public User getUserByName(@RequestParam("name") String userName) {
        return userService.getUserByName(userName);
    }

    @DeleteMapping(value = "/{id}")
    public User delete(@PathVariable("id") Long id) {
        return userService.delete(id);
    }


}
```
```
package by.testweb.service;

import by.testweb.entity.User;
import by.testweb.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

    @Override
    public User add(User user) {
        return userRepository.save(user);
    }

    @Override
    public List<User> findAllUsers() {
        return userRepository.findAll();
    }

    @Override
    public User getUserById(Long id) {
        return userRepository.findById(id).get();
    }

    @Override
    public User getUserByName(String name) {
        return userRepository.findByUserName(name);
    }

    @Override
    public User delete(Long id) {
        var user = userRepository.findById(id).orElseThrow(() -> new RuntimeException("Не найден пользователь с id " + id));
        userRepository.delete(user);
        return user;
    }
}
```

Код Репозитория
```
package by.testweb.repository;

import by.testweb.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {

    User findByUserName(String userName);
}


```
Код сущности

```
package by.testweb.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "users")
public class User {

    @Id
    @SequenceGenerator(name = "userGenerator", sequenceName = "s_users", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "userGenerator")
    private Long id;

    @Column(name = "username")
    private String userName;

    private String password;

    private String email;

    private String phone;

}

```

## 2.Create a Docker Compose YAML file to define the services, networks, and volumes.

Файл docker-compose.yaml
```
version: '3.3'

services:
  app:
    image: 'testweb:latest'
    ports:
      - "8080:8080"
    build:
      context: .
    container_name: app
    depends_on:
      - db
    environment:
      - SPRING_DATASOURCE_URL=jdbc:postgresql://db:5432/postgres?currentSchema=public
      - SPRING_DATASOURCE_USERNAME=${POSTGRES_USER}
      - SPRING_DATASOURCE_PASSWORD=${POSTGRES_PASSWORD}
    env_file:
      - .env
  db:
    image: 'postgres:14.12-alpine3.20'
    container_name: db
    environment:
      - POSTGRES_USER=${POSTGRES_USER}
      - POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
    ports:
      - "5432:5432"
```
Перед этим был создан образ testweb с помощью докер файла и команды 
```
docker build -t testweb  .
```

Докер файл соответствующий
```
FROM openjdk:17-oracle
MAINTAINER kazimirov

COPY testweb.jar /app.jar
ENTRYPOINT ["sh", "-c"]
CMD ["java -jar /app.jar"]

```
## 3.Configure environment variables and dependencies between services.
В одной папеке вместе с docker-compose.yaml лежит файл .env

```
POSTGRES_USER=postgres
POSTGRES_PASSWORD=sa
```

## 4.Run the application stack using the docker-compose up or docker compose up command.
При запуске docker compose up получаем на выходе
```
rootubuntudev:/08.DockerCompose rootubuntudev:/08.DockerCompose docker compose up
WARN0000 /root/08.DockerCompose/docker-compose.yaml: version is obsolete
+ Running 2/2
  Container db   Created                                                                                          0.0s
  Container app  Recreated                                                                                        0.1s
Attaching to app, db
db   
db    PostgreSQL Database directory appears to contain a database; Skipping initialization
db   
db    2024-06-17 22:16:15.489 UTC 1 LOG:  starting PostgreSQL 14.12 on x86_64-pc-linux-musl, compiled by gcc (Alpine 13.2.1_git20240309) 13.2.1 20240309, 64-bit
db    2024-06-17 22:16:15.489 UTC 1 LOG:  listening on IPv4 address "0.0.0.0", port 5432
db    2024-06-17 22:16:15.489 UTC 1 LOG:  listening on IPv6 address "::", port 5432
db    2024-06-17 22:16:15.498 UTC 1 LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
db    2024-06-17 22:16:15.507 UTC 23 LOG:  database system was shut down at 2024-06-17 22:15:34 UTC
db    2024-06-17 22:16:15.514 UTC 1 LOG:  database system is ready to accept connections
app  
app     .   ____          _            __ _ _
app    /\\ / ____ __ _ _(_)_ __  __ _ \ \ \ \
app   ( ( )\___  _  _  _ \/ _  \ \ \ \
app    \\/  ___) _)      (_   ) ) ) )
app       ____ .___ __ _\__,  / / / /
app    =========_==============___/=/_/_/_/
app    :: Spring Boot ::                (v3.1.5)
app  
app   2024-06-17T22:16:19.302Z  INFO 1 ---            main by.testweb.TestApp                       : Starting TestApp v1.0-SNAPSHOT using Java 17.0.2 with PID 1 (/app.jar started by root in /)
app   2024-06-17T22:16:19.312Z  INFO 1 ---            main by.testweb.TestApp                       : No active profile set, falling back to 1 default profile: "default"
app   2024-06-17T22:16:20.396Z  INFO 1 ---            main .s.d.r.c.RepositoryConfigurationDelegate : Bootstrapping Spring Data JPA repositories in DEFAULT mode.
app   2024-06-17T22:16:20.491Z  INFO 1 ---            main .s.d.r.c.RepositoryConfigurationDelegate : Finished Spring Data repository scanning in 76 ms. Found 1 JPA repository interfaces.
app   2024-06-17T22:16:21.229Z  INFO 1 ---            main o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port(s): 8080 (http)
app   2024-06-17T22:16:21.248Z  INFO 1 ---            main o.apache.catalina.core.StandardService   : Starting service Tomcat
app   2024-06-17T22:16:21.248Z  INFO 1 ---            main o.apache.catalina.core.StandardEngine    : Starting Servlet engine: Apache Tomcat/10.1.15
app   2024-06-17T22:16:21.343Z  INFO 1 ---            main o.a.c.c.C.Tomcat.localhost./       : Initializing Spring embedded WebApplicationContext
app   2024-06-17T22:16:21.346Z  INFO 1 ---            main w.s.c.ServletWebServerApplicationContext : Root WebApplicationContext: initialization completed in 1910 ms
app   2024-06-17T22:16:21.591Z  INFO 1 ---            main com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Starting...
app   2024-06-17T22:16:22.153Z  INFO 1 ---            main com.zaxxer.hikari.pool.HikariPool        : HikariPool-1 - Added connection org.postgresql.jdbc.PgConnection6326d182
app   2024-06-17T22:16:22.158Z  INFO 1 ---            main com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Start completed.
app   2024-06-17T22:16:22.520Z  INFO 1 ---            main liquibase.database                       : Set default schema name to public
db    2024-06-17 22:16:23.045 UTC 30 ERROR:  relation "public.databasechangelog" does not exist at character 22
db    2024-06-17 22:16:23.045 UTC 30 STATEMENT:  SELECT COUNT(*) FROM public.databasechangelog
db    2024-06-17 22:16:23.198 UTC 30 ERROR:  relation "public.databasechangeloglock" does not exist at character 22
db    2024-06-17 22:16:23.198 UTC 30 STATEMENT:  SELECT COUNT(*) FROM public.databasechangeloglock
app   2024-06-17T22:16:23.256Z  INFO 1 ---            main liquibase.executor                       : Changelog query completed.
app   2024-06-17T22:16:23.263Z  INFO 1 ---            main liquibase.executor                       : Changelog query completed.
app   2024-06-17T22:16:23.269Z  INFO 1 ---            main liquibase.executor                       : Changelog query completed.
app   2024-06-17T22:16:23.276Z  INFO 1 ---            main liquibase.executor                       : Changelog query completed.
app   2024-06-17T22:16:23.284Z  INFO 1 ---            main liquibase.executor                       : Changelog query completed.
app   2024-06-17T22:16:23.287Z  INFO 1 ---            main liquibase.lockservice                    : Successfully acquired change log lock
app   2024-06-17T22:16:23.317Z  INFO 1 ---            main liquibase.changelog                      : Creating database history table with name: public.databasechangelog
app   2024-06-17T22:16:23.331Z  INFO 1 ---            main liquibase.executor                       : Changelog query completed.
app   2024-06-17T22:16:23.340Z  INFO 1 ---            main liquibase.changelog                      : Reading from public.databasechangelog
app   2024-06-17T22:16:23.346Z  INFO 1 ---            main liquibase.executor                       : Changelog query completed.
app   2024-06-17T22:16:23.352Z  INFO 1 ---            main liquibase.executor                       : Changelog query completed.
app   Running Changeset: db/changelog/users/user-create-table.yaml::user-create-table::kazimirov
app   2024-06-17T22:16:23.444Z  INFO 1 ---            main liquibase.changelog                      : Table users created
app   2024-06-17T22:16:23.449Z  INFO 1 ---            main liquibase.changelog                      : ChangeSet db/changelog/users/user-create-table.yaml::user-create-table::kazimirov ran successfully in 52ms
app   2024-06-17T22:16:23.454Z  INFO 1 ---            main liquibase.executor                       : Changelog query completed.
app   2024-06-17T22:16:23.460Z  INFO 1 ---            main liquibase.executor                       : Changelog query completed.
app   Running Changeset: db/changelog/users/user-create-table.yaml::1.0.0.t.users.sequence::kazimirov
app   2024-06-17T22:16:23.483Z  INFO 1 ---            main liquibase.changelog                      : Sequence s_users created
app   2024-06-17T22:16:23.490Z  INFO 1 ---            main liquibase.changelog                      : ChangeSet db/changelog/users/user-create-table.yaml::1.0.0.t.users.sequence::kazimirov ran successfully in 23ms
app   2024-06-17T22:16:23.498Z  INFO 1 ---            main liquibase.executor                       : Changelog query completed.
app   Running Changeset: db/changelog/users/user-insert.yaml::user-insert::kazimirov
app   2024-06-17T22:16:23.519Z  INFO 1 ---            main liquibase.changelog                      : New row inserted into users
app   2024-06-17T22:16:23.525Z  INFO 1 ---            main liquibase.changelog                      : ChangeSet db/changelog/users/user-insert.yaml::user-insert::kazimirov ran successfully in 18ms
app   2024-06-17T22:16:23.531Z  INFO 1 ---            main liquibase.executor                       : Changelog query completed.
app   2024-06-17T22:16:23.543Z  INFO 1 ---            main liquibase                                : Update command completed successfully.
app   2024-06-17T22:16:23.550Z  INFO 1 ---            main liquibase.executor                       : Changelog query completed.
app   2024-06-17T22:16:23.555Z  INFO 1 ---            main liquibase.lockservice                    : Successfully released change log lock
app   2024-06-17T22:16:23.669Z  INFO 1 ---            main o.hibernate.jpa.internal.util.LogHelper  : HHH000204: Processing PersistenceUnitInfo name: default
app   2024-06-17T22:16:23.737Z  INFO 1 ---            main org.hibernate.Version                    : HHH000412: Hibernate ORM core version 6.2.13.Final
app   2024-06-17T22:16:23.742Z  INFO 1 ---            main org.hibernate.cfg.Environment            : HHH000406: Using bytecode reflection optimizer
app   2024-06-17T22:16:24.132Z  INFO 1 ---            main o.s.o.j.p.SpringPersistenceUnitInfo      : No LoadTimeWeaver setup: ignoring JPA class transformer
app   2024-06-17T22:16:26.844Z  INFO 1 ---            main o.h.e.t.j.p.i.JtaPlatformInitiator       : HHH000489: No JTA platform available (set hibernate.transaction.jta.platform to enable JTA platform integration)
app   2024-06-17T22:16:26.848Z  INFO 1 ---            main j.LocalContainerEntityManagerFactoryBean : Initialized JPA EntityManagerFactory for persistence unit default
app   2024-06-17T22:16:27.788Z  WARN 1 ---            main JpaBaseConfigurationJpaWebConfiguration : spring.jpa.open-in-view is enabled by default. Therefore, database queries may be performed during view rendering. Explicitly configure spring.jpa.open-in-view to disable this warning
app   2024-06-17T22:16:28.421Z  INFO 1 ---            main o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port(s): 8080 (http) with context path 
app   2024-06-17T22:16:28.458Z  INFO 1 ---            main by.testweb.TestApp                       : Started TestApp+
```

## 5. Access the application through a web browser or API client.
## 6. Document the Docker Compose file structure and the steps to deploy the application stack.
Проверяем работоспособность нашего приложения. Моё приложение по умолчанию добавило одного пользоватля в бд для проверки

```
curl http://127.0.0.1:8080/users
```
Ответ от сервиса

```
root@ubuntudev:~# curl http://127.0.0.1:8080/users
[{"id":1,"userName":"kirill","password":"123456","email":"kirill@gmail.com","phone":"3752998765432"}]
```

# 2. Homework Assignment 2: Docker build automation (github action)
## 1. Choose a programming language (e.g., Java, Go, Python) and a sample application.
Язык java. Ссылка на кодв в github: [https://github.com/Kirilllka1993/MultiDocker]

## 2.Write a multi-stage Dockerfile to build the application with different stages for build and runtime.
Мой Dockerfile
```
FROM maven:3.9.7-eclipse-temurin-17 as builder
COPY  . /root/app/
WORKDIR /root/app
RUN mvn install
FROM openjdk:17-oracle as jdk17
EXPOSE 8080
COPY --from=builder /root/app/ /home/app/
WORKDIR /home/app
ENTRYPOINT ["java","-jar", "-Xmx15m", "./target/testweb-1.0-SNAPSHOT.jar"]

```
## 3.Compile or package the application in the build stage.
## 4.Copy the compiled application into the runtime stage and configure it to run.
## 5.Build the multi-stage Docker image and run a container based on it.

Создадим образ в виртуальной машине
```
rootubuntudev:/08.MultiDocker/MultiDocker docker build -t app .
```
На выходе
```
rootubuntudev:/08.MultiDocker/MultiDocker docker build .
+ Building 84.3s (13/13) FINISHED                                                                      docker:default
 = internal load build definition from Dockerfile                                                               0.0s
 = = transferring dockerfile: 317B                                                                               0.0s
 = internal load metadata for docker.io/library/openjdk:17-oracle                                               1.5s
 = internal load metadata for docker.io/library/maven:3.9.7-eclipse-temurin-17                                  2.4s
 = internal load .dockerignore                                                                                  0.0s
 = = transferring context: 2B                                                                                    0.0s
 = internal load build context                                                                                  0.1s
 = = transferring context: 34.95kB                                                                               0.1s
 = CACHED jdk17 1/3 FROM docker.io/library/openjdk:17-oraclesha256:83ffa182a7cfc8313583fe1cc42172a48a021f368a  0.0s
 = builder 1/4 FROM docker.io/library/maven:3.9.7-eclipse-temurin-17sha256:c9f6c7f42971caa42d15690adb66b9f18  37.3s
 = = resolve docker.io/library/maven:3.9.7-eclipse-temurin-17sha256:c9f6c7f42971caa42d15690adb66b9f18c2caf6ee6  0.0s
 = = sha256:3c930bd25dd53355206fb22462e8fbde127b1d43483ca67962d2bf2bb4a534c0 17.46MB / 17.46MB                   9.9s
 = = sha256:16ad6f4a66d89ec065cfbb3c50b747fb633356b416ce7cf8a401bc4c3e979e39 2.41kB / 2.41kB                     0.0s
 = = sha256:db39646274eacde3e8c4abd5a34bb608b52c0be1ec92c51c6a57e3e6cc682b9f 145.10MB / 145.10MB                26.5s
 = = sha256:c9f6c7f42971caa42d15690adb66b9f18c2caf6ee60b816159788285e333876f 1.21kB / 1.21kB                     0.0s
 = = sha256:fe69c590420427ca7ea24d40bb93c10cd244204bbfafee156cc347c016d00427 10.09kB / 10.09kB                   0.0s
 = = sha256:2ec76a50fe7c8d5db9ec25590b9217e14e3920513c6e7b5be55db72a16b55f7c 30.44MB / 30.44MB                  10.7s
 = = sha256:7948178b4c26a03ca48c677e56865ee5d754d9f7ef612c9e91dc15c239d4dca8 173B / 173B                        10.5s
 = = sha256:dee390ebec53ec7588055b27080fcc66d4244ff2f4b46eb409c0fe768f70b16a 733B / 733B                        11.0s
 = = sha256:cf3f38015000b5408f9baadfeb65c2f4f585297e5e79c66c3812c3ae436e59fa 19.00MB / 19.00MB                  21.6s
 = = extracting sha256:2ec76a50fe7c8d5db9ec25590b9217e14e3920513c6e7b5be55db72a16b55f7c                          5.0s
 = = sha256:53192e0aab5b4cd5d89f43c8a45ee61dd85e68526ad360ba6cdd645afb814ce8 9.65MB / 9.65MB                    17.7s
 = = extracting sha256:3c930bd25dd53355206fb22462e8fbde127b1d43483ca67962d2bf2bb4a534c0                          4.1s
 = = sha256:b6e8d7348ee05cad95a258d1d43936e99e23198604a57010763ee9324841d177 853B / 853B                        18.6s
 = = sha256:6215416b59d7edb826ce0e7c71a261a26ff30b3748c80283c29d5038099e5a15 356B / 356B                        19.1s
 = = sha256:178a679ad1f95f88324ce4af028008f08a26e3b184f29555bd4de300d180e7f8 155B / 155B                        19.6s
 = = extracting sha256:db39646274eacde3e8c4abd5a34bb608b52c0be1ec92c51c6a57e3e6cc682b9f                          6.8s
 = = extracting sha256:7948178b4c26a03ca48c677e56865ee5d754d9f7ef612c9e91dc15c239d4dca8                          0.0s
 = = extracting sha256:dee390ebec53ec7588055b27080fcc66d4244ff2f4b46eb409c0fe768f70b16a                          0.0s
 = = extracting sha256:cf3f38015000b5408f9baadfeb65c2f4f585297e5e79c66c3812c3ae436e59fa                          2.7s
 = = extracting sha256:53192e0aab5b4cd5d89f43c8a45ee61dd85e68526ad360ba6cdd645afb814ce8                          0.4s
 = = extracting sha256:b6e8d7348ee05cad95a258d1d43936e99e23198604a57010763ee9324841d177                          0.0s
 = = extracting sha256:6215416b59d7edb826ce0e7c71a261a26ff30b3748c80283c29d5038099e5a15                          0.0s
 = = extracting sha256:178a679ad1f95f88324ce4af028008f08a26e3b184f29555bd4de300d180e7f8                          0.0s
 = builder 2/4 COPY  . /root/app/                                                                               0.4s
 = builder 3/4 WORKDIR /root/app                                                                                0.1s
 = builder 4/4 RUN mvn install                                                                                 43.3s
 = jdk17 2/3 COPY --from=builder /root/app/ /home/app/                                                          0.1s
 = jdk17 3/3 WORKDIR /home/app                                                                                  0.1s
 = exporting to image                                                                                             0.2s
 = = exporting layers                                                                                            0.2s
 = = writing image sha256:762df87e0cec5e517875a20182469c71f3da714c3549bb61e6d0f24ba0ef83df                       0.0s
```
Запустим образ в контейнере

```
docker run app
```
На выходе

```
root@ubuntudev:~/08.MultiDocker/MultiDocker# docker run --publish 8080:8080 app

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::                (v3.1.5)

2024-06-19T22:27:19.166Z  INFO 1 --- [           main] by.testweb.TestApp                       : Starting TestApp v1.0-SNAPSHOT using Java 17.0.2 with PID 1 (/home/app/target/testweb-1.0-SNAPSHOT.jar started by root in /home/app)
2024-06-19T22:27:19.182Z  INFO 1 --- [           main] by.testweb.TestApp                       : No active profile set, falling back to 1 default profile: "default"
2024-06-19T22:27:20.944Z  INFO 1 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port(s): 8080 (http)
2024-06-19T22:27:20.988Z  INFO 1 --- [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
2024-06-19T22:27:20.988Z  INFO 1 --- [           main] o.apache.catalina.core.StandardEngine    : Starting Servlet engine: [Apache Tomcat/10.1.15]
2024-06-19T22:27:21.214Z  INFO 1 --- [           main] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
2024-06-19T22:27:21.218Z  INFO 1 --- [           main] w.s.c.ServletWebServerApplicationContext : Root WebApplicationContext: initialization completed in 1885 ms
2024-06-19T22:27:21.952Z  INFO 1 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port(s): 8080 (http) with context path ''
2024-06-19T22:27:22.014Z  INFO 1 --- [           main] by.testweb.TestApp                       : Started TestApp in 3.529 seconds (process running for 4.584)
```
Проверим работоспособность

```
root@ubuntudev:~/08.MultiDocker/MultiDocker# curl http://127.0.0.1:8080
Hello World 
root@ubuntudev:~/08.MultiDocker/MultiDocker#

```
## 6.Push/publish image to docker hub and/or github container register.

Сначала надо было сгенерить access_token, чтобы я мог запушить свой образ в registry github
Токен я создавал здесь: [https://github.com/settings/tokens]
Мой токен буде браться из secrets.GITHUB_TOKEN
После этого я создал github action workflow: pushimage.yaml

```
name: Publish Docker image

on:
  release:
    types: [published]
  push:
    branches:
      - "main"

jobs:
  push_to_registries:
    name: Push Docker image
    runs-on: ubuntu-latest
    permissions:
      packages: write
      contents: read
    steps:
      - name: Check out the repo
        uses: actions/checkout@v2

      - name: Log in to the Container registry
        uses: docker/login-action@v1
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}

      - name: Build and push Docker images
        uses: docker/build-push-action@v2
        with:
          context: .
          push: true
          tags: ghcr.io/kirilllka1993/app:latest

```
Результат пуша action тут: [https://github.com/Kirilllka1993/MultiDocker/actions/runs/9589051069/job/26442197480]

## 7.Slack notification when build failed/success with image name/tag.
## 8.Document the Dockerfile structure, the build process, and the advantages of multi-stage builds.
