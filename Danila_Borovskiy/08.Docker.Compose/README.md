## 08.Docker.Compose

---

### 1. Docker Compose for Application Stacks

---

- Select a combination of services (e.g., web app, database) to create a multi-container application.

    > Node.js + PostgreSQL
  
- Create a Docker Compose YAML file to define the services, networks, and volumes.

    ```yaml
    version: '3.7'
    
    services:
      db:
        container_name: ${DB_SERVICE_NAME}
        build:
          context: ./db
          dockerfile: Dockerfile
        restart: always
        env_file:
          - .env
        environment:
          POSTGRES_DB: ${POSTGRES_DB}
          POSTGRES_USER: ${POSTGRES_USER}
          POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
        volumes:
          - db_data:/var/lib/postgresql/data
    
      backend:
        container_name: ${BACKEND_SERVICE_NAME}
        build:
          context: ./backend
          dockerfile: Dockerfile
        depends_on:
          - db
        env_file:
          - .env
        ports:
          - "${EXPRESS_PORT}:${EXPRESS_PORT}"
  
      frontend:
        container_name: ${FRONTEND_SERVICE_NAME}
        build:
          context: ./frontend
          dockerfile: Dockerfile
        depends_on:
          - backend
        env_file:
          - .env
        ports:
          - "${NEXT_JS_PORT}:${NEXT_JS_PORT}"
    
    volumes:
      db_data:
    ```

- Configure environment variables and dependencies between services.
    
    > I specified connection env variables inside .env file and use it inside docker.compose

    ```yaml
    db:
      env_file:
        - .env
      environment:
        POSTGRES_DB: ${POSTGRES_DB}
        POSTGRES_USER: ${POSTGRES_USER}
        POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
    backend:
      depends_on:
        - db
      env_file:
        - .env
    ```

    `.env`
    
    ```
    POSTGRES_DB=mydatabase
    POSTGRES_USER=postgresUser
    POSTGRES_PASSWORD=Qwerty123
    
    POSTGRES_PORT=5432
    EXPRESS_PORT=8080
    NEXT_JS_PORT=3001
    
    DB_SERVICE_NAME=db
    BACKEND_SERVICE_NAME=backend
    FRONTEND_SERVICE_NAME=frontend
    ```

- Run the application stack using the `docker-compose up` command.

    ```bash
    docker-compose up
    ```
    
    ```bash
    [+] Running 3/3
    Network 08dockercompose_default      Created                                                                                                                                                         0.0s
    Container 08dockercompose-db-1       Created                                                                                                                                                         0.0s
    Container 08dockercompose-backend-1  Created                                                                                                                                                         0.0s
    Attaching to 08dockercompose-backend-1, 08dockercompose-db-1
    08dockercompose-db-1       |
    08dockercompose-db-1       | PostgreSQL Database directory appears to contain a database; Skipping initialization
    08dockercompose-db-1       |
    08dockercompose-db-1       | 2024-02-12 00:11:02.861 UTC [1] LOG:  starting PostgreSQL 16.1 (Debian 16.1-1.pgdg120+1) on aarch64-unknown-linux-gnu, compiled by gcc (Debian 12.2.0-14) 12.2.0, 64-bit
    08dockercompose-db-1       | 2024-02-12 00:11:02.861 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
    08dockercompose-db-1       | 2024-02-12 00:11:02.861 UTC [1] LOG:  listening on IPv6 address "::", port 5432
    08dockercompose-db-1       | 2024-02-12 00:11:02.864 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
    08dockercompose-db-1       | 2024-02-12 00:11:02.868 UTC [29] LOG:  database system was shut down at 2024-02-12 00:10:56 UTC
    08dockercompose-db-1       | 2024-02-12 00:11:02.872 UTC [1] LOG:  database system is ready to accept connections
    08dockercompose-backend-1  |
    08dockercompose-backend-1  | > 08.docker.compose@1.0.0 start
    08dockercompose-backend-1  | > node app.js
    08dockercompose-backend-1  |
    08dockercompose-backend-1  | NodeJs express is listening on port: 8080
    ```

- Access the application through a web browser or API client.

    ```bash
    curl http://localhost:8080/date
    ```

    ```bash
    Current time in the database is: Mon Feb 12 2024 00:00:00 GMT+0000 (Coordinated Universal Time)
    ```

    ```bash
    curl http://localhost:3001
    ```
    
    ```bash
    <!DOCTYPE html><html lang="en"><head><meta charSet="utf-8"/><meta name="viewport" content="width=device-width, initial-scale=1"/><link rel="preload" href="/_next/static/media/c9a5bc6a7c948fb0-s.p.woff2" as="font" crossorigin="" type="font/woff2"/><link rel="stylesheet" href="/_next/static/css/b71044d5e3b93ee3.css" data-precedence="next"/><link rel="preload" as="script" fetchPriority="low" href="/_next/static/chunks/webpack-2584248c23848716.js"/><script src="/_next/static/chunks/fd9d1056-cc48c28d170fddc2.js" async=""></script><script src="/_next/static/chunks/69-1b6d135f94ac0e36.js" async=""></script><script src="/_next/static/chunks/main-app-211c41536461e7b5.js" async=""></script><title>Create Next App</title><meta name="description" content="Generated by create next app"/><link rel="icon" href="/favicon.ico" type="image/x-icon" sizes="16x16"/><meta name="next-size-adjust"/><script src="/_next/static/chunks/polyfills-c67a75d1b6f99dc8.js" noModule=""></script></head><body class="__className_aaf875"><main class="flex min-h-screen items-center justify-center bg-gradient-to-br from-blue-300 to-blue-700"><div class="text-center text-white"><h1 class="text-4xl font-bold mb-8">Current date from DB</h1><p class="text-lg mb-4">2/12/2024</p></div></main><script src="/_next/static/chunks/webpack-2584248c23848716.js" async=""></script><script>(self.__next_f=self.__next_f||[]).push([0]);self.__next_f.push([2,null])</script><script>self.__next_f.push([1,"1:HL[\"/_next/static/media/c9a5bc6a7c948fb0-s.p.woff2\",\"font\",{\"crossOrigin\":\"\",\"type\":\"font/woff2\"}]\n2:HL[\"/_next/static/css/b71044d5e3b93ee3.css\",\"style\"]\n0:\"$L3\"\n"])</script><script>self.__next_f.push([1,"4:I[7690,[],\"\"]\n7:I[5613,[],\"\"]\n8:I[1778,[],\"\"]\na:I[8955,[],\"\"]\nb:[]\n"])</script><script>self.__next_f.push([1,"3:[[[\"$\",\"link\",\"0\",{\"rel\":\"stylesheet\",\"href\":\"/_next/static/css/b71044d5e3b93ee3.css\",\"precedence\":\"next\",\"crossOrigin\":\"$undefined\"}]],[\"$\",\"$L4\",null,{\"buildId\":\"Ge0cJL1r1VghkCPHNIdGk\",\"assetPrefix\":\"\",\"initialCanonicalUrl\":\"/\",\"initialTree\":[\"\",{\"children\":[\"__PAGE__\",{}]},\"$undefined\",\"$undefined\",true],\"initialSeedData\":[\"\",{\"children\":[\"__PAGE__\",{},[\"$L5\",\"$L6\",null]]},[null,[\"$\",\"html\",null,{\"lang\":\"en\",\"children\":[\"$\",\"body\",null,{\"className\":\"__className_aaf875\",\"children\":[\"$\",\"$L7\",null,{\"parallelRouterKey\":\"children\",\"segmentPath\":[\"children\"],\"loading\":\"$undefined\",\"loadingStyles\":\"$undefined\",\"loadingScripts\":\"$undefined\",\"hasLoading\":false,\"error\":\"$undefined\",\"errorStyles\":\"$undefined\",\"errorScripts\":\"$undefined\",\"template\":[\"$\",\"$L8\",null,{}],\"templateStyles\":\"$undefined\",\"templateScripts\":\"$undefined\",\"notFound\":[[\"$\",\"title\",null,{\"children\":\"404: This page could not be found.\"}],[\"$\",\"div\",null,{\"style\":{\"fontFamily\":\"system-ui,\\\"Segoe UI\\\",Roboto,Helvetica,Arial,sans-serif,\\\"Apple Color Emoji\\\",\\\"Segoe UI Emoji\\\"\",\"height\":\"100vh\",\"textAlign\":\"center\",\"display\":\"flex\",\"flexDirection\":\"column\",\"alignItems\":\"center\",\"justifyContent\":\"center\"},\"children\":[\"$\",\"div\",null,{\"children\":[[\"$\",\"style\",null,{\"dangerouslySetInnerHTML\":{\"__html\":\"body{color:#000;background:#fff;margin:0}.next-error-h1{border-right:1px solid rgba(0,0,0,.3)}@media (prefers-color-scheme:dark){body{color:#fff;background:#000}.next-error-h1{border-right:1px solid rgba(255,255,255,.3)}}\"}}],[\"$\",\"h1\",null,{\"className\":\"next-error-h1\",\"style\":{\"display\":\"inline-block\",\"margin\":\"0 20px 0 0\",\"padding\":\"0 23px 0 0\",\"fontSize\":24,\"fontWeight\":500,\"verticalAlign\":\"top\",\"lineHeight\":\"49px\"},\"children\":\"404\"}],[\"$\",\"div\",null,{\"style\":{\"display\":\"inline-block\"},\"children\":[\"$\",\"h2\",null,{\"style\":{\"fontSize\":14,\"fontWeight\":400,\"lineHeight\":\"49px\",\"margin\":0},\"children\":\"This page could not be found.\"}]}]]}]}]],\"notFoundStyles\":[],\"styles\":null}]}]}],null]],\"initialHead\":[false,\"$L9\"],\"globalErrorComponent\":\"$a\",\"missingSlots\":\"$Wb\"}]]\n"])</script><script>self.__next_f.push([1,"9:[[\"$\",\"meta\",\"0\",{\"name\":\"viewport\",\"content\":\"width=device-width, initial-scale=1\"}],[\"$\",\"meta\",\"1\",{\"charSet\":\"utf-8\"}],[\"$\",\"title\",\"2\",{\"children\":\"Create Next App\"}],[\"$\",\"meta\",\"3\",{\"name\":\"description\",\"content\":\"Generated by create next app\"}],[\"$\",\"link\",\"4\",{\"rel\":\"icon\",\"href\":\"/favicon.ico\",\"type\":\"image/x-icon\",\"sizes\":\"16x16\"}],[\"$\",\"meta\",\"5\",{\"name\":\"next-size-adjust\"}]]\n5:null\n"])</script><script>self.__next_f.push([1,"6:[\"$\",\"main\",null,{\"className\":\"flex min-h-screen items-center justify-center bg-gradient-to-br from-blue-300 to-blue-700\",\"children\":[\"$\",\"div\",null,{\"className\":\"text-center text-white\",\"children\":[[\"$\",\"h1\",null,{\"className\":\"text-4xl font-bold mb-8\",\"children\":\"Current date from DB\"}],[\"$\",\"p\",null,{\"className\":\"text-lg mb-4\",\"children\":\"2/12/2024\"}]]}]}]\n"])</script><script>self.__next_f.push([1,""])</script></body></html>%  
    ```

### 2. Building a Docker Image with Dockerfile

---

- Choose a programming language (e.g., Java, Go, Python) and a sample application.

    > JavaScript Next app

- Write a multi-stage Dockerfile to build the application with different stages for build and runtime.

    ```Dockerfile
    FROM node:alpine AS build
    WORKDIR /app
    COPY package*.json ./
    RUN npm install
    COPY . .
    RUN npm run build
    
    
    FROM node:alpine
    WORKDIR /app
    COPY --from=build /app/package*.json ./
    RUN npm install --only=production
    COPY --from=build /app/.next ./.next
    EXPOSE 3001
    CMD ["npm", "run", "start"]
    ```

- Build the multi-stage Docker image and run a container based on it

    ```bash
    docker-compose up
    ```
  
    ```yaml
    frontend:
      container_name: ${FRONTEND_SERVICE_NAME}
      build:
        context: ./frontend
        dockerfile: Dockerfile
      depends_on:
        - backend
      env_file:
        - .env
      ports:
        - "${NEXT_JS_PORT}:${NEXT_JS_PORT}"
    ```
    
- Push/publish image to docker hub and/or github container register.
    
    ```bash
    docker images 
    ```
    
    ```bash
    REPOSITORY                 TAG       IMAGE ID       CREATED             SIZE
    08dockercompose-frontend   latest    1223e79f111c   24 minutes ago      631MB
    08dockercompose-backend    latest    c72f22c4410f   About an hour ago   145MB
    08dockercompose-db         latest    44a595cbaae3   5 weeks ago         448MB
    ```
    
    ```bash
    docker tag 1223e79f111c dborovskiy00/08dockercompose-frontend:1.0
    ```
    
    ```bash
    docker login
    ```
    
    ```bash
    docker push dborovskiy00/08dockercompose-frontend:1.0
    ```
