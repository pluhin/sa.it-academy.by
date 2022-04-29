# Vagrant

```bash
 2965  cd ../
 2966  mkdir 05.Vagrant
 2967  cd 05.Vagrant
 2968  mkdir {1..6}
 2969  ls -l
 2970  vagrant --version
 2971  VBoxManage --version
 2972  cd 1
 2973  vagrant init centos/8
 2974  ls -l
 2975  vim Vagrantfile
 2976  vagrant up
 2977  vagrant ssh
 2978  vagrant status
 2979  vagrant global-status
 2980  pwd
 2981  vagrant halt && vagrant destroy -f
 2982  cd 2
 2983  cd ../2
 2984  ls -l
 2985  vim Vagrantfile
 2986  ls -la ~/.vagrant.d/boxes/ubuntu-VAGRANTSLASH-bionic64/20220117.0.0/virtualbox/
 2987  ls -la ~/.vagrant.d/boxes/ubuntu-VAGRANTSLASH-bionic64/20220117.0.0/virtualbox/ -h
 2988  vagrant up
 2989  curl -I 127.0.0.1:8083
 2990  curl -I 127.0.0.1:8084
 2991  curl -S 127.0.0.1:8083
 2992  vagrant ssh host1
 2993  vagrant ssh host2
 2994  vagrant halt && vagrant destroy -f
 2995  cd ../3
 2996  vim Vagrantfile
 2997  ping 192.168.1.244
 2998  ifconfig
 2999  vagrant up
 3000  ping 192.168.1.244
 3001  ssh vagrant@192.168.1.244
 3002  vagrant halt && vagrant destroy -f
 3003  cd ../4
 3004  vim Vagrantfile
 3005  vagrant up
 3006  vagrant ssh
 3007  vagrant halt && vagrant destroy -f
 3008  cd ../5
 3009  vim Vagrantfile
 3010  ping 192.168.1.50
 3011  cd ../6
 3012  vagrant init bento/ubuntu-20.04
 3013  vagrant up && vagrant ssh
 3014  vagrant package --output /tmp/my_image.box
 3015  ls -lh /tmp/my_image.box
 3016  vagrant cloud publish --release pluhin/demo_vagrant 1.0.0 virtualbox /tmp/my_image.box
```

## Result of push vagrant box to vagrant cloud

```bash
05.Vagrant/6 [ vagrant cloud publish --release pluhin/demo_vagrant 1.0.0 virtualbox /tmp/my_image.box                   md-sa2-20-22 * ] 7:48 PM
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
Created:          2022-04-28T19:47:19.602+02:00
Updated:          2022-04-28T19:47:19.602+02:00
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