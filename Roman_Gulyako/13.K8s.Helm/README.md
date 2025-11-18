#### Install Helm:
```bash
wget https://get.helm.sh/helm-v4.0.0-linux-amd64.tar.gz
tar -zxvf helm-v4.0.0-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm
helm version
```

#### Install Wordpress
Setting file: `wordpress-values.yaml`
```bash
helm install app1-wordpress oci://registry-1.docker.io/bitnamicharts/wordpress -n apps  -f wordpress-values.yaml
```

#### Install Drupal:
Setting file: `drupal-values.yaml`
```bash
helm install app2-drupal oci://registry-1.docker.io/bitnamicharts/drupal -n apps        -f drupal-values.yaml
```

#### Screenshots of posts with personal title:
Files: 
- `wordpress-post.png`
- `drupal-post.png`

