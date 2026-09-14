https://github.com/aionfiend/09.Docker/tree/9.3
#9.1
1. brew install docker
```
docker --version
Docker version 29.8.0, build 88096ef005
```
2. brew install colima # серверная часть для Mac
   colima start
3. docker run hello-world # скачать официальный образ из DockerHub
```
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
4f55086f7dd0: Pull complete 
d5e71e642bf5: Download complete 
Digest: sha256:5e23090353324d887c48ad5e5c56d294eab81588df9605b07d1afe895f9cc8f8
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.
```
4. user@users-MacBook-Pro$ docker ps /docker ps -a # просмотр истории запущенных контейнеров
```   
   CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES 

   user@users-MacBook-Pro$ docker ps -a
   CONTAINER ID   IMAGE         COMMAND    CREATED         STATUS                     PORTS     NAMES
   1f31db874410   hello-world   "/hello"   4 minutes ago   Exited (0) 4 minutes ago             keen_spence
```

9.2
1. Создание файлов для приложения, для дальнейшего капирования в контейнер
2. Создание файла .dockerignore, позволит убрать лишнее при копирвоании файлов и уменьшить размер контейнера.
3. Создание Dockerfile
4. docker build -t my-node-web-app
```
DEPRECATED: The legacy builder is deprecated and will be removed in a future release.
            Install the buildx component to build images with BuildKit:
            https://docs.docker.com/go/buildx/

Sending build context to Docker daemon   5.12kB
Step 1/8 : FROM node:20-alpine
20-alpine: Pulling from library/node
fff4e2c1b189: Pulling fs layer
4feea04c1543: Pulling fs layer
6a0ac1617861: Pulling fs layer
b2cbbfe903b0: Pulling fs layer
fff4e2c1b189: Download complete
b2cbbfe903b0: Download complete
14f8540414db: Download complete
0f92261bcd1c: Download complete
6a0ac1617861: Download complete
6a0ac1617861: Pull complete
4feea04c1543: Download complete
4feea04c1543: Pull complete
fff4e2c1b189: Pull complete
b2cbbfe903b0: Pull complete
Digest: sha256:fb4cd12c85ee03686f6af5362a0b0d56d50c58a04632e6c0fb8363f609372293
Status: Downloaded newer image for node:20-alpine
 ---> fb4cd12c85ee
Step 2/8 : ENV NODE_ENV=production
 ---> Running in e842ad015ac8
 ---> Removed intermediate container e842ad015ac8
 ---> 65b7dea4b87a
Step 3/8 : WORKDIR /app
 ---> Running in 9dee6f8e03e6
 ---> Removed intermediate container 9dee6f8e03e6
 ---> da2fe0e81a62
Step 4/8 : COPY package.json ./
 ---> 1036653bcfed
Step 5/8 : RUN npm install --only=production
 ---> Running in dcc03eed758f
npm warn config only Use `--omit=dev` to omit dev dependencies from the install.

added 69 packages, and audited 70 packages in 11s

16 packages are looking for funding
  run `npm fund` for details

2 moderate severity vulnerabilities

To address all issues, run:
  npm audit fix

Run `npm audit` for details.
npm notice
npm notice New major version of npm available! 10.8.2 -> 12.0.2
npm notice Changelog: https://github.com/npm/cli/releases/tag/v12.0.2
npm notice To update run: npm install -g npm@12.0.2
npm notice
 ---> Removed intermediate container dcc03eed758f
 ---> 5ba1c9b1050d
Step 6/8 : COPY . .
 ---> d8e94c1e358d
Step 7/8 : EXPOSE 3000
 ---> Running in fe79f23c8abb
 ---> Removed intermediate container fe79f23c8abb
 ---> 9672203c6511
Step 8/8 : CMD ["node", "app.js"]
 ---> Running in 3d7e7e3ed052
 ---> Removed intermediate container 3d7e7e3ed052
 ---> 438003e8929d
Successfully built 438003e8929d
Successfully tagged my-node-web-app:latest
```
5.  docker run -d -p 8080:3000 --name my-running-app my-node-web-app
   ```
    a41af935769dc592d2e1d0404d4b0146daec5e3238883c66284599985388d39e
```
6. docker ps
```
   CONTAINER ID   IMAGE             COMMAND                  CREATED              STATUS              PORTS                                         NAMES
   a41af935769d   my-node-web-app   "docker-entrypoint.s…"   About a minute ago   Up About a minute   0.0.0.0:8080->3000/tcp, [::]:8080->3000/tcp   my-running-app
```
7. docker logs my-running-app
```
   Сервер запущен на порту 3000
```
8. Проверка в браузере http://localhost:8080/

9.3
1. Отключение и удаление контейнера прошлого проекта
2. Создание всех требудемых файлов
3. Установка  brew install docker-buildx, mkdir -p ~/.docker/cli-plugins, ln -sfn $(which docker-buildx) ~/.docker/cli-plugins/docker-buildx
4. Сборка проекта локально docker run -d -p 8080:8080 --name my-running-app multistage-go-app:v1.0.0
5. Создание нового аккаунта Slack и Webhuk. СОздание секрета для GitHub.
6. Отправка и сборка контейнера в Git Action

# Для уменьшения весь использовался нулевой образ - scratch.
# go build -ldflags="-w -s" - исользуем флаги для очищения бинорного файла от символов отладки, что уменьшает его весь.
# COPY --from=builder - забирае уже созданный файл из первого этапа (builder).  