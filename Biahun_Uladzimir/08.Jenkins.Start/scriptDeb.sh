#!/bin/sh

sudo apt update
sudo apt install python-pip sshpass ansible -y

sudo pip install virtualenv --upgrade
sudo pip install -U setuptools
sudo pip install "ansible==2.8"

ansible --version
