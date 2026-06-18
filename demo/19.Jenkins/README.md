```bash
    6  apt install -yqq openjdk-17-jre
    7  useradd -m -d /var/lib/jenkins jenkins
    8  runuser -l jenkins -c 'mkdir /var/lib/jenkins/.ssh/'
    9  ls  -l /var/lib/jenkins/
   10  ls  -l /var/lib/jenkins/ -la
   11  ssh-keygen -t ed25519 -f /tmp/jenkins
   12  runuser -l jenkins -c 'cat /tmp/jenkins.pub >> /var/lib/jenkins/.ssh/authorized_keys'
   13  chmod 600 /var/lib/jenkins/.ssh/authorized_keys
   14  cat /tmp/jenkins
   15  ip addr  | grep inet
   16  history
   17  ip addr  | grep inet
   18  cat /tmp/jenkins
   19  apt remove openjdk-17-jre
   20  apt update
   21  apt install -y openjdk-21-jdk
   22  history
```