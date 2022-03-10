#!/bin/sh
PUBLIC_MATER_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDqaKVR4Y4SHCQ//fjadnbpM/5q/O6QBAFl8f/3z08YfWqc9rXFhUHgzQ9vgW+loQnq1etnz8o0GDo8P7RI0zb6YiYP7+3tD4SLoBMhq8cVeUitktguuMThTtHIRTJaEXH4sl3ur4EUdELhihk0jK8UWmI/zULvemhQroaFRW5dDNEF15NoIvF0EEkBaKf7TYN+rhuryAWTaa4jsaYwKYmjfPidNzumxxBsXhFsZB1TErYuA0ThUAirTAIT5EBCu4GyPxu4dzuJAsMKK2iVGod1YN2hw0+TCDrJCCerK4HJzfOqdpTj/Sqh18gnt9sI30zxnLPdSq5uY7m8YVxjhokF jenkins@localhost.localdomain"
apt update
apt -yyq install openjdk-8-jdk git -q
useradd -s /bin/bash -d /home/jenkins/ -m jenkins
runuser -l jenkins -c 'echo -e "\n\n\n" | ssh-keygen -t rsa'
echo $PUBLIC_MATER_KEY  > /home/jenkins/.ssh/authorized_keys
chown jenkins:jenkins /home/jenkins/.ssh/authorized_keys
chmod 600 /home/jenkins/.ssh/authorized_keys
echo "Client done!"
