## Vagrant

```bash
 4048  git pull
 4049  mkdir 05.Vagrant
 4050  cd 05.Vagrant
 4051  mkdir {1..6}
 4052  cd 1
 4053  vagrant init centos/8
 4054  ls
 4055  vim Vagrantfile
 4056  vagrant up
 4057  vagrant status
 4058  vagrant global-status
 4059  vagrant ssh
 4060  vage
 4061  vagrant halt && vagrant destroy -f
 4062  mc
 4063* 6
 4064  vagrant global-status
 4065  cd ../2
 4066  ls
 4067  vim Vagrantfile
 4068  vagrant up
 4069  vagrant global-status
 4070  vagrant ssh host1
 4071  vagrant ssh host2
 4072  vagrant halt && vagrant destroy -f
 4073  cd ../3
 4074  ls
 4075  vim Vagrantfile
 4076  vagrant up
 4077  vagrant global-status
 4078  ssh vagrant@192.168.1.244
 4079  vagrant halt && vagrant destroy -f
 4080  cd ../4
 4081  vim Vagrantfile
 4082  vagrant up
 4083* clear
 4084* nettop
 4085* htop
 4086* brew install htop
 4087  vagrant ssh
 4088  vagrant halt && vagrant destroy -f
 4089  cd ../5
 4090  vim Vagrantfile
 4091  cd ../6
 4092  ls
 4093  vagrant init bento/ubuntu-20.04
 4094  vagrant up && vagrant ssh
 4095  vagrant package --output /tmp/my_image.box
 4096  ls -l /tmp/my_image.box
 4097  ls -l /tmp/my_image.box -h
 4098  ls -lh /tmp/my_image.box
 4099  vagrant cloud publish --release pluhin/demo_vagrant 1.0.0 virtualbox /tmp/my_image.box
```


## Result of push vagrant box to vagrant cloud

```bash
05.Vagrant/6 [ vagrant cloud publish --release pluhin/demo_vagrant 1.0.0 virtualbox /tmp/my_image.box                   md-sa2-21-22 * ] 7:30 PM
You are about to publish a box on Vagrant Cloud with the following options:
pluhin/demo_vagrant:   (v1.0.0) for provider 'virtualbox'
Automatic Release:     true
Do you wish to continue? [y/N]y
Saving box information...
Uploading provider with file /tmp/my_image.box
Releasing box...
Complete! Published pluhin/demo_vagrant
Box:              pluhin/demo_vagrant
Description:
Private:          no
Created:          2022-08-04T19:23:26.543+02:00
Updated:          2022-08-04T19:23:26.543+02:00
Current Version:  N/A
Versions:         1.0.0
Downloads:        0
```

## Prepare Vagrant box

```bash
sudo -i
apt-get update && apt-get upgrade -yqq && apt-get install vim mc git wget -yqq
rm -rf /var/lib/apt/lists/*  /tmp/*  /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base
cat /dev/null > ~/.bash_history && history -c && exit
```