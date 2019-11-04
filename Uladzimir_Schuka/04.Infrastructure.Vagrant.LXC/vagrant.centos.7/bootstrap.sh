# Set up sudo
echo %vagrant ALL=NOPASSWD:ALL > /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant
# Setup sudo to allow no-password sudo for "sudo"
usermod -a -G sudo vagrant
yum install -y vim git wget curl iotop htop screen mc 