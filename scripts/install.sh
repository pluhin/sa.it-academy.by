#!/bin/bash
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' nmap|grep "install ok installed")
if [ "" == "$PKG_OK" ];  then
  sudo apt-get --force-yes --yes install nmap
fi 
sudo apt-get --only-upgrade install nmap
echo "All installed and updated"
