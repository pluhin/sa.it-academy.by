
##### Add index.php page as config map, which should display hostname of pod as first level header, or generate index.html inside init container

Results for the first task: `1.png` `2.png` `3.png` `4.png`
file `nginx_deploy.yaml`

##### generate pair public and private keys (or use existing) and add them to the pod for user root as secrets, please use sealsecret object for that
```bash
ssh-keygen
cat init_secret.yaml | kubeseal --format yaml > sealed_secret.yaml
```

```bash
root@nginx-deployment-5f7b894d9c-tk276:/#  ls /root/.ssh
id_rsa	id_rsa.pub
```
file `sealed_secret.yaml`