```bash
  886  curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh
  887  chmod +x install-opentofu.sh
  888  ./install-opentofu.sh --install-method deb
  889  rm -f install-opentofu.sh
  890  df -h
  891  cd terra
  892  cd terrafrom/
  893  vim main.tf
  894  tofu init
  895  ls
  896  ls -la
  897  tofu plan
  898  tofu apply
  899  ls -l
  900  cat terraform.tfstate
  901  tofu destroy
  902  cd ../
  903  cd terragrunt/
  904  vim modules/namespace/main.tf
  905  vim modules/namespace/variables.tf
  906  vim modules/namespace/outputs.tf
  907  vim modules/nginx/main.tf
  908  vim modules/nginx/variables.tf
  909  vim live/provider.tf
  910  vim live/terragrunt.hcl
  911  rm live/provider.tf
  912  vim live/terragrunt.hcl
  913  vim live/pre-prod/namespace/terragrunt.hcl
  914  vim live/pre-prod/nginx/terragrunt.hcl
  915  curl -sSfL --proto '=https' --tlsv1.2 https://terragrunt.com/install | bash
  916  echo 'export PATH="/home/user/.terragrunt/bin:$PATH"' >> /home/user/.bashrc
  917  source /home/user/.bashrc
  918  terragrunt run --all plan
  919  terragrunt run --all apply
  920  vim live/pre-prod/nginx/terragrunt.hcl
  921  terragrunt run --all plan
  922  terragrunt run --all apply
  923  terragrunt run --all destroy
  924  history
```