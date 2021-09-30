#! /bin/bash

if [ "$(cat /etc/os-release | grep -w NAME | cut -d'=' -f2)" = '"Ubuntu"' ]
  then
      echo "Ubuntu"
      sudo apt -q update
  else
      echo "CentOS"
      yum -yq update
fi
exit 0