FROM openjdk:8-jdk-alpine AS base
LABEL maintainer="DenKa"
COPY src usr/app/
WORKDIR usr/app
EXPOSE 9000
CMD javac serv/Main.java \
 && jar -cfvm serv.jar MANIFEST.MF serv/*.class \
 && java -XX:+UseContainerSupport -XX:MetaspaceSize=100m -jar serv.jar
