## 04. Ansible start
Deploy Ansible on any your localhost (Ubuntu/CentOS)
- Setup existing local user to run commands without password 
    - apt/yum upgrade
- Run command for upgrade locally using ansible add-hoc commands

Connect to the remote host
- Using Vagrant deploy two host
    - Ubuntu 18.04
    - CentOS 7.5
- Setup hosts for connection without password
- Allow ansible user upgrade system
    - Create new user
    - Apply sudo rules for its
- Using ansible need to do
    - Connect to the hosts
    - Print out host names and IP
    - Upgrade packages
- Create own inventory with all variables and hierarchie 

Output all your ansible commands (and commands also) put into `04.Ansible.start.md` and add to your repository, then prepare PR (Pull Request)
