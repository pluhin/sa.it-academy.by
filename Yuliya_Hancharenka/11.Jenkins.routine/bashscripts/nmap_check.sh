#!/bin/bash
nmap -n -sn 192.168.1.200/24 -oG - | awk '/Up$/{print $2}'
