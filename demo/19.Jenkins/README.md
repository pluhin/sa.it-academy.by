## Jenkins node install

```bash
    1  apt update
    2  apt upgrade -y
    3  apt install -y vim mc git bash-completion
    4  apt updtae
    5  apt update
    6  apt upgrade -y
    7  apt update && apt upgrade -yqq
    8  apt install -yqq openjdk-17-jre wget git curl
    9  useradd -m -d /var/lib/jenkins jenkins
   10  runuser -l jenkins -c 'mkdir /var/lib/jenkins/.ssh/'
   11  ssh-keygen -f /tmp/jenkins
   12  ls -l
   13  ls -l /tmp/
   14  vim /tmp/jenkins
   15  c
   16  clear
   17  ip addr
   18  vim /tmp/jenkins
   19  runuser -l jenkins -c 'cat /tmp/jenkins.pub >> /var/lib/jenkins/.ssh/authorized_keys'
   20  cat /var/lib/jenkins/.ssh/authorized_keys
   21  chown jenkins:jenkins /var/lib/jenkins/.ssh/authorized_keys
   22  chmod 600 /var/lib/jenkins/.ssh/authorized_keys
   23  history
```
