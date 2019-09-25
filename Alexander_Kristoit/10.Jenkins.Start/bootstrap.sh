#!/bin/sh

sudo apt update
sudo apt upgrade -y

sudo apt-get install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get install traceroute ansible python-pip -y
sudo pip install -U setuptools

ansible --version
