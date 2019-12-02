```bash 
1014  mkdir 13.Docker
 1015  cd 13
 1016  cd 13.Docker/
 1017  mkdir 01
 1018  cd 01
 1019  docker search httpd
 1020  docker pull httpd
 1021  docker images
 1022  docker run httpd
 1023  docker run httpd -d
 1024  docker run -d httpd
 1025  docker ps
 1026  docker stop 13f2e35ffb76
 1027  docker ps
 1028  docker run -d -p 81:80 httpd
 1029  docker ps
 1030  docker stop 37296b361c47
 1031  docker rm $(docker ps -aq)
 1032  docker rmi $(docker images -q)
 1033  docker rm $(docker ps -aq)
 1034  clear
 1035  history
 1036  clear
 1037  vim Dockerfile
 1038  docker build .
 1039  docker images
 1040  docker build -t first:v1.0 .
 1041  docker images
 1042  docker build -t first:v1.0 . -f Dockerfile
 1043  docker images
 1044  docker image history first:v1.0
 1045  docker image history first:v1.0 --format "{{.CreatedBy}}" --no-trunc
 1046  vim Dockerfile_multi
 1047  clear
 1048  docker build . --target=base
 1049  docker build . --target=base -f Dockerfile_multi
 1050  docker build . --target=zip -f Dockerfile_multi
 1051  clear
 1052  docker build . --target=base -t test:base --target=zip -t test:zip -f Dockerfile_multi
 1053  docker images
 1054  cd ../
 1055  mkdir 02
 1056  cd  02/
 1057  ls
 1058  vim Dockerfile_01
 1059  docker build -t demo:v1 -f Dockerfile_01 .
 1060  docker run -it demo:v1 bash
 1061  docker ps
 1062  clear
 1063  vim Dockerfile_01
 1064  docker run -it demo:v1 bash
 1065  docker build -t demo:v1 -f Dockerfile_01 .
 1066  docker run -it demo:v1 bash
 1067  docker images
 1068  vim Dockerfile_02
 1069  docker build -t demo:v2 -f Dockerfile_02 .
 1070  docker images
 1071  vim Dockerfile_03
 1072  docker build -t demo:v3 -f Dockerfile_03 .
 1073  docker images
 1074  docker inspect demo:v2
 1075  q!
 1076  docker inspect demo:v3
 1077  docker image history demo:v3
 1078  ls
 1079  vim Dockerfile_04
 1080  docker build -t demo:v4 -f Dockerfile_04 .
 1081  docker inspect demo:v4
 1082  docker images
 1083  vim index.html
 1084  vim nginx.conf
 1085  vim Dockerfile_04
 1086  vim Dockerfile_05
 1087  docker build -t demo:v5 -f Dockerfile_05 .
 1088  docker run -it demo:v5 sh
 1089  docker run -it demo:v5 bash
 1090  docker run -it demo:v5 -d
 1091  docker run -d -it demo:v5
 1092  docker ps
 1093  docker stop 2bb1546f7df2
 1094  docker run -d -p 81:80 -it demo:v5
 1095  docker ps
 1096  docker stop 3596d29bd8ee
 1097  clear
 1098  docker images
 1099  ls
 1100  mc
 1101  cd ../03/
 1102  ls
 1103  docker build -t httpd:test .
 1104  mkdir html
 1105  mv index.html html/
 1106  ls ./html/
 1107  ls -l
 1108  date > html/index.html
 1109  pwd
 1110  docker run -d -p 81:80 -v /tmp/sa.it-academy.by/demo/13.Docker/03/html:/var/www/html:ro httpd:test
 1111  cat /etc/os-release > html/index.html
 1112  docker ps
 1113  docker stop 19b31b2dd57e
 1114  docker run -d -p 81:80 -v /tmp/sa.it-academy.by/demo/13.Docker/03/html:/var/www/html:ro httpd:test
 1115  docker ps
 1116  docker stop fcf5213c9913
 1117  clear
 1118  docker build -t pluhin31/test:v1 .
 1119  docker push pluhin31/test:v1
 1120  docker login -u pluhin31 -p
 1121  docker login -u pluhin31 --password
 1122  docker login -u pluhin31 --password-stdin
 1123  docker login -u pluhin31 --password PASS
 1124  docker login -u pluhin31 --password PASS
 1125  clear
 1126  history
 1127  vim ~/.bash_history
 1128  claer
 1129  clear
 1130  docker push pluhin31/test:v1
 1131  vim Dockerfile
 1132  cd /tmp/
 1133  mkdir Docker_test
 1134  cd Docker_test/
 1135  git init
 1136  vim Dockerfile
 1137  git add Dockerfile
 1138  git commit -m "first commit"
 1139   git config user.email "pluhin@gmail.com"
 1140  git config user.name "Siarhei Pishchyk"
 1141  git commit -m "first commit"
 1142  git remote add origin git@github.com:pluhin/test_sa.git
 1143  git push
 1144   git push --set-upstream origin master
 1145  cd /tmp/sa.it-academy.by/demo/13.Docker/
 1146  history
```
