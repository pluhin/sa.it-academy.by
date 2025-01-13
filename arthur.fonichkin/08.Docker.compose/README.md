# 07.Docker compose

### Repository link:
https://github.com/ArthurF-java/dockercompose

## Task1

### Dockerfile:
```dockerfile
FROM openjdk:21-jdk-slim
RUN useradd -ms /bin/bash tester
USER tester
WORKDIR /app
COPY target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
```

### Docker-compose:
```yaml
version: '3.9'

services:
  db:
    image: postgres:15
    container_name: postgres-db
    environment:
      POSTGRES_USER: ${DB_USER}
      POSTGRES_PASSWORD: ${DB_PASSWORD}
      POSTGRES_DB: ${DB_NAME}
    env_file:
      - .env
    restart: always
    volumes:
      - docker_comp_postgres_data:/var/lib/postgresql/data
  app:
    build:
      context: .
      dockerfile: Dockerfile
    container_name: spring-boot-app
    ports:
      - "8080:8080"
    restart: always
    environment:
      SPRING_DATASOURCE_URL: jdbc:postgresql://db:5432/${DB_NAME}
      SPRING_DATASOURCE_USERNAME: ${DB_USER}
      SPRING_DATASOURCE_PASSWORD: ${DB_PASSWORD}
    env_file:
      - .env
    depends_on:
      - db

volumes:
  docker_comp_postgres_data:
```

### Environment variables file:
```env
DB_NAME=postgres_db
DB_USER=user
DB_PASSWORD=password
```

## Task2


### Dockerfile:
```dockerfile
# Stage 1: Build Stage
FROM maven:3.9.8-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean test
RUN mvn clean package -DskipTests

# Stage 2: Runtime Stage
FROM openjdk:21-jdk-slim AS runtime
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
```

### Deployment file:
```yaml
name: Docker-compose

on:
  push:
    branches:
      - main
env:
  BUILD_NAME: "${{ vars.APP_NAME }}:${{ vars.APP_VERSION }}"
jobs:
  build-test-deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Build docker image
        run: docker build -t ${{ env.BUILD_NAME }} .

      - name: Run docker container
        run: docker run --name qqq -d -p ${{ vars.APP_PORT }}:${{ vars.APP_PORT }} ${{ env.BUILD_NAME }}

      - name: Wait for port 8080 to be busy
        run: |
          echo "Checking if port 8080 is busy..."
          for i in {1..10}; do
            if curl --silent --output /dev/null http://localhost:8080; then
              echo "Port 8080 is busy."
              exit 0
            fi
            echo "Port 8080 is not busy yet. Retrying in 1 second..."
            sleep 1
          done
          echo "Port 8080 did not become busy after 10 seconds."
          exit 1

      - name: Check app
        run: |
          echo "checUrl: $CHECK_URL"
          RESPONSE_STATUS=$(curl --write-out "%{http_code}" --silent --output /dev/null "$CHECK_URL")
          echo "response status: $RESPONSE_STATUS"
          if [ "$RESPONSE_STATUS" -eq 200 ]; then
            echo "successful with status = $RESPONSE_STATUS"
          else
            echo "error with status = $RESPONSE_STATUS"
            exit 1
          fi
        env:
          CHECK_URL: ${{ vars.CHECK_URL }}

      - name: Log in to the Container registry
        uses: docker/login-action@v3
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.CR_TOKEN }}

      - name: Build and push Docker images
        uses: docker/build-push-action@v2
        with:
          context: .
          push: true
          tags: ghcr.io/arthurf-java/${{ env.BUILD_NAME }}

      - name: Slack Notification
        if: success()
        uses: rtCamp/action-slack-notify@v2
        env:
          SLACK_CHANNEL: md-sa2-30-24
          SLACK_COLOR: ${{ job.status }}
          SLACK_ICON: https://github.com/rtCamp.png?size=48
          SLACK_MESSAGE: 'Post Content :rocket:'
          SLACK_TITLE: 'Deploy is done'
          SLACK_USERNAME: fonichkin
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}

      - name: Slack Notification
        if: failure()
        uses: rtCamp/action-slack-notify@v2
        env:
          SLACK_CHANNEL: md-sa2-30-24
          SLACK_COLOR: ${{ job.status }}
          SLACK_ICON: https://github.com/rtCamp.png?size=48
          SLACK_TITLE: 'Deploy failed'
          SLACK_USERNAME: fonichkin
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}
```

