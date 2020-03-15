```bash
  741  ls
  742  cd lxc
  743  mkdfir lxc
  744  mkdir lxc
  745  cd lxc
  746  ls
  747  sudo apt-get install lxc lxc-templates
  748  sudo lxc-checkconfig
  749  /usr/share/lxc/templates/lxc-download -l
  750  lxc-create -t download -n test-centos -- --dist centos --release 8 --arch amd64
  751  sudo lxc-create -t download -n test-centos -- --dist centos --release 8 --arch amd64
  752  sudo lxc-start -n test-centos -d
  753  sudo lxc-ls 0f
  754  sudo lxc-ls -f
  755  ping 10.0.3.53
  756  sudo lxc-attach -n test-centos
  757  nano /var/lib/lxc
  758  cd /var/lib/lxc
  759  sudo cd /var/lib/lxc
  760  cd /var/lib/lxc
  761  cd /var/
  762  cd lib
  763  ;s
  764  ls
  765  cd lxc
  766  nano lxc
  767  sudo cd lxc
  768  su
  769  cd ..
  770  cd ,,
  771  cd ..
  772  ;s
  773  ls
  774  cd home
  775  ls
  776  cd courses
  777  ls
  778  cd lxc
  779  los
  780  ls
  781  ls -l
  782  sudo lxc-attach -n test-centos
  783  sudo lxc-attach -n test-centos --mkdir -p /root/.ssh
  784  sudo lxc-attach -n test-centos -- mkdir -p /root/.ssh
  785  cat  ~/.ssh/id_rsa.pub | sudo lxc-attach -n ub18 -- /bin/sh -c "/bin/cat >> /root/.ssh/authorized_keys"
  786  cat  ~/.ssh/id_rsa.pub | sudo lxc-attach -n test-centos -- /bin/sh -c "/bin/cat >> /root/.ssh/authorized_keys"
  787  ssh root@
  788  ssh root@10.0.3.53
  789  sudo ssh root@10.0.3.53
  790  sudo ssh root@10.0.3.53:22
  791  cat ~/.ssh/id_rsa.pub
  792  ls
  793  sudo lxc-attach -n test-centos
  794  sudo lxc-attach -n test-centos -- yum install open-ssh
  795  sudo lxc-attach -n test-centos -- yum install openssh-client
  796  sudo lxc-attach -n test-centos -- yum install git
  797  sudo lxc-attach -n test-centos -- yum install openssh-server
  798  sudo ssh root@10.0.3.53
  799  sudo lxc-attach -n test-centos -- systectl status sshd
  800  sudo lxc-attach -n test-centos
  801  sudo ssh root@10.0.3.53
  802  sudo lxc-attach -n test-centos -- adduser updater && echo "vagrant" | passwd updater --stdin
  803  sudo lxc-attach -n test-centos -- adduser updater
  804  sudo lxc-attach -n test-centos -- echo "vagrant" | passwd updater --stdin
  805  echo "vagrant" | udo lxc-attach -n test-centos -- passwd updater –stdi
  806  echo "vagrant" | sudo lxc-attach -n test-centos -- passwd updater –stdi
  807  echo "vagrant" | sudo lxc-attach -n test-centos -- passwd updater –stdin
  808  echo "vagrant" | sudo lxc-attach -n test-centos -- /bin/sh -c "/bin/echo  passwd updater --stdin"
  809  echo "vagrant" | sudo lxc-attach -n test-centos -- /bin/sh -c "/bin/echo >>  passwd updater --stdin"
  810  sudo ssh root@10.0.3.53
  811  sudo lxc-attach -n test-centos
  812  sudo lxc-attach -n test-centos -- echo "updater ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/updater
  813  sudo lxc-attach -n test-centos
  814  sudo lxc-attach -n test-centos --mkdir -p /insider/.ssh
  815  sudo lxc-attach -n test-centos -- mkdir -p /root/.ssh
  816  sudo lxc-attach -n test-centos -- mkdir -p /insider/.ssh
  817  cat  ~/.ssh/id_rsa.pub | sudo lxc-attach -n test-centos -- /bin/sh -c "/bin/cat >> /insider/.ssh/authorized_keys"
  818  ssg
  819  ssh insider@10.0.3.53
  820  sudo lxc-attach -n test-centos -- sudo usermod -aG wheel insider
  821  sudo lxc-attach -n test-centos -- usermod -aG wheel insider
  822  ssh insider@10.0.3.53
  823  ssh root@10.0.3.53
  824  ssh insider@10.0.3.53
  825  ssh root@10.0.3.53
  826  sudo lxc-attach -n test-centos -- sudo -H  -u insider /bin/sh -c 'cd; /bin/bash'
  827  sudo lxc-attach -n test-centos -- sudo -S  -u insider /bin/sh -c 'cd; /bin/bash'
  828  ssh root@10.0.3.53
  829  sudo lxc-attach -n test-centos -- sudo -S -u insider /bin/sh -c 'cd; /bin/bash'
  830  sudo lxc-attach -n test-centos -- -u insider /bin/sh -c 'cd; /bin/bash'
  831  sudo lxc-attach -n test-centos
  832  pwd
  833  pwd insider
  834  pwd -n insider
  835  /etc/passwd
  836  sudp /etc/passwd
  837  sudo /etc/passwd
  838  sudo cat /etc/passwd
  839  sudo lxc-attach -n test-centos
  840  sudo lxc-stop -n test-centos
  841  sudo lxc-start -d -n test-centos
  842  sudo lxc-attach -n test-centos
  843  wget http://lxc-webpanel.github.io/tools/install.sh -O - | sudo bash
  844  ifconfig
  845  ls
  846  ssh root@10.0.3.53
  847  sudo lxc-stop -n test-centos
  848  sudo lxc-start -d -n test-centos
  849  sudo lxc-checkconfig -d -n test-centos
  850  sudo lxc-attach -n test-centos
  851  lsx extc test -- bash
  852  lxc exec   test -- bash
  853  sudo lxc-attach -n test-centos -- useradd -ou 0 -g 0
  854  sudo lxc-attach -n test-centos -- useradd -ou 0 -g 0 test-01
  855  sudo lxc-attach -n test-centos
  856  sudo lxc-attach -n test-centos -- useradd -p -ou 0 -g 0 test-01
  857  sudo lxc-attach -n test-centos -- useradd -oup 0 -g 0 test-01
  858  sudo lxc-attach -n test-centos -- useradd -ou 0 -g 0 test-02 | echo "vagrant" | passwd test-02 --stdin
  859  ls
  860  sudo lxc-attach -n test-centos
  861  lsx --version
  862  lxc-ls --fancy
  863  lxc-info
  864  lxc-info -n
  865  lxc-info --version
  866  nao lxc.conf
  867  naon lxc.conf
  868  nano lxc.conf
  869  cat /etc/lxc/default.conf
  870  sudo lsx list
  871  sudo lxc list
  872  sudo lxc-list
  873  free -h
  874  sudo lxc-attach -n test-centos
  875  nano lxc.conf
  876  ifconfig
  877  sudo lxc-create -t download -f lxc.conf -n centos-2 -- --release 8 --arch amd64
  878  sudo lxc-create -t download -n -f lxc.conf test-centos2 -- --dist centos --release 8 --arch amd64
  879  sudo lxc-start -d -n test-centos2
  880  sudo lxc-ls -f
  881  sudo lxc-stop -n test-centos2
  882  sudo lxc-stop -n test-centos
  883  sudo lxc-create -t download -f lxc.conf -n centos8 -- --dist centos --release 8 --arch amd64
  884  sudo lxc-start -d -n centos8
  885  sudo lxc-ls -f
  886  sudo lxc-stop -n centos8
  887  cat /etc/lxc/default.conf
  888  nano lxc.conf
  889  ifconfig
  890* sudo lxc-stop -n centos8
  891* sudo lxc-ls -f
  892* lxc-destroy --name centos8
  893* sudo lxc-destroy --name centos8
  894* sudo lxc-ls -f
  895* sudo lxc-destroy --name test-centos
  896* sudo lxc-ls -f
  897* sudo lxc-create -t download -f lxc.conf -n centos8 -- --dist centos --release 8 --arch amd64
  898* sudo lxc-ls -f
  899* sudo lxc-stop -n centos8
  900* sudo lxc-start -n centos8
  901* sudo lxc-ls -f
  902* ping 192.168.100.239
  903* sudo lxc-attach -n centos8
  904* nano lxc.conf
  905* sudo lxc-stop -n centos8
  906* sudo lxc-destroy --name centos8
  907* sudo lxc-create -t download -f lxc.conf -n centos8 -- --dist centos --release 8 --arch amd64
  908* sudo lxc-start -n centos8
  909* ping 192.168.100.239
  910* lxc-ls -f
  911* sudo lxc-ls -f
  912* sudo lxc-attach -n centos8
  913* cd /var/lib/lxc
  914* sudo cd /var/lib/lxc
  915* nano /etc/lxc/default.conf
  916* nano lxc.conf
  917* sudo lxc-stop -n centos8
  918* sudo lxc-destroy -n centos8
  919* sudo lxc-create -t download -f lxc.conf -n centos8 -- --dist centos --release 8 --arch amd64
  920* sudo lxc-attach -n centos8
  921* sudo lxc-start -n centos8
  922  sudo lxc-ls -f
  923  sudo lxc-destroy -f
  924  sudo lxc-destroy -f -n centos8
  925  nano lxc.conf
  926  sudo lxc-create -t download -f lxc.conf -n centos8 -- --dist centos --release 8 --arch amd64
  927* sudo lxc-start -n centos8
  928* sudo lxc-ls -f
  929* ping 192.168.100.239
  930  sudo lxc-attach -n centos8
  931* ping 192.168.100.239
  932* sudo lxc-ls -f
  933* ping 192.168.100.250
  934* sudo lxc-attach -n centos8
  935* nano lxc.conf
  936* sudo lxc-attach -n centos8
  937* free
  938* free -h
  939* sudo lxc-attach -n centos8
  940* nano lxc.conf
  941* sudo lxc-stop -n centos8
  942* sudo lxc-destroy -n centos8
  943* nano lxc.conf
  944  nano /etc/lxc/default.conf
  945* sudo lxc-create -t download -f lxc.conf -n centos8 -- --dist centos --release 8 --arch amd64
  946* sudo lxc-start -n centos8
  947* free -h
  948* sudo lxc-attach -n centos8
  949* sudo lxc-ls -f
  950* ping 10.0.3.217
  951* nano lxc.conf
  952* sudo lxc-start -n centos8
  953* sudo lxc-stop -n centos8 && sudo lxc-destroy -n centos8
  954* nano lxc.conf
  955* sudo lxc-create -t download -f lxc.conf -n centos8 -- --dist centos --release 8 --arch amd64
  956* free -h
  957* sudo lxc-start -n centos8
  958* sudo lxc-attach -n centos8
  959* sudo lxc-stop -n centos8
  960* sudo lxc-start -n centos8
  961* sudo lxc-stop -n centos8 && sudo lxc-destroy -n centos8
  962* sudo lxc-ls -f
  963* sudo lxc-stop -n centos8 | sudo lxc-destroy -n centos8
  964* sudo lxc-ls -f
  965* sudo lxc-create -t download -f lxc.conf -n centos8 -- --dist centos --release 8 --arch amd64
  966* free -h
  967* sudo lxc-start -n centos8
  968* sudo lxc-ls -f
  969* sudo lxc-destroy -n centos8
  970* nano lxc.conf
  971* sudo lxc-create -t download -f lxc.conf -n centos8 -- --dist centos --release 8 --arch amd64
  972* sudo lxc-start -n centos8
  973* sudo lxc-destroy -n centos8
  974* sudo lxc-create -t download -f lxc.conf -n centos8 -- --dist centos --release 8 --arch amd64
  975* sudo lxc-start -n centos8
  976* sudo lxc-destroy -n centos8
  977* sudo lxc-start -n centos8
  978* nano lxc.conf
  979* sudo lxc-create -t download -f lxc.conf -n centos8 -- --dist centos --release 8 --arch amd64
  980* sudo lxc-start -n centos8
  981* sudo lxc-destroy -n centos8
  982* sudo lxc-ls -f
  983* nano lxc.conf
  984* sudo lxc-create -t download -f lxc.conf -n centos8 -- --dist centos --release 8 --arch amd64
  985* sudo lxc-start -n centos8
  986* sudo lxc-stop -n centos8
  987* sudo lxc-destroy -n centos8
  988* nano lxc.conf
  989* lxc-checkconfig
  990* ls
  991* cd lxc
  992* ls
  993* nano script
  994* chmod +x script
  995* ./script
  996* find cgroup
  997* find /cgroup
  998* sudo find /cgroup
  999* nano lxc.conf
 1000* cd ..
 1001* nano lxc.conf
 1002* sudo lxc-destroy -n centos8
 1003* sudo lxc-create -t download -f lxc.conf -n centos8 -- --dist centos --release 8 --arch amd64
 1004* sudo lxc-start -n centos8
 1005* sudo lxc-ls -f
 1006* ls
 1007* cd lxc
 1008* ls
 1009* nano script
 1010* ./script
 1011* nano script
 1012* cat /sys/fs/cgroup/unified/cpu.pressure
 1013* cat /sys/fs/cgroup/unified/memory.pressure
 1014* nano script
 1015* ./script
 1016* nano script
 1017* cat /sys/fs/cgroup/unified/cgroup.stat
 1018* cat /sys/fs/cgroup/unified/memory.pressure
 1019* sudo lxc-attach -n centos8
 1020* sudo lxc-stop -n centos8
 1021* sudo lxc-sto -n centos8
 1022* sudo lxc-destroy -n centos8
 1023* cd ..
 1024* nano lxc.conf
 1025* cat /sys/fs/cgroup/memory/system.slice/memory.usage_in_bytes 
 1026* nano lxc.conf
 1027* sudo lxc-create -t download -f lxc.conf -n centos8 -- --dist centos --release 8 --arch amd64
 1028* cat /sys/fs/cgroup/memory/system.slice/memory.usage_in_bytes 
 1029* sudo lxc-start -n centos8
 1030* cat /sys/fs/cgroup/memory/system.slice/memory.usage_in_bytes 
 1031* cd /sys/fs/cgroup/memory/system.slice/ 
 1032* ls
 1033* cat memory.limit_in_bytes
 1034* cat  memory.kmem.limit_in_bytes\n
 1035* cat memory.usage_in_bytes\n
 1036* cd ..
 1037* ls
 1038* cat memory.usage_in_bytes\n
 1039* cat memory.limit_in_bytes\n
 1040* sudo lxc-attach -n centos8
 1041* ls
 1042* cd ..
 1043* ls
 1044* lxc-config show centos8
 1045* lxc-config  centos8
 1046* lxc-config --help
 1047* lxc-config list all
 1048* lxc-config --list
 1049* lxc-config -l
 1050* lxc-config lxc.group.use
 1051* lxc-config -l lxc.group.use
 1052* ls
 1053* cd ..
 1054* c d..
 1055* cd ..
 1056* ls
 1057* nano lxc.conf
 1058* cd ~
 1059* ls
 1060* nano lxc.conf
 1061* ls
 1062* sudo lxc-cgroup -n centos8 memory.limit_in_bytes "512M"
 1063* cat /proc/cgroups
 1064* sudo lxc-attach -n centos8
 1065* nano lxc.conf
 1066* nano lxc.conf2
 1067* lxc-destroy --name centos8
 1068* lxc-create -t download -n test-debian -- --dist debian --release 10 --arch amd64
 1069* sudo lxc-create -t download -n test-debian -- --dist debian --release 10 --arch amd64
 1070* /usr/share/lxc/templates/lxc-download -l
 1071* sudo lxc-create -t download -n test-debian -- --dist debian --release jessie --arch amd64
 1072* sudo lxc-attach -n test-debian
 1073* sudo lxc-start -n test-debian
 1074* sudo lxc-attach -n test-debian
 1075* sudo lxc-attach -n test-centos -- useradd -ou 0 -g 0 test-03 | echo "test-03:vagrant" | sudo chpasswd
 1076* sudo lxc-attach -n test-centos -- useradd -ou 0 -g 0 test-03 | echo "test-03:vagrant" | chpasswd
 1077* sudo lxc-attach -n test-debian -- useradd -ou 0 -g 0 test-03 | echo "test-03:vagrant" | chpasswd
 1078* sudo lxc-attach -n test-debian -- useradd -ou 0 -g 0 test-03
 1079* sudo lxc-attach -n test-debian
 1080* sudo lxc-attach -n test-debian -- adduser test-04 | echo "test-03:vagrant" | chpasswd
 1081* sudo lxc-attach -n test-debian -- adduser test-04 | echo "test-04:vagrant" | chpasswd
 1082* sudo lxc-attach -n test-debian
 1083* useradd -m -p <good> -s /bin/bash <good>
 1084* sudo useradd -m -p <good> -s /bin/bash <good>
 1085* sudo useradd -m -p good -s /bin/bash user1
 1086* su - user1
 1087* sudo useradd -m -p <12345678> -s /bin/bash user1
 1088* sudo useradd -m -p 12345678 -s /bin/bash user2
 1089* su - user2
 1090* sudo useradd -m  -s /bin/bash user2
 1091* sudo useradd -m  -s /bin/bash user3
 1092* sudo lxc-attach -n test-debian -- sudo useradd -m  -s /bin/bash user3
 1093* sudo lxc-attach -n test-debian -- useradd -m  -s /bin/bash user3
 1094* sudo lxc-attach -n test-debian
 1095* sudo lxc-attach -n test-debian -- useradd -mou 0 -g 0  user4 | passwd user4
 1096* sudo lxc-attach -n test-debian -- useradd -mou 0 -g 0  user4
 1097* sudo lxc-attach -n test-debian -- useradd -mou 0 -g 0  user5 && passwd user4
 1098* sudo lxc-attach -n test-debian -- useradd -mou 0 -g 0  user5 echo "user5:vagrant" | sudo chpasswd
 1099* sudo lxc-attach -n test-debian -- useradd -mou 0 -g 0 user5 | echo "user5:vagrant" | sudo chpasswd
 1100* sudo lxc-attach -n test-debian -- useradd -mou 0 -g 0 user5 | sudo lxc-attach  echo "user5:vagrant" | sudo chpasswd
 1101* sudo lxc-attach -n test-debian -- useradd -mou 0 -g 0 user6 | sudo lxc-attach  echo "user6:vagrant"
 1102* sudo lxc-attach -n test-debian -- useradd -mou 0 -g 0 user7 | sudo lxc-attach -n test-debian echo "user7:vagrant"
 1103* sudo lxc-attach -n test-debian -- useradd -mou 0 -g 0 user8 | sudo lxc-attach -n test-debian echo "user8:vagrant" | sudo chpasswd\n
 1104* sudo lxc-attach -n test-debian\n
 1105* sudo lxc-attach -n test-debian -- useradd -m -ou 0 -g 0 user9\n
 1106* sudo lxc-attach -n test-debian\n
 1107* sudo lxc-attach -n test-debian -- useradd -m -ou 0 -g 0 s /bin/bash user11\n
 1108* sudo lxc-attach -n test-debian -- useradd -m -ou 0 -g 0 -s /bin/bash user11\n
 1109* sudo lxc-attach -n test-debian\n
 1110  sudo lxc-stop -n test-debian
 1111  sudo lxc-destroy -n test-debian
 1112  sudo lxc-ls -f\n
 1113  sudo lxc-attach -n centos8\n
 1114  sudo lxc-create -t download -f lxc.conf -n debian10 -- --dist debian --release jessie --arch amd64
 1115  lxc-ls -f
 1116  sudo lxc-ls -f
 1117  sudo lxc-start -n debian10
 1118  sudo lxc-ls -f
 1119  sudo lxc-stop -n debian10
 1120  sudo lxc-stop -n centos8
 1121  sudo lxc-destroy -n centos8
 1122  sudo lxc-destroy -n debian10
 1123  clear
 1124  sudo lxc-create -t download -f lxc.conf -n centos8 -- --dist centos --release 8 --arch amd64
 1125  sudo lxc-start -n centos8
 1126  sudo lxc-ls -f
 1127  sudo lxc-attach -n test-debian -- useradd -m -ou 0 -g 0 -s /bin/bash insider
 1128  sudo lxc-attach -n centos8 -- useradd -m -ou 0 -g 0 -s /bin/bash insider\n
 1129  sudo lxc-attach -n centos8
 1130  sudo lxc-stop -n centos8
 1131  sudo lxc-destroy -n centos8
 1132  clear
 1133  sudo lxc-create -t download -f lxc.conf -n debian10 -- --dist debian --release jessie --arch amd64
 1134  sudo lxc-attach -n debian10 -- useradd -m -ou 0 -g 0 -s /bin/bash insider
 1135  sudo lxc-start -n debian10
 1136  sudo lxc-start -n debian1
 1137  clear
 1138  sudo lxc-ls -f
 1139  sudo lxc-attach -n debian10 -- useradd -m -ou 0 -g 0 -s /bin/bash insider
 1140  sudo lxc-attach -n debian10
 1141  ls
 1142  cd lxc
 1143  ls
 1144  cd ..
 1145  nano lxc.conf1
 1146  nano lxc.conf
 1147  nano lxc.conf2
 1148  ls
 1149  cd cicd
 1150  ls
 1151  mkdir task-4/2
 1152  mkdir task-4\2
 1153  ls
 1154  cd task-42
 1155  ls
 1156  cp ~/lxc.conf ~/cicd/task-42
 1157  ls
 1158  cp ~/lxc.conf2 ~/cicd/task-42
 1159  ls
 1160  cp ~/Documents/4.md ~/cicd/task-42
 1161  ls
 1162  cd ..
 1163  ls
 1164  cd test-courses-ci-cd
 1165  ls
 1166  git pull
 1167  ls
 1168  cd task-4
 1169  ls
 1170  cp ~/cicd/task-42 ~/cicd/test-courses-ci-cd/task-4
 1171  cp -r ~/cicd/task-42 ~/cicd/test-courses-ci-cd/task-4
 1172  ls
 1173  git push
 1174  git add --all
 1175  cd ..
 1176  ls
 1177  cd test-courses-ci-cd
 1178  ls
 1179  git commit -m "task4"
 1180  git push
```
