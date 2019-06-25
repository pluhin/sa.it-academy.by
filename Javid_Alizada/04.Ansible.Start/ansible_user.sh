#!/bin/bash
PASSWORD="***"
for i in 178.124.206.48 192.168.254.50 192.168.254.51;do sshpass -p "$PASSWORD" ssh-copy-id -i ~/.ssh/id_rsa.pub -o StrictHostKeyChecking=no jump_sa@$i;done
