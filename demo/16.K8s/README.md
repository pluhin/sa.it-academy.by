```bash 
1016  cd /tmp/sa.it-academy.by/
 1017  git pull
 1018  clear
 1019  cd demo/
 1020  ls
 1021  mkdir 16.K8s
 1022  cd 16.K8s/
 1023  minikube status
 1024  history | grep proxy
 1025  kubectl proxy --address='0.0.0.0' --disable-filter=true &
 1026  clear
 1027  kubectl get services
 1028  vim  web-app.yaml
 1029  kubectl apply -f web-app.yaml
 1030  kubectl get pods
 1031  vim  web-app.yaml
 1032  kubectl apply -f web-app.yaml
 1033  kubectl get pods
 1034  vim  web-app.yaml
 1035  kubectl apply -f web-app.yaml
 1036  kubectl get pods
 1037  vim  web-app.yaml
 1038  kubectl apply -f web-app.yaml
 1039  kubectl get pods
 1040  kubectl get deplyment
 1041  kubectl get deployment
 1042  kubectl delete webserver
 1043  kubectl delete deploy/webserver
 1044  kubectl get deployment
 1045  kubectl get pods
 1046  kubectl apply -f web-app.yaml
 1047  kubectl get pods
 1048  kubectl discribe pod webserver-6fd9bcf886-8fqnm
 1049  kubectl describe pod webserver-6fd9bcf886-8fqnm
 1050  kubectl exec -it webserver-6fd9bcf886-8fqnm -- bash
 1051  ls
 1052  vim web-app.yaml
 1053  vim web-service.yaml
 1054  vim web-app.yaml
 1055  vim web-service.yaml
 1056  kubectl apply -f web-service.yaml
 1057  kubectl get service
 1058  kubectl get svc
 1059  minikube servcie list
 1060  minikube service list
 1061  curl  http://192.168.99.100:31963
 1062  clear
 1063  ls
 1064  vim web-ingeres.yaml
 1065  kubectl apply ./
 1066  kubectl apply ./*
 1067  kubectl apply -f web-ingeres.yaml
 1068  vim web-ingeres.yaml
 1069  ping myminikube.plu
 1070  vim web-ingeres.yaml
 1071  sudo vim /etc/hosts
 1072  minikube service list
 1073  ping myminikube.plu
 1074  ifconfig
 1075  sudo vim /etc/nginx/conf.d/web-app.conf
 1076  cp /etc/nginx/conf.d/web-app.conf ./
 1077  sudo service nginx reload
 1078  sudo vim /etc/nginx/conf.d/web-app.conf
 1079  sudo service nginx restart
 1080  sudo vim /etc/nginx/conf.d/web-app.conf
 1081  sudo vim /etc/hosts
 1082  curl http://myminikube.plu
 1083  telnet myminikube.plu
 1084  telnet myminikube.plu 80
 1085  kubectl get pods
 1086  kubectl get service
 1087  kubectl get ingress
 1088  sudo vim /etc/nginx/conf.d/web-app.conf
 1089  wq
 1090  sudo vim /etc/nginx/conf.d/web-app.conf
 1091  sudo service nginx restart
 1092  sudo vim /etc/nginx/conf.d/web-app.conf
 1093  vim web-ingeres.yaml
 1094  curl http://myminikube.plu
 1095  kubectl get service
 1096  kubectl get ingress
 1097  kubectl apply -f web-ingeres.yaml
 1098  vim web-ingeres.yaml
 1099  sudo vim /etc/nginx/conf.d/web-app.conf
 1100  sudo service nginx restart
 1101  sudo service nginx status
 1102  sudo mc
 1103  sudo service nginx restart
 1104  mc
 1105  sudo mc
 1106  sudo service nginx restart
 1107  sudo vim /etc/nginx/conf.d/web-app.conf
 1108  minikube service list
 1109  sudo vim /etc/nginx/conf.d/web-app.conf
 1110  sudo service nginx restart
 1111  vim web-pv.yaml
 1112  kubectl apply -f web-pv.yaml
 1113  vim web-pvc.yaml
 1114  vim web-app.yaml
 1115  vim web-pvc.yaml
 1116  kubectl apply -f web-pvc.yaml
 1117  vim web-app.yaml
 1118  vim web-pv.yaml
 1119  minikube ssh
 1120  vim web-app.yaml
 1121  kubectl apply -f web-app.yaml
 1122  kubectl get pods
 1123  vim jenkins.yaml
 1124  kubectl apply -f jenkins.yaml
 1125  vim jenkins.yaml
 1126  kubectl apply -f jenkins.yaml
 1127  vim jenkins.yaml
 1128  kubectl apply -f jenkins.yaml
 1129  vim jenkins.yaml
 1130  kubectl apply -f jenkins.yaml
 1131  vim jenkins.yaml
 1132  kubectl apply -f jenkins.yaml
 1133  vim jenkins.yaml
 1134  vim web-app.yaml
 1135  vim jenkins.yaml
 1136  kubectl apply -f jenkins.yaml
 1137  vim jenkins.yaml
 1138  sudo cp /etc/nginx/conf.d/web-app.conf /etc/nginx/conf.d/jenkins_app.conf
 1139  sudo vim /etc/nginx/conf.d/jenkins_app.conf
 1140  minikube service list
 1141  sudo service nginx restart
 1142  sudo vim /etc/hosts
 1143  history
```
