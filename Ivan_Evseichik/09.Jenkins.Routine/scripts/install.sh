#!/bin/sh
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' nmap|grep "install ok installed")
if [ "" == "$PKG_OK" ];  then
sudo apt -y install nmap
echo "NMAP installed"
else 
sudo apt --only-upgrade install nmap
echo "NMAP updated"
fi
