```bash
    1  apt update
    2  apt upgrade -y
    3  apt install -y vim mc git bash-completion
    4  apt update
    5  apt install -yqq openjdk-17-jre wget git curl
    6  useradd -m -d /var/lib/jenkins jenkins
    7  runuser -l jenkins -c 'mkdir /var/lib/jenkins/.ssh/'
    8  ssh-keygen -f /tmp/jenkins
    9  cat /var/lib/jenkins/.ssh/authorized_keys
   10  chown jenkins:jenkins /var/lib/jenkins/.ssh/authorized_keys
   11  chmod 600 /var/lib/jenkins/.ssh/authorized_keys
   12  cat /tmp/jenkins
   13  ip addr
   14  ip addr | grep inet
   15  cat /tmp/jenkins
   16  ssh-keygen -t ed25519 -f  /tmp/jenkins
   17  runuser -l jenkins -c 'cat /tmp/jenkins.pub >> /var/lib/jenkins/.ssh/authorized_keys'
   18  vim /tmp/jenkins
   19  history
```