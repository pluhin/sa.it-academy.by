## History

```bash
1005  mkdir project
 1006  cd project/
 1007  ls
 1008  ls -la
 1009  git init
 1010  ls -la
 1011  vim .git/config
 1012  git config user.name "Siarhei Pishchyk"
 1013  git config user.email "pluhin@gmail.com"
 1014  vim .git/config
 1015  git config --list
 1016  clear
 1017  date > file.txt
 1018  cdt file.txt
 1019  cat file.txt
 1020  git staus
 1021  git statu
 1022  git status
 1023  ls -l ./
 1024  ls -la ./
 1025  vim .gitignore
 1026  touch .tmp
 1027  git status
 1028  ls -l
 1029  ls -la
 1030  git add --all
 1031  git status
 1032  git commit -m "Fist commit"
 1033  git status
 1034  git log --oneline
 1035  vim file.txt
 1036  git status
 1037  git commit --amend -a
 1038  update-alternatives --config editor
 1039  clear
 1040  suoo visudo
 1041  sudo visudo
 1042  git commit --amend -a
 1043  git status
 1044  clear
 1045  git baranch -a
 1046  git branch -a
 1047  git checkout -b "second"
 1048  git branch -a
 1049  service nginx reload
 1050  sudo service nginx reload
 1051  alias please="sudo"
 1052  please  service nginx reload
 1053  clear
 1054  git checkout master
 1055  git checkout second
 1056  git log --oneline
 1057  clear
 1058  git branch
 1059  date > second.txt
 1060  git add second.txt
 1061  git commit -m "Second to second"
 1062  git log --oneline
 1063  git checkout master
 1064  git log --oneline
 1065  git checkout second
 1066  git checkout master
 1067  git merge second
 1068  git log --oneline
 1069  git branch
 1070  ls
 1071  git reset --hard HEAD~1
 1072  git log --oneline
 1073  git checkout second
 1074  ls
 1075  git log --oneline
 1076  git checkout master
 1077  git log --oneline
 1078  ls
 1079  git merge second
 1080  ls
 1081  git log --oneline
 1082  git branch -a
 1083  clear
 1084  git branch -a
 1085  date >> file.txt
 1086  git add file.txt
 1087  git commit -m "Second to master"
 1088  git log --oneline
 1089  git checkout second
 1090  git log --oneline
 1091  git rebase master
 1092  git log --oneline
 1093  ls -l
 1094  git branch
 1095  vim file.txt
 1096  git add file.txt
 1097  git commit -m "Conflict in second"
 1098  git checkout master
 1099  vim file.txt
 1100  git add file.txt
 1101  git commit -m "Conflict in master"
 1102  git merge second
 1103  git status
 1104  vim file.txt
 1105  git commit -m "Fix conflicts"
 1106  git add file.txt
 1107  git commit -m "Fix conflicts"
 1108  vim file.txt
 1109  git log --oneline
 1110  git rebase HEAD~2
 1111  git rebase --abort
 1112  git rebase HEAD~1
 1113  git rebase --abort
 1114  git rebase HEAD~2
 1115  vim file.txt
 1116  git add file.txt
 1117  git rebase --continue
 1118  git add file.txt
 1119  vim file.txt
 1120  git rebase --continue
 1121  git rebase --abort
 1122  git -i rebase HEAD~2
 1123  git rebase -i HEAD~2
 1124  git rebase --abort
 1125  git rebase -i HEAD~1
 1126  git checkout second
 1127  git rebase --abort
 1128  git status
 1129  git merge --abort
 1130  git log --oneline
 1131  git checkout second
 1132  ls
 1133  git log --oneline
 1134  git rebase -i HEAD~3
 1135  git log --oneline
 1136  git checkout master
 1137  ls
 1138  git tag
 1139  git log --oneline
 1140  git tag -a R1.0 -m "First version"
 1141  git tag
 1142  date >> second.txt
 1143  git add second.txt
 1144  git commit -m "For version 2"
 1145  git tag -a R2.0 -m "Second version"
 1146  git tag
 1147  git tag show R1.0
 1148  git show R1.0
 1149  git checkout R1.0
 1150  vim second.txt
 1151  git checkout R2.0
 1152  vim second.txt
 1153  cd ../sa.it-academy.by/
 1154  git branch
 1155  git fetch
 1156  vim .git/config
 1157  cd../
 1158  cd ../
 1159  rm -rf sa.it-academy.by
 1160  git clone  git@github.com:pluhin/sa.it-academy.by.git
 1161  cd sa.it-academy.by/
 1162  git checkout m-sa2-11-19
 1163  clear
 1164  ls
 1165  mkdir demo
 1166  mkdir demo/02.GIT
 1167  history

```
