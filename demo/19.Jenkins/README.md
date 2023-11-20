## Vagrant master

```ruby
$script = <<-SCRIPT
apt update && apt upgrade -yqq && apt install -yqq openjdk-11-jdk wget git curl
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | tee   /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]   https://pkg.jenkins.io/debian-stable binary/ | tee   /etc/apt/sources.list.d/jenkins.list > /dev/null
apt update && apt install -yqq jenkins
service jenkins stop
#####################################
echo 'JAVA_ARGS="-Djenkins.install.runSetupWizard=false"' >> /etc/default/jenkins
rm -rf /var/lib/jenkins/init.groovy.d && mkdir /var/lib/jenkins/init.groovy.d
cp -v /vagrant/01_AuthorizationStrategy.groovy /var/lib/jenkins/init.groovy.d/
cp -v /vagrant/02_addUser.groovy /var/lib/jenkins/init.groovy.d/
service jenkins start
sleep 1m
####################################
JENKINSPWD=$(cat /var/lib/jenkins/secrets/initialAdminPassword)
rm -f jenkins_cli.jar.*
wget -q http://localhost:8080/jnlpJars/jenkins-cli.jar
while IFS= read -r line
do
  list=$list' '$line
done < /vagrant/jenkinsPlugins.txt
java -jar ./jenkins-cli.jar -auth admin:$JENKINSPWD -s http://localhost:8080 install-plugin $list
service jenkins restart
sleep 1m
####################################
runuser -l jenkins -c 'echo -e "\n\n\n" | ssh-keygen -t rsa'
runuser -l jenkins -c 'cat ~/.ssh/id_rsa'
runuser -l jenkins -c 'cat ~/.ssh/id_rsa.pub'
echo "Master ready!"
SCRIPT


Vagrant.configure("2") do |config|
    config.vm.box = "bento/ubuntu-20.04"
    config.vm.define "Jenkins"
    config.vm.network "public_network", ip: "192.168.1.200",  bridge: "eno1" ## TO CHANGE
    config.vm.provider "virtualbox" do |v|
      v.memory = 4096
      v.cpus = 4
    end
    config.vm.provision "shell",
        inline: $script
end
```

```bash
apt update && apt upgrade -yqq && apt install -yqq openjdk-11-jdk wget git curl
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | tee   /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]   https://pkg.jenkins.io/debian-stable binary/ | tee   /etc/apt/sources.list.d/jenkins.list > /dev/null
apt update && apt install -yqq jenkins
service jenkins stop
#####################################
echo 'JAVA_ARGS="-Djenkins.install.runSetupWizard=false"' >> /etc/default/jenkins
rm -rf /var/lib/jenkins/init.groovy.d && mkdir /var/lib/jenkins/init.groovy.d
cp -v ./01_AuthorizationStrategy.groovy /var/lib/jenkins/init.groovy.d/
cp -v ./02_addUser.groovy /var/lib/jenkins/init.groovy.d/
service jenkins start
sleep 1m
####################################
JENKINSPWD=$(cat /var/lib/jenkins/secrets/initialAdminPassword)
rm -f jenkins_cli.jar.*
wget -q http://localhost:8080/jnlpJars/jenkins-cli.jar
while IFS= read -r line
do
  list=$list' '$line
done < ./jenkinsPlugins.txt
java -jar ./jenkins-cli.jar -auth admin:$JENKINSPWD -s http://localhost:8080 install-plugin $list
service jenkins restart
sleep 1m
####################################
runuser -l jenkins -c 'echo -e "\n\n\n" | ssh-keygen -t rsa'
runuser -l jenkins -c 'cat ~/.ssh/id_rsa'
runuser -l jenkins -c 'cat ~/.ssh/id_rsa.pub'
echo "Master ready!"
```

---

## Vagrant node

```ruby
$script = <<-SCRIPT
apt update && apt upgrade -yqq
apt install -yqq openjdk-11-jdk wget git curl
useradd -m -d /var/lib/jenkins jenkins
runuser -l jenkins -c 'mkdir /var/lib/jenkins/.ssh/'
runuser -l jenkins -c 'cat /tmp/authorized_keys >> /var/lib/jenkins/.ssh/authorized_keys'
chown jenkins:jenkins /var/lib/jenkins/.ssh/authorized_keys
chmod 600 /var/lib/jenkins/.ssh/authorized_keys
rm -f /tmp/authorized_keys
echo "Client done!"
SCRIPT

Vagrant.configure("2") do |config|
    config.vm.box = "bento/ubuntu-20.04"
    config.vm.define "Jenkins_node"
    config.vm.network "public_network", ip: "192.168.1.201",  bridge: "eno1" ## TO CHANGE
    config.vm.provision "file",
        source: "authorized_keys",
        destination: "/tmp/authorized_keys"
    config.vm.provision "shell",
        inline: $script
end
```

```bash
apt update && apt upgrade -yqq
apt install -yqq openjdk-11-jdk wget git curl
useradd -m -d /var/lib/jenkins jenkins
runuser -l jenkins -c 'mkdir /var/lib/jenkins/.ssh/'
runuser -l jenkins -c 'cat /tmp/authorized_keys >> /var/lib/jenkins/.ssh/authorized_keys'
chown jenkins:jenkins /var/lib/jenkins/.ssh/authorized_keys
chmod 600 /var/lib/jenkins/.ssh/authorized_keys
rm -f /tmp/authorized_keys
echo "Client done!"
```