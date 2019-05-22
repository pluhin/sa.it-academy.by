# Classic jenkins pipeline

## Job delegated to slave host
### Inventory inventory file: https://github.com/Afinsky/jenkins/blob/master/inv.yaml


+ step 1: check connection to 192.168.253.130, module: ping

+ step 2: install nmap, module: apt

+ step 3: check online, module: shell, command: nmap -sP 192.168.253.0/24 > ~/whoonline.txt

+ step 4: remove nmap, module: apt

+ step 5: cat ~/whoonline.txt