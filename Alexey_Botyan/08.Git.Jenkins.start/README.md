# Deploy jenkins behind nginx on Centos

## Deploy process: 

+ inject your public key inside authorized_keys file in VagrantVM directory
+ deploy vm via vagrant
+ run playbook
+ add in hosts "192.168.0.223 jenkins.homeenv", when "192.168.0.223" is vagrantvm ip, "jenkins.homeenv" is virtualhost name
+ check in browser http://jenkins.homeenv