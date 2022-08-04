## urls to vagrant boxes 

(debian)[https://app.vagrantup.com/alexv8288/boxes/deb11]

(centos)[https://app.vagrantup.com/alexv8288/boxes/cent8]

## Vagrantfile

```bash
$provisioning_centos = <<-SCR
cd /etc/yum.repos.d/
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
yum update
yum install -y vim git wget curl nginx
systemctl enable nginx
systemctl start nginx

cat << EOF > /usr/share/nginx/html/index.html
<!DOCTYPE html>
<html>
<head>
<title>Hello!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Hello world!</h1>
</body>
</html>
EOF

SCR

$provisioning_debian = <<-SCR
apt-get update
apt-get install -yqq vim git wget curl nginx
systemctl enable nginx
systemctl start nginx

cat << EOF > /var/www/html/index.nginx-debian.html
<!DOCTYPE html>
<html>
<head>
<title>Hello!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Hello world!</h1>
</body>
</html>
EOF

SCR


Vagrant.configure("2") do |config|

  config.vm.define "centos" do |centos|
    centos.vm.box = "centos/8"
    centos.vm.network "forwarded_port", guest: 80, host: 8082
    centos.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = "4"
    end
    centos.vm.provision "shell", inline: $provisioning_centos
  
  end


  config.vm.define "debian" do |debian|
    debian.vm.box = "debian11"
    debian.vm.network "forwarded_port", guest: 80, host: 8081
    debian.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = "4"
    end
    debian.vm.provision "shell", inline: $provisioning_debian
    end
  end
```

## How-to run

```bash
vagrant init alexv8288/deb11 \
  --box-version 1.0.0
vagrant up
```

```bash
vagrant init alexv8288/cent8 \
  --box-version 1.0.0
vagrant up
```