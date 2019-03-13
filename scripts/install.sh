#!/bin/bash
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' tcpdump|grep "install ok installed")
if [ "" == "$PKG_OK" ]; sudo apt-get --only-upgrade install tcpdump then
  sudo apt-get --force-yes --yes install tcpdump
fi 
echo "All installed and updated"
