#!/bin/sh
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' nmap|grep "install ok installed")
if [ "" == "$PKG_OK" ];  then
echo "nmap not installed"
else
sudo apt purge -y nmap;
echo "Removed nmap tools from machine"
