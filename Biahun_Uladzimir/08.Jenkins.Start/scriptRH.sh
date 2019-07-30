#!/bin/sh

sudo yum update

sudo yum install epel-release sshpass -y --nogpgcheck -q
sudo yum install python-pip -y --nogpgcheck -q
sudo pip install "ansible==2.8"
