```bash
    1  apt update
    2  apt upgrade -y
    3  apt install -y vim mc git bash-completion
    4  id
    5  apt updat -y
    6  apt update -y
    7  apt install -y vim mc git bash-completion
    8  apt install -yqq openjdk-17-jre
    9  useradd -m -d /var/lib/jenkins jenkins
   10  runuser -l jenkins -c 'mkdir /var/lib/jenkins/.ssh/'
   11  ls  -l /var/lib/jenkins/
   12  ls  -l /var/lib/
   13  ls  -l /var/lib/jenkins/
   14  ls  -l /var/lib/jenkins/ -a
   15  ssh-keygen -t ed25519 -f /tmp/jenkins
   16  runuser -l jenkins -c 'cat /tmp/jenkins.pub >> /var/lib/jenkins/.ssh/authorized_keys'
   17  chmod 600 /var/lib/jenkins/.ssh/authorized_keys
   18  cat /tmp/jenkins
   19  ip addr
   20  ip addr | grep 192
   21  history
```