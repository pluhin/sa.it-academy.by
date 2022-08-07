## Vagrantfile for Debian

```bash
Vagrant.configure("2") do |config|
  config.vm.box = "my-box"
  config.vm.network "forwarded_port", guest: 80, host: 8083
  config.vm.network "private_network", ip: "192.168.213.5"
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "1024"
    vb.cpus ="2"
  end

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y nginx vim wget curl
  SHELL
end
```
## Link VagrantCloud

[VagrantCloudForDebian](https://app.vagrantup.com/KirillNichiporov/boxes/05.Debian)

## Custom index.html for Debian

```bash
<html>
   <head>
      <title>
         Debian11
      </title>
   </head>
   <body>
      <h1>
         Custom index.html for Debian.
      </h1>
   </body>
</html>
```
![image](https://user-images.githubusercontent.com/110092772/183117031-fad3ae50-c92f-4259-9ad5-ad4513a5ba7e.png)

## Vagrantfile for Centos

```bash
Vagrant.configure("2") do |config|
  config.vm.box = "my-box"
  config.vm.network "forwarded_port", guest: 80, host: 8084
  config.vm.network "private_network", ip: "192.168.213.6"
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "1024"
    vb.cpus ="1"
  end

  config.vm.provision "shell", inline: <<-SHELL
    yum update
    yum install -y nginx vim wget curl
  SHELL
end
```

## Link VagrantCloud

[VagrantCloudForCentos](https://app.vagrantup.com/KirillNichiporov/boxes/05.Centos)

## Custom index.html for Debian

```bash
<html>
   <head>
      <title>
         Centos
      </title>
   </head>
   <body>
      <h1>
         Custom index.html for Centos.
      </h1>
   </body>
</html>
```

![image](https://user-images.githubusercontent.com/110092772/183282171-ffee905d-6ab2-47ee-92eb-7e17ad96a66b.png)
