```bash
 1349  cd /tmp/sa.it-academy.by
 1350  git pull
 1351  cd demo/
 1352  mkdir 13.K8s
 1353  cd 13.K8s
 1354  minikube start
 1355  vim web_app.yaml
 1356  history | grep proxy
 1357  kubectl proxy --address='0.0.0.0' --disable-filter=true
 1358  kubectl proxy --address='0.0.0.0' --disable-filter=true &
 1359  clear
 1360  ls
 1361  ls ~/.kube/config
 1362  kubectl get ns
 1363  kubectl get pods
 1364  kubectl create -f web_app.yaml
 1365  kubectl get pods
 1366  kubectl describe pod webserver-795bf76768-m7tc4
 1367  kubectl exec -it  webserver-795bf76768-m7tc4 -- bash
 1368  kubectl get deployments
 1369  kubectl delete deploy/webserver
 1370  kubectl create -f web_app.yaml
 1371  vim web_app.yaml
 1372  kubectl create -f web_app.yaml
 1373  kubectl delete webserver
 1374  kubectl get deployments
 1375  kubectl delete deployments/webserver
 1376  kubectl delete deploy/webserver
 1377  kubectl get services
 1378  minikube service list
 1379  curl http://192.168.99.101:32757
 1380  kubectl create -f web_app.yaml
 1381  minikube service list
 1382  curl http://192.168.99.101:32757
 1383  minikube service list
 1384  vim web_app.yaml
 1385  kubectl create -f web_app.yaml
 1386  minikube service list
 1387  kubectl get is
 1388  kubectl get ingerss
 1389  kubectl get ingress
 1390  vim /etc/hosts
 1391  sudo vim /etc/hosts
 1392  links http://myminikube.plu
 1393  sudo vim /etc/nginx/conf.d/web-app.conf
 1394  cat /etc/nginx/conf.d/web-app.conf > nginx.conf
 1395  sudo service nginx restart
 1396  vim web_app.yaml
 1397  kubectl create -f web_app.yaml
 1398  minikube ssh
 1399  vim web_app.yaml
 1400  kubectl apply -f web_app.yaml
 1401  vim jenkins_k8s.yaml
 1402  kubectl apply -f jenkins_k8s.yaml
 1403  vim jenkins_k8s.yaml
 1404  kubectl apply -f jenkins_k8s.yaml
 1405  vim jenkins_k8s.yaml
 1406  vim /etc/nginx/conf.d/jenkins.conf
 1407  sudo vim /etc/nginx/conf.d/jenkins.conf
 1408  sudo service nginx restart
 1409  vim jenkins_k8s.yaml
 1410* echo "c3VwZXJfcGFzcw==" | base64 -d
 1411  kubectl get pods
 1412  kubectl get pods -n ci-cd
 1413  vim jenkins_k8s.yaml
 1414  git add --all

```
