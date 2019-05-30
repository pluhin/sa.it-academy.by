# Jenkins pipeline

+ step 1: check connection to 192.168.253.135, module: ping

+ step 2: Scan network

  + 1 Update apt
  + 2 Install Nmap
  + 3 Nmap scan module shell: nmap -sP 192.168.253.135/24
  + 4 Print scan module debug
  + 5 Remove Nmap
