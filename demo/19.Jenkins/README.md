
```bash
ssh -L 8080:127.0.0.1:8080 user@192.168.204.85 -f -N

# 192.168.204.85 - IP of jenkins master

## Do not use, it is example:
 ssh -L 13389:192.168.204.XX:3389 jump_sa@178.124.206.53 -p 32510 -f -N

 localhost:13389
```

## Install nodes packages

```bash
apt update && apt upgrade -yqq
apt install -yqq openjdk-17-jre wget git curl
useradd -m -d /var/lib/jenkins jenkins
runuser -l jenkins -c 'mkdir /var/lib/jenkins/.ssh/'
runuser -l jenkins -c 'cat /tmp/authorized_keys >> /var/lib/jenkins/.ssh/authorized_keys'
chown jenkins:jenkins /var/lib/jenkins/.ssh/authorized_keys
chmod 600 /var/lib/jenkins/.ssh/authorized_keys
rm -f /tmp/authorized_keys
echo "Client done!"
```

> `/tmp/authorized_keys` - file with public key from master