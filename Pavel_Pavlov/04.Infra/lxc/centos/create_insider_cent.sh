yum check-update
yum -y -q install sudo
useradd insider
echo "insider:lxc" | chpasswd -m
echo "insider   ALL=(ALL) NOPASSWD:ALL" | tee /etc/sudoers.d/insider
