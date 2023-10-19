# Build stage
FROM openjdk:8-jdk-alpine as build-stage
WORKDIR /app
COPY Main.java .
RUN javac Main.java

# Runtime stage
FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build-stage /app/Main.class .
CMD ["java", "Main"]
