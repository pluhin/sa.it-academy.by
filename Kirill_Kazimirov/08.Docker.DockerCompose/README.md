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
