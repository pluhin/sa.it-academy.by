FROM gradle:8.10-jdk21 AS builder

WORKDIR /app

COPY . .

RUN chmod +x gradlew

RUN ./gradlew clean bootJar --no-daemon

FROM openjdk:21-jdk-slim

WORKDIR /app

COPY --from=builder /app/build/libs/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]

