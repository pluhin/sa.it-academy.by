```bash 
 826  cd 15.K8s.FluxCD.ArgoCD/
  827  git rebase -i HEAD~4
  828  cd ../
  829  ls
  830  cd 06.Ansible/
  831  ls
  832  sudo pip3 install ansible-lint
  833  clear
  834  ansible-lint mysql.yaml
  835  cd ../15.K8s.FluxCD.ArgoCD/
  836  ls
  837  wget https://github.com/yannh/kubeconform/releases/download/v0.7.0/kubeconform-linux-amd64.tar.gz
  838  ls
  839  cat kubeconform-linux-amd64.tar.gz
  840  ls -l
  841  sudo tar -C /usr/local/bin/ -xzf  kubeconform-linux-amd64.tar.gz
  842  rm kubeconform-linux-amd64.tar.gz
  843  kubeconform  --summary monitoring/
  844  kubeconform  --summary monitoring/ --schema-location https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/refs/heads/main/helmrelease-helm-v2beta2.json
  845  kubeconform --summary --schema-location https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/refs/heads/main/helmrelease-helm-v2beta2.json monitoring/
  846  kubeconform --summary --schema-location https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/refs/heads/main/{{.ResourceKind}}-{{.ResourceAPIVersion}}.json monitoring/
  847  kubeconform --summary --schema-location default --schema-location https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/refs/heads/main/{{.ResourceKind}}-{{.ResourceAPIVersion}}.json monitoring/
  848  vim monitoring/loki.yaml
  849  kubeconform --summary --schema-location default --schema-location https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/refs/heads/main/{{.ResourceKind}}-{{.ResourceAPIVersion}}.json --schema-location https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/refs/heads/main/helmrelease-helm-v2.json monitoring/
  850  wget https://github.com/stackrox/kube-linter/releases/download/v0.7.2/kube-linter-linux
  851  sudo mv kube-linter-linux /usr/local/bin/kube-linter
  852  ls
  853  ls -l /usr/local/bin/kube-linter
  854  chmod +x /usr/local/bin/kube-linter
  855  kube-linter lint ci-cd/jenkins.yaml
  856  kube-linter lint --help
  857  kube-linter lint --add-all-built-in ci-cd/jenkins.yaml
  858  vim ci-cd/k6.yaml
  859  git ad --all
  860  git add --all
  861  git commit -m "Add k6"
  862  git push
  863  history | grep flux
  864  flux reconcile kustomization monitoring --with-source
  865  k9s
  866  history
```


```bash
 kubeconform  --summary --schema-location default --schema-location 'https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/refs/heads/main/{{.ResourceKind}}-{{.ResourceAPIVersion}}.json' --schema-location https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/refs/heads/main/helmrelease-helm-v2.json monitoring


 kubeconform  --summary --schema-location default --schema-location 'https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/refs/heads/main/{{.ResourceKind}}-helm-{{.ResourceAPIVersion}}.json' monitoring
 ```