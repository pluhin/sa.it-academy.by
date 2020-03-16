apt update
apt install -yq sudo
useradd insider
echo "insider:lxc" | chpasswd -m
echo "insider   ALL=(ALL) NOPASSWD:ALL" | tee /etc/sudoers.d/insider
