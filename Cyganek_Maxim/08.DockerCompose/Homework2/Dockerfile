# ============================================
# BUILD STAGE
# ============================================
FROM maven:3.9.9-eclipse-temurin-21 AS builder

WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# ============================================
# RUNTIME STAGE
# ============================================
FROM eclipse-temurin:21-jre-jammy

RUN groupadd -r spring && useradd -r -g spring spring

WORKDIR /app
COPY --from=builder --chown=spring:spring /app/target/*.jar app.jar

USER spring

EXPOSE 8080

ENV SPRING_PROFILES_ACTIVE=prod
ENV JAVA_OPTS="-Xmx512m -Xms256m"

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]