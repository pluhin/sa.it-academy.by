sudo yum update && yum upgrade -y
sudo yum install vim git wget curl -y
sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base
cat /dev/null > ~/.bash_history && history -c

