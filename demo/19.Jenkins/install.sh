#!/bin/bash
apt update && apt -yqq upgrade && apt install -yqq wget git curl fontconfig openjdk-17-jre
wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
apt update && apt install -yqq jenkins
service jenkins stop
#####################################
rm -rf /var/lib/jenkins/init.groovy.d && mkdir /var/lib/jenkins/init.groovy.d
cp -v ./01_AuthorizationStrategy.groovy /var/lib/jenkins/init.groovy.d/
cp -v ./02_addUser.groovy /var/lib/jenkins/init.groovy.d/
service jenkins start
sleep 1m
####################################
JENKINSPWD=$(cat /var/lib/jenkins/secrets/initialAdminPassword)
rm -f jenkins_cli.jar.*
wget -q http://localhost:8080/jnlpJars/jenkins-cli.jar
while IFS= read -r line
do
  list=$list' '$line
done < ./jenkinsPlugins.txt
java -jar ./jenkins-cli.jar -auth admin:$JENKINSPWD -s http://localhost:8080 install-plugin $list
service jenkins restart
sleep 1m
####################################
runuser -l jenkins -c 'echo -e "\n\n\n" | ssh-keygen -t ed25519'
runuser -l jenkins -c 'cat ~/.ssh/id_ed25519'
runuser -l jenkins -c 'cat ~/.ssh/id_ed25519.pub'
echo "Master ready!"

