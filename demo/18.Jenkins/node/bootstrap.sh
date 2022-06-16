#!/bin/sh
PUBLIC_MATER_KEY="*****"
apt update
apt -yyq install default-jdk git -q
useradd -s /bin/bash -d /home/jenkins/ -m jenkins
runuser -l jenkins -c 'echo -e "\n\n\n" | ssh-keygen -t rsa'
echo $PUBLIC_MATER_KEY  > /home/jenkins/.ssh/authorized_keys
chown jenkins:jenkins /home/jenkins/.ssh/authorized_keys
chmod 600 /home/jenkins/.ssh/authorized_keys
echo "Client done!"
