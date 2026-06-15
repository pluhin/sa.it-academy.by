```bash
  818  pip3 install anslible-lint
  819  pip3 install ansible-lint
  820  cd 05.Ansible/
  821  ansible-lint user.yaml
  822  wget https://github.com/yannh/kubeconform/releases/download/v0.8.0/kubeconform-linux-amd64.tar.gz
  823  sudo tar -C /usr/local/bin/ -xzf kubeconform-linux-amd64.tar.gz
  824  kubeconform
  825  cd ../
  826  cd  15.K8s.FluxCD.ArgoCD/
  827  ls
  828  cd ci-cd/
  829  kubeconform --summary -schema-location default -schema-location 'https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json' jenkins.yaml
  830  vim jenkins.yaml
  831  kubeconform --summary -schema-location default -schema-location 'https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json' jenkins.yaml
  832  vim jenkins.yaml
  833  kubeconform --summary -schema-location default -schema-location 'https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json' jenkins.yaml
  834  clear
  835  wget https://github.com/stackrox/kube-linter/releases/download/v0.8.3/kube-linter-linux
  836  sudo mv kube-linter-linux /usr/local/bin/
  837  sudo  chmod +x /usr/local/bin/kube-linter-linux
  838  sudo /usr/local/bin/kube-linter-linux /usr/local/bin/kube-linter
  839  sudo mv /usr/local/bin/kube-linter-linux /usr/local/bin/kube-linter
  840  kube-linter jenkins.yaml
  841  kube-linter lint jenkins.yaml
  842  kube-linter lint --help
  843  kube-linter lint jenkins.yaml --add-all-built-in
  844  cd ../
  845  mkdir 17.K8s.Testing
  846  cd 17.K8s.Testing/
  847  vim k6.yaml
  848  kubectl apply -f k6.yaml
  849  k9s
  850  k9s --headless
  851  history
```
--

```
sum by (pod) (
  rate(container_cpu_usage_seconds_total{
    namespace="ci-cd",
    pod=~"jenkins.*",
    container!="POD",
    image!=""
  }[5m])
)
```