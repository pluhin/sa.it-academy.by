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

  tasks:
    - name: Add nginx to jenkins group
      shell: |
        usermod -aG jenkins nginx

    - name: Set httpd_can_network_connect
      shell: |
        setsebool -P httpd_can_network_connect 1

    - name: Register Jenkins initial password
      shell: cat /var/lib/jenkins/secrets/initialAdminPassword
      register: key

    - name: Show Jenkins password
      debug:
        msg: "{{ key.stdout }}"

```
![Add user ]()

![Slack_module]()
