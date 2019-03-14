#!/bin/sh
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' nmap|grep "install ok installed")
if [ "" == "$PKG_OK" ];  then
sudo apt -y install nmap
else 
sudo apt --only-upgrade install nmap;
echo "All installed and updated"
