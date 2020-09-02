#!/bin/bash

# Script to get IP addresses of vagrant nodes (Jenkins master & nodes)

# Change permissions to file:
# 	chmod 777 script_get_ip.sh
# Execute script:
# 	./script_get_ip.sh 

# vagrant ssh -c "ip addr show eth1" | grep 'inet\b' | awk '{print $2}' | cut -d/ -f1
# ip addr show eth1 shows information about eth1
# grep "inet\b" only shows the line that has the IPv4 address (if you wanted the IPv6 address, change it to "inet6\b")
# awk '{print $2}' prints on the second field, which has the ipaddress/mask, example 192.168.100.18/24
# cut -d/ -f1 only takes the IP address portion.

for dir in *; do # loop for all files in directory 
    if [ -d "$dir" ]; then # get only directories
        cd $dir # go to that directory
        path=$PWD/.vagrant # path to .vagrant folder
        if [ -d "$path" ]; then # check if path to .vagrant exists
            printf "$dir \n"
            vagrant ssh -c "ip addr show eth1" | grep 'inet\b' | awk '{print $2}' | cut -d/ -f1
            printf "\n"
        fi
        cd ..
    fi
done