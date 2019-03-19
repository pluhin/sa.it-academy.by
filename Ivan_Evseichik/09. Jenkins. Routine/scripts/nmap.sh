#!/bin/bash
nmap -n -sn 192.168.200.0/24 -oG - | awk '/Up$/{print $2}'
