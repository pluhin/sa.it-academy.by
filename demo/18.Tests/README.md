```bash
  953  cd 06.Ansible.workshop/
  954  ls
  955  sudo pip3 install ansible-lint
  956  c
  957  ansible-lint mysql.yaml
  958  cd ../
  959  wget https://github.com/yannh/kubeconform/releases/download/v0.6.6/kubeconform-linux-amd64.tar.gz
  960  history | grep tar.gz
  961  mc
  962  sudo tar -C /usr/local/bin -xzf kubeconform-linux-amd64.tar.gz
  963  kubeconform
  964  cd 15.K8s.ArgoCD/
  965  ls
  966  kubeconform --summary argo-apps
  967  kubeconform --summary argo-apps -schema-location https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json
  968  kubeconform --summary -schema-location https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json argo-apps/
  969  kubeconform --summary -schema-location kubeconform --summary -schema-location https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/_definitions.json  flux-system
  970  vim flux-system/gotk-sync.yaml
  971  kubeconform --summary -schema-location kubeconform --summary -schema-location https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/_definitions.json  flux-system
  972  vim flux-system/gotk-sync.yaml
  973  kubeconform --summary -schema-location kubeconform --summary -schema-location https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/_definitions.json  flux-system
  974  vim flux-system/gotk-sync.yaml
  975  kubeconform --summary -schema-location kubeconform --summary -schema-location https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/kustomization-kustomize-v1.json  flux-system
  976  kubeconform --summary -schema-location kubeconform --summary -schema-location https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/kustomization-kustomize-v1.json  flux-system/gotk-sync.yaml
  977  vim flux-system/gotk-sync.yaml
  978  kubeconform --summary -schema-location kubeconform --summary -schema-location https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/kustomization-kustomize-v1.json -schema-location https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/gitrepository-source-v1.json flux-system/gotk-sync.yaml
  979  kubeconform --summary -schema-location https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/kustomization-kustomize-v1.json -schema-location https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/gitrepository-source-v1.json flux-system/gotk-sync.yaml
  980  wget https://github.com/stackrox/kube-linter/releases/download/v0.6.8/kube-linter-linux.tar.gz
  981  sudo tar -C /usr/local/bin -xzf kube-linter-linux.tar.gz
  982  kube-linter
  983  kube-linter lint monitoring/zabbix.yaml
  984  kube-linter lint monitoring/zabbix.yaml --add-all-built-in
  985  kubeconform --summary -schema-location https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/kustomization-kustomize-v1.json -schema-location 'https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json' argo-apps/
  986  kubeconform --summary -schema-location 'https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json' argo-apps/
  987  kubeconform --summary -schema-location 'https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json' flux-system/
  988  kubeconform --summary -schema-location 'https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json' -schema-location 'https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/{{.NormalizedKubernetesVersion}}-standalone{{.StrictSuffix}}/{{.ResourceKind}}{{.KindSuffix}}.json' flux-system/
  989  history
```