# Set up sudo
echo %vagrant ALL=NOPASSWD:ALL > /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant
# Setup sudo to allow no-password sudo for "sudo"
usermod -a -G sudo vagrant
apt-get update && apt install -y vim git wget curl iotop htop screen mc 
sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base && cat /dev/null > ~/.bash_history && history -c && exit