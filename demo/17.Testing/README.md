```bash
  335  mkdir -b testing/{ansible,k8s}
  336  mkdir -p testing/{ansible,k8s}
  337  clear
  338  cd testing/
  339  cd ansible/
  340  ls -l
  341  sudo pip3 install ansible-lint
  342  ansible-lint web.yaml
  343  ansible-lint local.yaml
  344  sudo pip3 install molecule
  345  cd roles/webserver/
  346  ls
  347  ls -l
  348*
  349  sudo pip3 install molecule-docker
  350  cd roles/webserver/
  351  molecule init scenario -d docker
  352  ls -l
  353  vim molecule/default/molecule.yml
  354  molecule test
  355  vim molecule/default/molecule.yml
  356  molecule test
  357  vim molecule/default/molecule.yml
  358  molecule test
  359  ansible --version
  360  sudo pip3 install ansible --upgrade
  361  sudo pip3 uninstall ansible
  362  sudo pip3 uninstall ansible-core
  363  sudo pip3 install ansible --upgrade
  364  sudo pip3 uninstall ansible-base
  365  sudo pip3 install ansible
  366  molecule test
  367  vim molecule/default/molecule.yml
  368  molecule test
  369  vim molecule/default/molecule.yml
  370  molecule test
  371  molecule test lint
  372  sudo pip3 install ansible-lint
  373  ansible-lint
  374  ansible-lint --version
  375  sudo apt search lint
  376  sudo pip3 install ansible-lint --upgrade
  377  molecule test lint
  378  sudo pip3 install lint
  379  molecule test lint
  380  molecule check
  381  cd ../
  382  cd /vagrant/testing/k8s/
  383  ls
  384  wget https://github.com/instrumenta/kubeval/releases/download/v0.16.1/kubeval-linux-amd64.tar.gz
  385  history tar
  386  history | grep  tar
  387  sudo tar -C /usr/local/bin/ -xzf kubeval-linux-amd64.tar.gz
  388  kubeval
  389  wget https://github.com/stackrox/kube-linter/releases/download/0.2.5/kube-linter-linux.tar.gz
  390  sudo tar -C /usr/local/bin/ -xzf kube-linter-linux.tar.gz
  391  kube-linter
  392  rm kube*
  393  ls
  394  kubeval jenkins.yaml
  395  kubeval --ignore-missing-schemas jenkins.yaml
  396  kubeval node-exporter.yaml
  397  kube-linter lint jenkins.yaml
  398  kube-linter lint jenkins.yaml --add-all-build-in
  399  kube-linter lint jenkins.yaml --add-all-built-in
  400  kube-linter lint jenkins.yaml --do-not-auto-add-defaults
  401  kube-linter lint jenkins.yaml --do-not-auto-add-defaults --include run-as-non-root
  402  echo $?
  403  kube-linter lint jenkins.yaml --do-not-auto-add-defaults --include default-service-account
  404  kube-linter lint jenkins.yaml --do-not-auto-add-defaults --include unset-cpu-requirements
  405  echo $?
  406  history
```