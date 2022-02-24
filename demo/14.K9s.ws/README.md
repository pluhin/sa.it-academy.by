# Jenkins deployment and ArgoCD

```bash
  292  kubectl get nodes
  293  ls
  294  mkdir ws_deploy
  295  cd ws_deploy/
  296  ls
  297  vim Dockerfile
  298  curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey
  299  sudo curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; sudo apt-key add /tmp/dkey
  300  add-apt-repository         "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
  301          $(lsb_release -cs) \
  302          stable"
  303  sudo add-apt-repository         "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
  304          $(lsb_release -cs) \
  305          stable"
  306  apt-get -y install docker-ce -qq
  307  sudo apt-get -y install docker-ce -qq
  308  sudo usermod -aG docker $USER
  309  cd ws_deploy/
  310  ls
  311  docker ps
  312  clear
  313  ls -l
  314  docker build -t jfrog.it-academy.by/public/jenkins-ci:spishchyk .
  315  docker images
  316  docker login jfrog.it-academy.by
  317  docker push jfrog.it-academy.by/public/jenkins-ci:spishchyk
  318  kubectl apply -f jenkins.yaml
  319  kubectl create namespace argocd
  320  wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -O argocd-install.yaml
  321  ls
  322  vim argocd-install.yaml
  323  kubectl apply -f argocd-install.yaml
  324  kubectl delete -f argocd-install.yaml
  325  kubectl apply -f argocd-install.yaml -n argocd
  326  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
  327  ls -l
  328  mc argocd-install.yaml /vagrant/
  329  mv argocd-install.yaml /vagrant/
  330  ls
  331  git init
  332  git branch
  333  git branch -a
  334  git diff
  335  git status
  336  git add --all
  337  git commit -m "First commit"
  338  ssh-keygen
  339  git config user.email "pluhin@gmail.com"
  340  git config user.name "Spishchyk"
  341  git commit -m "First commit"
  342  git log
  343  git reset
  344  git reset --hard HEAD~1
  345  git reset HEAD~1
  346  git log --online
  347  git log online
  348  git log
  349  rm .git
  350  rm .git -rf
  351  git init
  352  git config user.email "pluhin@gmail.com"
  353  git config user.name "Spishchyk"
  354  git add --all
  355  git commit -m "First commit"
  356  git log
  357  git remote add origin git@github.com:pluhin/argo_deploy.git
  358  git branch -M main
  359  git push -u origin main
  360  vim ~/.ssh/id_rsa.pub
  361  git push -u origin main
  362  vim jenkins.yaml
  363  vim secret.yaml
  364  kubeseal --format=yaml < secret.yaml > sealed_secret.yaml
  365  ls
  366  rm secret.yaml
  367  git commit --amend -a
  368  git push origin -f
  369  ls
  370  git status
  371  git commit -m "add secret"
  372  git add --all
  373  git commit -m "add secret"
  374  git push
  376  cd /vagrant/
  377  ls
  378  kubectl apply -f argocd-install.yaml -n argocd
  379  history
```