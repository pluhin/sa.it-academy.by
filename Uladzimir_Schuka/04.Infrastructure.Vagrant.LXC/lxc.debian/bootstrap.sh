apt-get update && apt install -y sudo vim git wget curl iotop htop screen mc 
useradd -G sudo insider
# Set up sudo
sed -i '$ a \\nsudo  ALL=NOPASSWD:ALL' /etc/sudoers 

