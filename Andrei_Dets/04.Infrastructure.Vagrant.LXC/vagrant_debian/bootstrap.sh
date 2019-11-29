sudo apt-get update && apt-get upgrade -yqq
sudo apt-get install vim git wget curl -yqq
sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base
cat /dev/null > ~/.bash_history && history -c
