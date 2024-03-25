#!/bin/bash
apt update && apt upgrade -yqq
apt install -yqq openjdk-11-jdk wget git curl
useradd -m -d /var/lib/jenkins jenkins
runuser -l jenkins -c 'mkdir /var/lib/jenkins/.ssh/'
runuser -l jenkins -c 'cat /tmp/authorized_keys >> /var/lib/jenkins/.ssh/authorized_keys'
chown jenkins:jenkins /var/lib/jenkins/.ssh/authorized_keys
chmod 600 /var/lib/jenkins/.ssh/authorized_keys
rm -f /tmp/authorized_keys
echo "Client done!"
