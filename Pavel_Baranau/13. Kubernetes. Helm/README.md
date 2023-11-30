# 13. Kubernetes. Helm
## Install DB
ansible-playbook -i inv.yaml mariadb.yaml -e name_db=drupal -e user_db=drupal -e pass_db=drupal -l mysql -u root --ask-pass
ansible-playbook -i inv.yaml mariadb.yaml -e name_db=wordpress -e user_db=wordpress -e pass_db=wordpress -l mysql -u root --ask-pass

## General command
``` bash
kubectl apply -f ingress.yaml
kubectl apply -f nfs-dir.yaml
sudo nano /etc/hosts
helm repo add my-repo https://charts.bitnami.com/bitnam
helm search repo my-repo
helm install drupal  --set mariadb.enabled=false,externalDatabase.host=192.168.202.1,externalDatabase.password=drupal,externalDatabase.user=drupal,externalDatabase.database=drupal,global.storageClass=nfs-drupal,drupalUsername=baranau,drupalPassword=baranau,ingress.enabled=true,ingress.hostname=drupal.k8s-1.sa,ingress.annotations="kubernetes.io/ingress.class: nginx"  my-repo/drupal
helm install sa-wordpress  --set mariadb.enabled=false,externalDatabase.host=192.168.202.1,externalDatabase.password=wordpress,externalDatabase.user=wordpress,externalDatabase.database=wordpress,global.storageClass=nfs-wordpress,wordpressUsername=baranau,wordpressPassword=baranau,wordpressEmail=baranau@gmail.com,wordpressFirstName=Pavel,wordpressLastName=Baranau,wordpressBlogName=Baranau,ingress.enabled=true,ingress.hostname=wordpress.k8s-1.sa,ingress.annotations="kubernetes.io/ingress.class: nginx" my-repo/wordpress
```

![wordpress](https://i.ibb.co/B2VsfLN/Screenshot-from-2023-11-28-02-15-21.png)
![drupal](https://i.ibb.co/KyH8zzq/Screenshot-from-2023-11-28-02-16-37.png)
![k9s pvc](https://i.ibb.co/yB7bVmn/Screenshot-from-2023-11-28-02-23-35.png)
