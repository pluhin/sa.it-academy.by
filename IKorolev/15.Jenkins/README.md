# 15.Jenkis.Start

# Vagrantfile
```
Vagrant.configure("2") do |config|
    config.vm.box = "centos/7"
    config.vm.define "Jenkins"
    config.vm.network "public_network", ip: "192.168.100.84:8080",  bridge: "eno1"
    config.vm.provision "ansible" do |ansible|
      ansible.playbook = "play.yaml"
    end
end

``` 

# Play.yaml
```
- hosts: Jenkins
  gather_facts: no
  become: yes
  roles:
    - jenkins
    - nginx

```
![Add user ](https://github.com/Korolev731/sa.it-academy.by/blob/md-sa2-16-21/IKorolev/15.Jenkins/2.jpg)

![Slack_module](https://github.com/Korolev731/sa.it-academy.by/blob/md-sa2-16-21/IKorolev/15.Jenkins/1.jpg)
