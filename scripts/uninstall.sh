#!/bin/sh
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' nmap|grep "install ok installed")
if [ "" == "$PKG_OK" ];  then
sudo apt purge-y nmap
fi 
echo "Removed nmap tools from machine"
