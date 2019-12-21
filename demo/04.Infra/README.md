```bash
3474  clear
 3475  vagrant --version
 3476  VirtualBox --version
 3477  VirtualBox -V
 3478  VBox -h
 3479  VBox
 3480  echo $(vboxmanage --version)
 3481  cd sa2-10-19
 3482  ls
 3483  cd ../
 3484  ls
 3485  cd /tmp
 3486  ls
 3487  cd sa.it-academy.by
 3488  git pull
 3489  cd demo
 3490  ls
 3491  mkdir 04.Infra
 3492  cd 04.Infra
 3493  mkdir vagrant{1..5}
 3494  ls
 3495  cd vagrant1
 3496  vagrant init centos/7
 3497  ls -la
 3498  vim Vagrantfile
 3499  vagrant up
 3500  vagrant ssh
 3501  ls
 3502  cd ../vagrant2
 3503  vagrant init hashicorp/precise64
 3504  cd ../
 3505  cd vagrant1
 3506  vagrant global-status
 3507  ls -la
 3508  cd .vagrant
 3509  ls
 3510  du -sh *
 3511  ls -la
 3512  ls ~/VirtualBox\ VMs/s -l
 3513  ls ~/VirtualBox\ VMs -l
 3514  cd  ./
 3515  cd ../
 3516  ls
 3517  vagrant halt && vagrant destroy
 3518  ls ~/VirtualBox\ VMs -l
 3519  ls -la
 3520  cd ../vagrant2
 3521  ls
 3522  vim Vagrantfile
 3523  vagrant up
 3524  vagrant global-status
 3525  vagrant ssh
 3526* cd /tmp/sa.it-academy.by/demo/04.Infra/vagrant3
 3527* vim Vagrantfile
 3528* vagrant up
 3529  vagrant package --output test.box
 3530* vim Vagrantfile
 3531* ping 192.168.1.235
 3532* curl  http://192.168.1.235
 3533* ssh vagrant@192.168.1.235
 3534* vagrant ssh
 3535* ssh vagrant@192.168.1.235
 3536* vagrant halt && vagrant destroy -f
 3537  vagrant cloud publish --release pluhin/test_box virtualbox test.box
 3538  vagrant plugin update
 3539  vagrant plugin uininstall cloud
 3540  vagrant plugin uninstall cloud
 3541  vagrant cloud publish --release pluhin/test 1.0 virtualbox test.box
 3542* cd ../vagrant4
 3543* ls
 3544* vim Vagrantfile
 3545* date > file.txt
 3546* cat file.txt
 3547* vagrant up
 3548  vagrant cloud publish --release pluhin/test 1.0 virtualbox test.box
 3549* vagrant ssh
 3550* vagrant halt && vagrant destroy -f
 3551* cd ../
 3552* du -sh *
 3553* cd vagrant5
 3554* vim Vagrantfile
 3555* cd ../
 3556* mkdir vagrant6
 3557* vim Vagrantfile
 3558  cd
 3559  cd /tmp/sa.it-academy.by/demo/04.Infra
 3560  mkdir lxc
 3561  cd lxc
 3562  lxc-ls
 3563  vim config.conf
 3564  vagrant global-status
 3565  cd ../vagrant2
 3566  vagrant halt && vagrant destroy -f
 3567  cd ../lxc
 3568  vim /etc/sysconfig/network-scripts/ifcfg-em1
 3569  sudo vim /etc/sysconfig/network-scripts/ifcfg-em1
 3570  sudo vim /etc/sysconfig/network-scripts/ifcfg-br0
 3571  sudo vim /etc/sysconfig/network-scripts/ifcfg-em1
 3572  lxc-checkconfig
 3573  vim config.conf
 3574  sudo lxc-create -t download -f confconfig.conf -n centos_plu -- --dist centos --release 7 --arch amd64
 3575  sudo lxc-start -n centos_plu -d
 3576  sudo lxc-ls -f
 3577  sudo lxc-ls
 3578  sudo lxc-ls -f
 3579  ping 192.168.233
 3580  ping 192.168.1.233
 3581  sudo lxc-attach -n ceos_plu
 3582  sudo lxc-attach -n cenos_plu
 3583  sudo lxc-attach -n centos_plu
 3584  sudo lxc-stop -n centos_plu && sudo lxc-destroy -n centos_plu
 3585  sudo lxc-create -t download -f coconfig.conf -n centos_plu -- --dist centos --release 7 --arch amd64
 3586  sudo lxc-start -n centos_plu -d
 3587  sudo lxc-ls -f
 3588  ls
 3589  sudo lxc-stop -n centos_plu && sudo lxc-destroy -n centos_plu
 3590  vim config.conf
 3591  sudo lxc-create -t download --n centos_plu -- --dist centos --release 7 --arch amd64 -f config.conf
 3592  sudo lxc-create -t download - -f config.conf -n centos_plu -- --dist centos --release 7 --arch amd64 -
 3593  sudo lxc-start -n centos_plu -d
 3594  sudo lxc-ls -f
 3595  history
 3596  sudo lxc-attach -n centos_plu
 3597  sudo -i
 3598  sudo lxc-attach -n centos_plu
 3599  sudo lxc-starop -n centos_plu
 3600  sudo lxc-stop -n centos_plu
 3601  sudo lxc-start -n centos_plu -d
 3602  sudo lxc-attach -n centos_plu
 3603  sudo lxc-start -n centos_plu -d
 3604  sudo lxc-attach -n centos_plu
 3605  ssh root@192.168.233
 3606  telnet 192.168.233
 3607  telnet 192.168.1.233
 3608  telnet 192.168.1.233 22
 3609  ping 192.168.1.233
```
