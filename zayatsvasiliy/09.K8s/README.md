##task1
``` bash
 1081  cd /home/v/homework/09.k8S/
 1082  ls
 1083  docker
 1084  clear
 1085  kindq
 1086  kind
 1087  [ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.27.0/kind-linux-amd64
 1088  chmod +x ./kind
 1089  sudo mv ./kind /usr/local/bin/kind
 1090  docker --verios
 1091  docker --version
 1092  kind --version
 1093  vim kind-config.yaml
 1094  kind create cluster --name task1_2 kind-config.yaml 
 1095  kind create cluster --name task1_2 --config kind-config.yaml 
 1096  kind create cluster --name task1-2 --config kind-config.yaml 
 1097  kubectl get nodes
 1098  vim kind-config.yaml 
 1099  kubectl cluster-info --context task1-2
 1100  kubectl cluster-info --context kind-task1-2
 1101  clear
 1102  ls
```
##task2
```bash
 1103  minikube --version
 1104  minikube version
 1105  minikube start
 1106  kubectl get nodes
```
## task3
```bash
 1107  git init
 1108  git remote add origin git@github.com:zayatsvasiliy/09.K8s.git
 1109  git remote 
 1110  clear
 1111  mkdir -p .github/workflows/
 1112  vim .github/workflows/kind.yaml
 1113  git add --all
 1114  ды
 1115  ls
 1116  .gitignore
 1117  vim .gitignore
 1118  git add --all
 1119  git commit -m "task3"
 1120  git push -u origin --all
 1121  vim kind-config.yaml 
 1122  git add --all
 1123  git commit -m "task3"
 1124  git push -u origin --all
 1125  vim .github/workflows/kind.yaml
 1126  git add --all
 1127  git commit -m "task3"
 1128  git push -u origin --all
 1129  vim kind-config.yaml 
 1130  vim .github/workflows/kind.yaml 
 1131  git add --all
 1132  git commit -m "task3"
 1133  git push -u origin --all
 1134  vim .github/workflows/kind.yaml 
 1135  git add --all
 1136  git commit -m "task3"
 1137  git push -u origin --all 
 1138  vim .github/workflows/kind.yaml 
 1139  git add --all
 1140  git commit -m "task3"
 1141  git add --all
 1142  git push -u origin --all
 1143  vim .github/workflows/kind.yaml 
 1144  git add --all
 1145  git commit -m "task3"
 1146  git push -u origin --all 
 1147  vim .github/workflows/kind.yaml 
 1148  git add --all
 1149  git commit -m "task3"
 1150  git push -u origin --all 
 1151  vim .github/workflows/kind.yaml 
 1152  git add --all
 1153  git commit -m "task3"
 1154  git push -u origin --all
 1155  vim .github/workflows/kind.yaml 
 1156  git add --all
 1157  git commit -m "task3"
 1158  git push -u origin --all
 1159  vim .github/workflows/kind.yaml 
 1160  git commit -m "task3"
 1161  git add --all
 1162  git commit -m "task3"
 1163  git push -u origin --all
```
##task4
```bash
 1167  vim .github/workflows/mini.yaml 
 1168  git add --all
 1169  git commit -m "task4"
 1170  git push -u origin --all
 1171  vim .github/workflows/mini.yaml 
 1172  git add --all
 1173  git commit -m "task4"
 1174  git push -u origin --all
 1175  hystory >> README.md
 1176  history >> README.md
```