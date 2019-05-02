#! /bin/bash

OS_VER=$(cat /etc/os-release |grep -w 'NAME'| cut -f2 -d'=')


if [ "$OS_VER" = '"Ubuntu"' ]; then
 sudo apt-get -q update
 sudo apt install mc -yq
else
 sudo yum -yq install mc
fi

exit 0