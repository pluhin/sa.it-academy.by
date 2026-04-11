```bash
 1013  curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh
 1014  chmod +x install-opentofu.sh
 1015  ./install-opentofu.sh --install-method deb
 1016  sudo apt-get install -y tofu
 1017  ls
 1018  rm install-opentofu.sh
 1019  ls
 1020  vim mani
 1021  vim main.tf
 1022  tofu init
 1023  vim main.tf
 1024  ls
 1025  vim versions.tf
 1026  rm versions.tf
 1027  vim main.tf
 1028  tofu init
 1029  tofu plan
 1030  docker ps
 1031  tofu apply
 1032  docker ps
 1033  tofu plan
 1034  tofu apply
 1035  tofu destroy
 1036  tofu plan
 1037  tofu apply
 1038  vim main.tf
 1039  tofu plan
 1040  tofu apply
 1041  vim main.tf
 1042  tofu plan
 1043  tofu apply
 1044  vim main.tf
 1045  tofu destroy
 1046  ls -l
 1047  ls -la
 1048  vim terraform.tfstate.backup
 1049  cd ../../
 1050  cd Terragrunt/
 1051  l
 1052  ls
 1053  cd terragrunt-k8s-demo/
 1054  ls
 1055  vim modules/nginx/main.tf
 1056  vim modules/nginx/variables.tf
 1057  vim modules/namespace/main.tf
 1058  vim modules/namespace/variables.tf
 1059  vim live/pre-prod/nginx/terragrunt.hcl
 1060  vim live/terragrunt.hcl
 1061  vim live/pre-prod/namespace/terragrunt.hcl
 1062  vim live/pre-prod/nginx/terragrunt.hcl
 1063  vim live/prod/nginx/terragrunt.hcl
 1064  wget https://github.com/gruntwork-io/terragrunt/releases/download/v1.0.0/terragrunt_linux_amd64 -O terragrunt
 1065  ls
 1066  chmod +x terragrunt
 1067  sudo mv terragrunt /usr/local/bin/
 1068  terragrunt
 1069  terragrunt run --all plan
 1070  terragrunt run --all apply
 1071  terragrunt run --all destroy
 1072  history
```


## Install tofu
```bash
curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh
chmod +x install-opentofu.sh
./install-opentofu.sh --install-method deb
rm -f install-opentofu.sh
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg
sudo apt-get update
sudo apt-get install -y tofu

```

## Deploy and check with tofu

```bash
tofu init
tofu plan
tofu apply
docker ps
tofu destroy
```
