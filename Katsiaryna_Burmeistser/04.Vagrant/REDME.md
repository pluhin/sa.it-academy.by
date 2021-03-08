# How to use this box with Vagrant:

### [Centos](https://app.vagrantup.com/apachy/boxes/centos8)

##### Vagrantfile

```
Vagrant.configure("2") do |config|
  config.vm.box = "apachy/centos8"
  config.vm.box_version = "1.0"
end

```

##### New

```
vagrant init apachy/centos8 \
  --box-version 1.0
vagrant up

```

### [Debian](https://app.vagrantup.com/apachy/boxes/debian11)

##### Vagrantfile

```
Vagrant.configure("2") do |config|
  config.vm.box = "apachy/debian11"
  config.vm.box_version = "1.0"
end

```

##### New

```
vagrant init apachy/debian11 \
  --box-version 1.0
vagrant up

```