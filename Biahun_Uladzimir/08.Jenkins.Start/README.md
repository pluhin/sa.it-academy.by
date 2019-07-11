## 08. Jenkins. Start

#### Deploy Jenkins use home environment.

*   Setup Vagrant file
*   Install Jenkins
*   Default settings setup (like access/plugins)
*   Hide Jenkins behind the web server (Apapche, Ngnix)
*   Implement Ansible role for that


##### Uncomment / comment  the necessary lines in Vagrantfile depending on the OS
````bash
  config.vm.box = "bento/centos-7.5"
#  config.vm.box = "bento/ubuntu-18.04"

  ...

  config.vm.provision "shell", path: "scriptRH.sh"
#  config.vm.provision "shell", path: "scriptDeb.sh"


````
