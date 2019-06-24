#!/bin/bash
PASSWORD="23mnZujif4rzU"
for i in 178.124.206.48;do sshpass -p "$PASSWORD" ssh-copy-id -i ~/.ssh/id_rsa.pub -o StrictHostKeyChecking=no jump_sa@$i;done
