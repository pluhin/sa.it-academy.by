FROM jenkins/jenkins:lts-jdk17
USER root
RUN apt-get update && apt-get install -y curl
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
USER jenkins