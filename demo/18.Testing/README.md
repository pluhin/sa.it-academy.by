```bash
 954  cd 06.Ansible/
  955  sudo pip3 install ansible-lint
  956  la
  957  ls
  958  ansible-lint mysql.yaml
  959  echo $?
  960  cd ../14.K8s.Jenkins.Install/
  961  wget https://github.com/stackrox/kube-linter/releases/download/v0.7.5/kube-linter-linux
  962  sudo mv kube-linter-linux /usr/local/bin/
  963  sudo chmod +x /usr/local/bin/kube-linter-linux
  964  kube-linter-linux
  965  kube-linter-linux jenkins/deploy_jenkins.yaml
  966  kube-linter-linux lint jenkins/deploy_jenkins.yaml
  967  kube-linter-linux lint --add-all-built-in jenkins/deploy_jenkins.yaml
  968  echo $?
  969  wget https://github.com/yannh/kubeconform/releases/download/v0.7.0/kubeconform-linux-amd64.tar.gz
  970  sudo tar -C /usr/local/bin/ -xzf kubeconform-linux-amd64.tar.gz
  971  kubeconform
  972  kubeconform --summary jenkins/
  973  vim jenkins/deploy_jenkins.yaml
  974  kubeconform --summary jenkins/
  975  vim jenkins/deploy_jenkins.yaml
  976  kubeconform --summary jenkins/
  977  vim jenkins/deploy_jenkins.yaml
  978  kubeconform --summary jenkins/
  979  cd ../
  980  15.K8s.FluxCD.ArgoCD/
  981  l
  982  cd 15.K8s.FluxCD.ArgoCD/
  983  ls
  984  kubeconform --summary flux/

  996  kubeconform -summary -schema-location default -schema-location 'https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json' flux/flux-system/
  997  kubeconform -summary -schema-location default -schema-location 'https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json' flux/flux-system/gotk-sync.yaml
  998  vim k6.yaml
  999  kubectl apply -f k6.yaml
 1000  vim k6.yaml
 1001  history
```