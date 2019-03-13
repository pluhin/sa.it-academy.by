#!/bin/bash
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $pkg|grep "install ok installed")
if [ "" == "$PKG_OK" ];  then
  sudo apt-get --force-yes --yes install $pkg
fi 
echo "All installed and updated"
