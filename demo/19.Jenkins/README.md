## Node install

```bash
    1  apt update
    2  apt upgrade -y
    3  apt install -y vim mc git bash-completion
    4  apt update
    5  apt install -yqq vim mc git bash-completion
    6  apt install -yqq openjdk-17-jre wget git curl
    7  clear
    8  useradd -m -d /var/lib/jenkins jenkins
    9  runuser -l jenkins -c 'mkdir /var/lib/jenkins/.ssh/'
   10  ssh-keygen -t ed25519 -f /tmp/jenkins
   11  runuser -l jenkins -c 'cat /tmp/jenkins.pub >> /var/lib/jenkins/.ssh/authorized_keys'
   12  ls -l /var/lib/jenkins/.ssh/authorized_keys
   13  chmod 600 /var/lib/jenkins/.ssh/authorized_keys
   14  ls -l /var/lib/jenkins/.ssh/authorized_keys
   15  vim /var/lib/jenkins/.ssh/authorized_keys
   16  vim /tmp/jenkins
   17  cat /tmp/jenkins
   18  ip addr
   19  history
```