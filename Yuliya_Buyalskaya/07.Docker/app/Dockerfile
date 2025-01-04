FROM gradle:8.12-jdk-alpine AS temp
WORKDIR /home/user/app/
COPY . . 
RUN gradle build 

FROM openjdk:17
ENV JAR_NAME=app-1.0-SNAPSHOT.jar
ENV APP_HOME=/home/user/app/    
WORKDIR $APP_HOME
COPY --from=temp $APP_HOME .     
EXPOSE 8080
ENTRYPOINT ["sh", "-c", "java -jar $APP_HOME/build/libs/$JAR_NAME"]
