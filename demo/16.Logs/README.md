```bash
752  ssh -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" -L 6443:127.0.0.1:6443 root@192.168.203.35 -f -N
  753  kubect logs -n monitoring zabbix-server-6cd5647dc4-w8p8c
  754  kubectl logs -n monitoring zabbix-server-6cd5647dc4-w8p8c
  755  cd 15.Monitoring/
  756  ls
  757  vim zabbix.yaml
  758  cd ../
  759  kubectl logs -n ci-cd jenkins-cfb6b8dcf-6tsfn
  760  history | grep argo
  761  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
  762  ls -l
  763  cd 14.K8s/
  764  ls
  765  cd ../15.Monitoring/
  766  ls
  767  vim zabbix.yaml
  768  docker pull zabbix/zabbix-web-nginx-mysql
  769  ddocker history --format "{{.ID}}: {{.CreatedSince}}" zabbix/zabbix-web-nginx-mysql
  770  docker history --format "{{.ID}}: {{.CreatedSince}}" zabbix/zabbix-web-nginx-mysql
  771  docker history zabbix/zabbix-web-nginx-mysql
  772  vim zabbix.yaml
  773  kubectl apply -f zabbix.yaml
  774  vim zabbix.yaml
  775  docker history zabbix/zabbix-web-nginx-mysql
  776  mc
  777  history
```