## shell history

390  mkdir jenkins-helm
  391  ls
  392  cd jenkins-helm/
  393  ls
  394  ls
  395  cd jenkins-helm/
  396  ls
  397  helm create --helm
  398  helm create --help
  399  helm create jenkins
  400  ls
  401  cd ..
  402  ls
  403  cd jenkin
  404  ls
  405  cp deploy.yaml ~/jenkins-helm/jenkins/
  406  ls
  407  ls
  408  cd ..
  409  ls
  410  cd jenkins-helm/
  411  ls
  412  cd jenkins/
  413  ls
  414  cat Chart.yaml
  415  mc
  416  ls
  417  nano Chart.yaml
  418  ls
  419  cd charts/
  420  ls
  421  cd ..
  422  ls
  423  mv deploy.yaml
  424  ls
  425  ls
  426  cd jenkins-helm/
  427  ls
  428  cd jenkins/
  429  ls
  430  cd charts/
  431  ls
  432  rm jenkins.yml
  433  ls
  434  cd ..
  435  ls
  436  nano deploy.yaml
  437  ды
  438  ls
  439  cd jenkins-helm/
  440  ls
  441  cd jenkins/
  442  ls
  443  cp deploy.yaml charts/jenkins.yml
  444  nano values.yaml
  445  ls
  446  cd charts/
  447  ls
  448  nano jenkins.yml
  449  ls
  450  cd ..
  451  ls
  452  cd templates/
  453  ls
  454  cat deployment.yaml
  455  ls\
  456  ls
  457  cat ingress.yaml
  458  cat service.yaml
  459  ls
  460  ls
  461  cd ..
  462  ls
  463  cd templates/
  464  ls
  465  nano deployment.yaml
  466  ls
  467  nano hpa.yaml
  468  ls
  469  nano ingress.yaml
  470  nano namespace.yml
  471  cat deployment.yaml
  472  ls
  473  rm *
  474  rm -rf *
  475  ls
  476  ls
  477  nano configmap-jenkins-config.yaml
  478  ls
  479  helm install --debug --dry-run test-telease /root/jenkins-helm/jenkins/
  480  nano configmap-jenkins-config.yaml
  481  lls
  482  ls
  483  nano configmap-basic-security.yml
  484  nano service.yml
  485  nano service.yml
  486  nano service.yml
  487  nano ingress.yml
  488  nano ingress.yml
  489  ls
  490  cat service.yml
  491  ls
  492  cat configmap-basic-security.yml
  493  cat configmap-jenkins-config.yaml
  494  nano ingress.yml
  495  ls
  496  nano deployment.yml
  497  nano clusterrolebingin-jenkins.yml
  498  nano secret.yml
  499  ls
  500  ls
  501  ls
  502  cd jenkins-helm/
  503  ls
  504  cd jenkins/
  505  ls
  506  cd templates/
  507  ls
  508  cp configmap-basic-security.yml configmap-test-job.yml
  509  nano configmap-test-job.yml
  510  nano configmap-test-job.yml
  511  ls
  512  nano deployment.yml
  513  cd ..
  514  ls
  515  helm upgrade --debug test-telease /root/jenkins-helm/jenkins/ -f values_custom.yaml
  516  kubectl get pods -A
  517  helm upgrade --debug -n jenkins-test test-telease /root/jenkins-helm/jenkins/ -f values_custom.yaml
  518  helm upgrade --debug -n jenkins-test test-release /root/jenkins-helm/jenkins/ -f values_custom.yaml
  519  helm upgrade --debug -n jenkins-test /root/jenkins-helm/jenkins/ -f values_custom.yaml
  520  helm upgrade test-release --debug -n jenkins-test /root/jenkins-helm/jenkins/ -f values_custom.yaml
  521  ls
  522  kubectl get pods -A
  523  helm upgrade jenkins-release --debug -n jenkins-test /root/jenkins-helm/jenkins/ -f values_custom.yaml
  524  ls
  525  cd templates/
  526  ls
  527  nano configmap-test-job.yml
  528  helm upgrade jenkins-release --debug -n jenkins-test /root/jenkins-helm/jenkins/ -f values_custom.yaml
  529  cd ..
  530  helm upgrade jenkins-release --debug -n jenkins-test /root/jenkins-helm/jenkins/ -f values_custom.yaml
  531  ls
  532  nano templates/configmap-test-job.yml
  533  helm upgrade jenkins-release --debug -n jenkins-test /root/jenkins-helm/jenkins/ -f values_custom.yaml
  534  nano templates/configmap-test-job.yml
  535  helm upgrade jenkins-release --debug -n jenkins-test /root/jenkins-helm/jenkins/ -f values_custom.yaml
  536  ls
  537  kubectl get pods -A
  538  helm uninstall jenkins-release --debug -n jenkins-test /root/jenkins-helm/jenkins/ -f values_custom.yaml
  539* helm uninstall --debug -n jenkins-test /root/jenkins-helm/jenkins/
  540  kubectl describe pod jenkins-release-jenkins-85d4bcbc89-2rlnb -n jenkins-test
  541  kubectl describe pod jenkins-release-jenkins-85dbccb4d7-b5xmn -n jenkins-test
  542  kubectl get pods -A
  543  helm install jenkins-release --debug -n jenkins-test /root/jenkins-helm/jenkins/ -f values_custom.yaml
  544  kubectl get pods -A
  545  kubectl get pods -A
  546  kubectl get pods -A
  547  kubectl get pods -A
  548  kubectl get pods -A
  549  kubectl get pods -A
  550  kubectl get pods -A
  551  kubectl get pods -A
  552  kubectl get pods -A
  553  kubectl get pods -A
  554  kubectl get pods -A
  555  kubectl get pods -A
  556  kubectl get pods -A
  557  kubectl get pods -A
  558  kubectl get pods -A
  559  kubectl get pods -A
  560  kubectl get pods -A
  561  kubectl get pods -A
  562  kubectl get pods -A
  563  kubectl get pods -A
  564  kubectl get pods -A
  565  kubectl get pods -A
  566  kubectl get pods -A
  567  kubectl get pods -A
  568  kubectl get pods -A
  569  kubectl get pods -A
  570  kubectl get pods -A
  571  kubectl get pods -A
  572  kubectl get pods -A
  573  kubectl get pods -A
  574  kubectl get pods -A
  575  kubectl describe pod ingress-nginx-controller-5b89d58656-c6jzb -n jenkins-test
  576  kubectl get pods -A
  577  kubectl describe pod jenkins-release-jenkins-85dbccb4d7-lqrwx -n jenkins-test
  578  helm uninstall jenkins-release --debug -n jenkins-test /root/jenkins-helm/jenkins/
  579  helm uninstall jenkins-releases
  580  helm uninstall jenkins-release
  581  kubectl get pods -A
  582  helm install jenkins-release --debug -n jenkins-test /root/jenkins-helm/jenkins/ -f values_custom.yaml
  583  kubectl get pods -A
  584  kubectl get pods -A
  585  kubectl get pods -A
  586  kubectl describe pods jenkins-release-jenkins-85dbccb4d7-7d8rr -A
  587  kubectl describe pods jenkins-release-jenkins-85dbccb4d7-7d8rr -n jenkins-test
  588  nano templates/deployment.yml
  589  helm uninstall jenkinse-release
  590  helm uninstall jenkins-release
  591  helm uninstall jenkins-release
  592  helm install uninstall --debug -n jenkins-test /root/jenkins-helm/jenkins/
  593  helm uninstall --debug -n jenkins-test /root/jenkins-helm/jenkins/
  594  helm install jenkins-release --debug -n jenkins-test /root/jenkins-helm/jenkins/ -f values_custom.yaml
  595  helm uninstall --debug -n jenkins-test /root/jenkins-helm/jenkins/
  596  helm uninstall jenkins-release --debug -n jenkins-test /root/jenkins-helm/jenkins/
  597  helm install jenkins-release --debug -n jenkins-test /root/jenkins-helm/jenkins/ -f values_custom.yaml
  598  kubectl get pods
  599  kubectl get pods -n jenkins-test
  600  kubectl describe pods jenkins-release-jenkins-7699549688-bhbhr -n jenkins-test
  601  kubectl describe pods jenkins-release-jenkins-7699549688-bhbhr -n jenkins-test
  602  kubectl describe pods jenkins-release-jenkins-7699549688-bhbhr -n jenkins-test
  603  kubectl describe pods jenkins-release-jenkins-7699549688-bhbhr -n jenkins-test
  604  kubectl logs jenkins-release-jenkins-7699549688-bhbhr -n jenkins-test
  605  kubectl describe pods jenkins-release-jenkins-7699549688-bhbhr -n jenkins-test
  606  kubectl delete pods jenkins-release-jenkins-7699549688-bhbhr -n jenkins-test
  607  kubectl get pods -n jenkins-test
  608  kubectl describe pods -n jenkins-test
  609  kubectl describe pods -n jenkins-test
  610  kubectl describe pods -n jenkins-test
  611  kubectl describe pods -n jenkins-test
  612  kubectl describe pods -n jenkins-test
  613  kubectl describe nodes
  614  ls
  615  ls
  616  cd ..
  617  ls
  618  mkdir helm-sources
  619  mv jenkins/ helm-sources/
  620  cd helm-sources/
  621  ls
  622  cd ..
  623  ls
  624  mkdir helm releases
  625  ls
  626  rm helm
  627  rmdir helm
  628  rmdir releases
  629  mkdir helm-releases
  630  ls
  631  helm package helm-sources/jenkins
  632  ls
  633  mv jenkins-0.1.0.tgz helm-releases/
  634  git init
  635  git remote add origin https://github.com/t1wg/helm-releases.git
  636  git branch -M main
  637  ls -l
  638  git add .
  639  git commit -m "init"
  640  git config --global user.email "surgelandrey@gmail.com"
  641  git config --global user.name "Surgel Andrey"
  642  git push -u origin main
  643  git status
  644  git commit -m "init"
  645  git push -u origin main
  646  git push -u origin main
  647  git push -u origin main
  648  git push -u origin main
  649  ssh-keygen
  650  cat ~/.ssh/id_rsa
  651  cat ~/.ssh/id_rsa.pub
  652  git push -u origin main
  653  nano .git/config
  654  git push -u origin main
  655  ls
  656  nano index.html
  657  git add --all
  658  git commit -m "add index:"
  659  git push
  660  helm repo add helm-releases https://t1wg.github.io/helm-releases/
  661  ls
  662  ls
  663  helm --help
  664  ls
  665  cat helm-releases/
  666  cat helm-sources/jenkins/Chart.yaml
  667  ls
  668  cd helm-releases/
  669  ls
  670  helm repo index --url "https://t1wg.github.io/helm-releases/" --merge index.yaml .
  671  ls
  672  cat index.yaml
  673  cd ..
  674  ls
  675  helm repo index --url "https://t1wg.github.io/helm-releases/" --merge index.yaml .
  676  ls
  677  cat index.yaml
  678  git add .
  679  git commit -m "add index.yaml"
  680  git push
  681  cat index.yaml
  682  ls
  683  mv helm-sources/jenkins/values_custom.yaml values_custom.yaml
  684  ls
  685  git add .
  686  git commit -m "add custom values"
  687  git push
  688  ls
