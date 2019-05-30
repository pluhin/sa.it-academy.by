# Home work 08.Jenkins_start
### Deployment Jenkins using Ansible and Vagrant
- Ancible
```
[root@localhost 08.jenkins_start]# ansible-playbook -i inv.yaml play.yaml

PLAY [jenkins] *****************************************************************

TASK [Gathering Facts] *********************************************************
Friday 24 May 2019  18:35:44 -0400 (0:00:00.066)       0:00:00.066 ************
ok: [jenkins]

TASK [jenkins : Install packages for jenkins and nginx] ************************
Friday 24 May 2019  18:35:46 -0400 (0:00:02.390)       0:00:02.456 ************
ok: [jenkins]

TASK [jenkins : add repo] ******************************************************
Friday 24 May 2019  18:36:33 -0400 (0:00:46.685)       0:00:49.141 ************
ok: [jenkins]

TASK [jenkins : add key] *******************************************************
Friday 24 May 2019  18:36:35 -0400 (0:00:01.970)       0:00:51.112 ************
ok: [jenkins]

TASK [jenkins : install jenkins] ***********************************************
Friday 24 May 2019  18:36:42 -0400 (0:00:06.565)       0:00:57.678 ************
ok: [jenkins]

TASK [jenkins : start jenkins] *************************************************
Friday 24 May 2019  18:37:01 -0400 (0:00:19.046)       0:01:16.724 ************
ok: [jenkins]

TASK [jenkins : Wait for the file] *********************************************
Friday 24 May 2019  18:37:03 -0400 (0:00:02.461)       0:01:19.186 ************
ok: [jenkins]

TASK [jenkins : pass] **********************************************************
Friday 24 May 2019  18:37:04 -0400 (0:00:00.755)       0:01:19.941 ************
changed: [jenkins]

TASK [jenkins : pass for jenkins] **********************************************
Friday 24 May 2019  18:37:04 -0400 (0:00:00.671)       0:01:20.612 ************
ok: [jenkins] => {
    "msg": "e45069216c2546fc8ac0f2dbb3f97c92"
}

TASK [jenkins : nginix install] ************************************************
Friday 24 May 2019  18:37:05 -0400 (0:00:00.063)       0:01:20.676 ************
ok: [jenkins]

TASK [jenkins : nginx start] ***************************************************
Friday 24 May 2019  18:37:12 -0400 (0:00:07.546)       0:01:28.223 ************
ok: [jenkins]

TASK [jenkins : Firewall] ******************************************************
Friday 24 May 2019  18:37:14 -0400 (0:00:01.560)       0:01:29.783 ************
ok: [jenkins]

TASK [jenkins : Configure Nginx] ***********************************************
Friday 24 May 2019  18:37:16 -0400 (0:00:02.745)       0:01:32.529 ************
ok: [jenkins]

TASK [jenkins : nginx restart] *************************************************
Friday 24 May 2019  18:37:18 -0400 (0:00:01.512)       0:01:34.041 ************
changed: [jenkins]

PLAY RECAP *********************************************************************
jenkins                    : ok=14   changed=2    unreachable=0    failed=0
```
- Vagrant
```
Vagrant.configure("2") do |config|
    config.vm.box = "centos/7"
    config.vm.define "Jenkins"
    config.vm.network "public_network", ip: "192.168.100.22",  bridge: "eth2"
    config.vm.provision :shell, :path => "bootstrap.sh"
end
```
