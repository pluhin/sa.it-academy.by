# Secrets and Helm


```bash
 138  ls
  139  cd first_deploy/
  140  ls
  141  cd ../
  142  mkdir secrets_helm
  143  cp first_deploy/app.yaml secrets_helm/
  144  cd secrets_helm/
  145  ls
  146  vim app.yaml
  147  echo -n "my_password" | base64
  148  echo "XXXXX" | base64 -d
  149  vim app.yaml
  150  kubectl apply -f app.yaml
  151  vim app.yaml
  152  kubectl apply -f app.yaml
  153  kubectl exec -it webserver-7b49774476-hm6w7 -- bash
  154  clear
  155  wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.17.3/kubeseal-0.17.3-linux-amd64.tar.gz
  156  history
  157  history | grep tar
  158  sudo tar -C /usr/local/bin/ -xzf kubeseal-0.17.3-linux-amd64.tar.gz
  159  kubeseal
  160  clear
  161  kubeseal
  162  kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.17.3/controller.yaml
  163  vim app.yaml
  164  kubectl apply -f app.yaml
  165  kubectl delete secret secret-from-manifest
  166  vim secret.yaml
  167  cat secret.yaml | kubeseal --format yaml > sealed-secret.yaml
  168  vim sealed-secret.yaml
  169  kubectl apply -f sealed-secret.yaml
  170  vim sealed-secret.yaml
  171  vim app.yaml
  172  kubectl apply -f app.yaml
  173  kubectl exec -it webserver-7b49774476-92f2t -- bash
  174  kubectl get secret secret-from-manifest -o > modify_secret.yaml
  175  kubectl get secret secret-from-manifest -o yaml > modify_secret.yaml
  176  vim modify_secret.yaml
  177  kubeseal --format=yaml < modify_secret.yaml > modify__sealed_secret.yaml
  178  echo -n "test_password" | base64
  179  vim modify_secret.yaml
  180  kubeseal --format=yaml < modify_secret.yaml > modify__sealed_secret.yaml
  181  mv modify__sealed_secret.yaml modify_sealed_secret.yaml
  182  kubectl apply -f modify_sealed_secret.yaml
  183  kubectl exec -it webserver-7b49774476-92f2t -- bash
  184  history | grep scale
  185  kubectl scale deployment webserver --replicas=0
  186  kubectl scale deployment webserver --replicas=3
  187  kubectl exec -it webserver-7b49774476-l8h9b -- bash
  188  ls -l
  189  clear
  190  vim app.yaml
  191  mkdir helm_app
  192  cd helm_app/
  193  helm
  194  wget Linux amd64
  195  wget https://get.helm.sh/helm-v3.8.0-linux-amd64.tar.gz
  196  history | grep tar
  197  sudo tar -C /usr/local/bin/ -xzf helm-v3.8.0-linux-amd64.tar.gz
  198  helm
  199  vim helm-v3.8.0-linux-amd64.tar.gz
  200  mc
  201  history | grep sudo
  202  sudo install -o root -g root -m 0755 ../helm /usr/local/bin/helm
  203  helm
  204  clear
  205  history
  206  ls -l /usr/local/bin/
  207  ls -l /usr/local/bin/helm
  208  ls -l /usr/local/bin/linux-amd64
  209  sudo  rm -rf /usr/local/bin/linux-amd64
  210  ls -l
  211  rm helm-v3.8.0-linux-amd64.tar.gz
  212  mc
  213  ls
  214  helm create demo-app
  215  ls -l demo-app/
  216  vim demo-app/Chart.yaml
  217  vim demo-app/values.yaml
  218  vim demo-app/templates/service.yaml
  219  vim demo-app/values.yaml
  220  clear
  221  helm package demo-app
  222  ls -l
  223  helm install demo-app demo-app-0.1.0.tgz
  224  helm uninstall demo-app
  225  helm repo add bitnami https://charts.bitnami.com/bitnami
  226  helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
  227  helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner      --set nfs.server=192.168.37.105     --set nfs.path=/mnt/IT-Academy/nfs-data/sa2-19-22/
  228  helm install sp_joomla  --set global.storageClass=nfs-client,joomlaUsername=admin,joomlaPassword=password,ingress.enabled=True,ingress.hosts[0]=joomla_sa.k8s-23.sa,serviceType=ClusterIP bitnami/joomla
  229  helm install sp-joomla  --set global.storageClass=nfs-client,joomlaUsername=admin,joomlaPassword=password,ingress.enabled=True,ingress.hosts[0]=joomla_sa.k8s-23.sa,serviceType=ClusterIP bitnami/joomla
  230  :pods
  231  helm uninstall sp-joomla
  232  helm install sp-joomla  --set global.storageClass=nfs-client,joomlaUsername=admin,joomlaPassword=password,ingress.enabled=True,ingress.hostname=joomla_sa.k8s-23.sa,serviceType=ClusterIP bitnami/joomla
  233  helm install sp-joomla  --set global.storageClass=nfs-client,joomlaUsername=admin,joomlaPassword=password,ingress.enabled=True,ingress.hostname=joomla-sa.k8s-23.sa,serviceType=ClusterIP bitnami/joomla
  234  helm uninstall sp-joomla
  235  helm install sp-joomla  --set global.storageClass=nfs-client,joomlaUsername=admin,joomlaPassword=password,ingress.enabled=True,ingress.hostname=joomla-sa.k8s-23.sa,serviceType=ClusterIP bitnami/joomla
  236  helm uninstall sp-joomla
  237  helm install sp_joomla  --set global.storageClass=nfs-client,joomlaUsername=admin,joomlaPassword=password,ingress.enabled=True,ingress.hostname=joomla-sa.k8s-23.sa,ingress.path="/",ingress.annotations="kubernetes.io/ingress.class: nginx",serviceType=ClusterIP bitnami/joomla
  238  helm install sp-joomla  --set global.storageClass=nfs-client,joomlaUsername=admin,joomlaPassword=password,ingress.enabled=True,ingress.hostname=joomla-sa.k8s-23.sa,ingress.path="/",ingress.annotations="kubernetes.io/ingress.class: nginx",serviceType=ClusterIP bitnami/joomla
  239  helm uninstall sp-joomla
  240  helm install sp-joomla  --set global.storageClass=nfs-client,joomlaUsername=admin,joomlaPassword=password,ingress.enabled=True,ingress.hostname=joomla-sa.k8s-23.sa,ingress.path="/",ingress.annotations=["kubernetes.io/ingress.class: nginx"],serviceType=ClusterIP bitnami/joomla
  241  helm uninstall sp-joomla
  242  helm install sp-joomla  --set global.storageClass=nfs-client,joomlaUsername=admin,joomlaPassword=password,serviceType=ClusterIP bitnami/joomla
  243  helm uninstall sp-joomla
  244  helm install sp-joomla  --set global.storageClass=nfs-client,joomlaUsername=admin,joomlaPassword=password bitnami/joomla
  245  vim joomla_ingress.yaml
  246  kubectl apply -f joomla_ingress.yaml
  247  helm uninstall sp-joomla
  248  helm install sp-joomla  --set global.storageClass=nfs-client,joomlaUsername=admin,joomlaPassword=password bitnami/joomla
  249  vim joomla_ingress.yaml
  250  kubectl apply -f joomla_ingress.yaml
  251  vim joomla_ingress.yaml
  252  kubectl apply -f joomla_ingress.yaml
  253  kubectl delete ingress ingress-sa
  254  kubectl apply -f joomla_ingress.yaml
  255  cd ../../first_deploy/
  256  kubectl apply -f app.yaml
  257  cd ../secrets_helm/helm_app/
  258  vim joomla_ingress.yaml
  259  history
```