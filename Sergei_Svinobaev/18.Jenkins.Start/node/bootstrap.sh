#!/bin/sh
PUBLIC_MATER_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5awgjt9fyDX9EXhvXmChD3ERbw/nzOJZGRuChWShNa2apZ/uTnZneOaeczEIO3pHvrw3R2IWmBS7HcxVYbEYHeKPpENYEKXvXhDhu8Rbti5HTttxQSH9Y/7VLMLfybTZE9kw93tM3T/4LB7srdyuU7Xd3NAxBKWtYrYpUQyYdC+C1b3LqZVuBERHJp6HX4qjYZZcvUUG/gYrl2C7Q5VnfmA7UCL4MZFoD9y9l7wa8i2uyxPKbGZ6nYNw3S0H9Om/VVuPDXWxBQEBzmiql6Na9lMQOwByxvEta4JV2ljAMFxlRyk1XZ7ogF0qdF1zF5jvcWXrgnHuOfnMQlf65Sx7H jenkins@localhost.localdomain"
apt update
apt -yyq install openjdk-8-jdk git -q
useradd -s /bin/bash -d /home/jenkins/ -m jenkins
runuser -l jenkins -c 'echo -e "\n\n\n" | ssh-keygen -t rsa'
echo $PUBLIC_MATER_KEY  > /home/jenkins/.ssh/authorized_keys
chown jenkins:jenkins /home/jenkins/.ssh/authorized_keys
chmod 600 /home/jenkins/.ssh/authorized_keys
echo "Client done!"
