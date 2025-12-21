```bash
  681  mkdir 14.K8s
  682  cd 14.K8s/
  683  git init
  684  vim Dockerfile
  685  mkdir -p .github/workflows
  686  vim .github/workflows/build.yaml
  687  git add --all
  688  git commit -m "Init"
  689  git remote add origin git@github.com:pluhin/sa2-33-25-jenkins.git
  690  git push -u origin master
  691  history
  692  vim Dockerfile
  693  git commit --ammend --all -no-edit
  694  git commit --amend --all -no-edit
  695  git commit --amend --all --no-edit
  696  git push origin -f
  697  mkdir jenkins
  698  cd jenkins/
  699  vim jenkins.yaml
  700  kubectl apply -f jenkins.yaml
  701  git add --all
  702  git commit -m "add jenkins"
  703  git push
  704  kubectl logs -n ci-cd jenkins-54754cf4bc-nw77x
  705  vim jenkins.yaml
  706  kubectl apply -f jenkins.yaml
  707  git commit --amend --all --no-edit
  708  git push origin -f
  709  vim jenkins.yaml
  710  git commit --amend --all --no-edit
  711  git push origin -f
  712  history
```

custom commnands

```bash

   65  apt install nfs-common
   66  kubectl get pods -n ci-de
   67  kubectl get pods -n ci-cd
   68  vim .kube/config
   69  kubectl get pods -n ci-cd
   70  kubectl describe pods jenkins-98cc45794-hsxcx -n ci-cd
   71  kubectl logs pods jenkins-98cc45794-hsxcx -n ci-cd
   72  kubectl logs enkins-98cc45794-hsxcx -n ci-cd
   73  kubectl logs jenkins-98cc45794-hsxcx -n ci-cd
   74  kubectl get ing -n ci-cd
   75* kubectl get pods
   76  kubectl get svc -n ingress-nginx
   77  kubectl edit svc ingress-nginx-controller -n ingress-nginx
   78  kubectl get svc -n ingress-nginx
   79  ip addr
   80  kubectl get secrets -n ci-cd
   81  kubectl get secrets jenkins-secret -o yaml
   82  kubectl get secrets jenkins-secret -n ci-cd -o yaml
   83  echo "XXXXX" | base64 -d
   84  kubectl rollout restart deployment jenkins -n ci-de
   85  kubectl rollout restart deployment jenkins -n ci-cd
   86  kubectl get pods -n ci-cd
   87  kubectl get pods -n ci-cd
   88  kubectl get pods -n ci-cd
   89  kubectl get pods -n ci-cd
   90  kubectl get replicasets.apps -n ci-cd
   91  kubectl delete replicasets.apps jenkins-98cc45794 -n ci-cd
   92  kubectl get replicasets.apps -n ci-cd
   93  kubectl get pods -n ci-cd
   94  kubectl get pods -n ci-cd -wide
   95  kubectl get pods -n ci-cd --wide
   96  apt install nfs-common
   97  kubectl get pods -n ci-cd
   98  kubectl describe pod jenkins-9ff555775-sgfhp -n ci-cd
   99  apt install nfs-common
  100  kubectl delete deployments.apps -n ci-cd jenkins
  101  kubectl get pods -n ci-cd
  102  kubectl get pods -n ci-cd
  103  kubectl describe pod jenkins-98cc45794-dfwbm -n ci-cd
  104  kubectl describe pod jenkins-98cc45794-dfwbm -n ci-cd
  105  kubectl describe pod jenkins-98cc45794-dfwbm -n ci-cd
  106  kubectl scale deployment jenkins -n ci-cd --replicas=0
  107  kubectl get deploy -n ci-cd
  108  kubectl scale deployment jenkins -n ci-cd --replicas=1
  109  kubectl get deploy -n ci-cd
  110  kubectl get pods -n ci-cd
  111  history
```

NFS 

```bash
   20  mkdir -p /mnt/IT-Academy/nfs-data/sa2-33-25/akaputerko/jenkins
   21  chmod 777 -R /mnt/IT-Academy/nfs-data/sa2-33-25/akaputerko/jenkins
   22  mkdir -p /mnt/test/sa2-33-25/spishchyk/jenkins
   23  chmod 777 -R /mnt/test/sa2-33-25/spishchyk/jenkins
   24  ls -l /mnt/
   25  ls -l /mnt/test/sa2-33-25/
   26  ls -l /mnt/test/sa2-33-25/svavchinnik
   27  mkdir /mnt/test/sa2-33-25/akaputerko/jenkins
   28  mkdir -p /mnt/test/sa2-33-25/akaputerko/jenkins
   29  chmod 777 /mnt/test/sa2-33-25/akaputerko/jenkins
   30  mkdir -p /mnt/test/sa2-33-25/romanstelchenko/jenkins
   31  ls -l /mnt/test/sa2-33-25/romanstelchenko/jenkins
   32  ls -l /mnt/test/sa2-33-25/romanstelchenko/jenkins/
   33  chmod 777 /mnt/test/sa2-33-25/romanstelchenko/jenkins
   34  rm -rf  /mnt/test/sa2-33-25/akaputerko/jenkins
   35  mkdir  /mnt/test/sa2-33-25/akaputerko/jenkins
   36  chmod 777  /mnt/test/sa2-33-25/akaputerko/jenkins
   37  history
```