```bash
859  clear
  860  cd 15.K8s.GitOps/
  861  ls
  862  vim flux/flux-system/gotk-sync.yaml
  863  vim monitoring/loki.yaml
  864  git add --all
  865  git status
  866  git commit -m "add loki"
  867  git push
  868  history | grep flux
  869  flux reconcile kustomization monitoring --with-source
  870  mkdir elk
  871  cd elk/
  872  ls
  873  vim Chart.yaml
  874  vim values.yaml
  875  helm dependency update
  876  helm repo add elastic https://helm.elastic.co
  877  helm repo update
  878  helm dependency update
  879  helm repo
  880  history | search
  881  history | grep search
  882  helm search repo elastic
  883  vim Chart.yaml
  884  helm dependency update
  885  curl -I https://helm.elastic.co/helm/elasticsearch/elasticsearch-8.5.1.tgz
  886  curl -S https://helm.elastic.co/helm/elasticsearch/elasticsearch-8.5.1.tgz
  887  vim Chart.yaml
  888  curl -S https://helm.elastic.co
  889  helm install my-release oci://registry-1.docker.io/bitnamicharts/elasticsearch
  890  helm uninstall my-release
  891  helm install my-release oci://registry-1.docker.io/bitnamicharts/elasticsearch --set global.defaultStorageClass=nfs-client
  892  helm uninstall my-release
  893  helm install my-release oci://registry-1.docker.io/bitnamicharts/elasticsearch --set global.defaultStorageClass=nfs-client,master.persistence.storageClass=nfs-client,data.persistence.storageClass=nfs-client
  894  ip addr
  895  ip addr | grep 208
  896  ip addr | grep 204
  897  curl 192.168.204.85:9200
  898  curl 192.168.208.25:31079
  899  curl http://192.168.208.25:31079
  900  curl http://192.168.208.25:30650
  901  links http://192.168.208.25:30650
  902  sudo apt install links
  903  links http://192.168.208.25:30650
  904  helm uninstall my-release
  905  helm install my-release oci://registry-1.docker.io/bitnamicharts/elasticsearch --set global.defaultStorageClass=nfs-client,master.persistence.storageClass=nfs-client,data.persistence.storageClass=nfs-client,ingress.enabled=true,ingress.hostname=elk.k8s-25.sa,ingress.ingressClassName=nginx
  906  helm install my-release oci://registry-1.docker.io/bitnamicharts/elasticsearch --set global.defaultStorageClass=nfs-client,master.persistence.storageClass=nfs-client,data.persistence.storageClass=nfs-client,ingress.enabled=true,ingress.hostname=elk.k8s-25.sa,ingress.ingressClassName=nginx,kibanaEnabled=true
  907  helm uninstall my-release
  908  helm install my-release oci://registry-1.docker.io/bitnamicharts/elasticsearch --set global.defaultStorageClass=nfs-client,master.persistence.storageClass=nfs-client,data.persistence.storageClass=nfs-client,ingress.enabled=true,ingress.hostname=elk.k8s-25.sa,ingress.ingressClassName=nginx,kibanaEnabled=true
  909  helm uninstall my-release
  910  helm install my-release oci://registry-1.docker.io/bitnamicharts/elasticsearch --set global.defaultStorageClass=nfs-client,master.persistence.storageClass=nfs-client,data.persistence.storageClass=nfs-client,ingress.enabled=true,ingress.hostname=elk.k8s-25.sa,ingress.ingressClassName=nginx,global.kibanaEnabled=true
  911  helm uninstall my-release
  912  helm install my-release oci://registry-1.docker.io/bitnamicharts/elasticsearch --set global.defaultStorageClass=nfs-client,master.persistence.storageClass=nfs-client,data.persistence.storageClass=nfs-client,ingress.enabled=true,ingress.hostname=elk.k8s-25.sa,ingress.ingressClassName=nginx,global.kibanaEnabled=true,kibana.ingress.enabled=true,kibana.ingress.hostname=kibana.k8s-25.sa,kibana.ingress.ingressClassName=nginx
  913  helm uninstall my-release
  914  history
```
