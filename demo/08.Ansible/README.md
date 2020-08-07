```bash
4207  mkdir 08.Ansible
 4208  cd 08.Ansible
 4209  mc
 4210  clear
 4211  ls -l
 4212  vim facts.yaml
 4213  mc
 4214  vim inv.yaml 
 4215  vim facts.yaml
 4216  ansible facts.yaml -i inv.yaml
 4217  ansible-playbook facts.yaml -i inv.yaml
 4218  vim facts.yaml
 4219  ansible-playbook facts.yaml -i inv.yaml
 4220  vim facts.yaml
 4221  vim inv.yaml 
 4222  vim facts.yaml
 4223  vim inv.yaml 
 4224  vim facts.yaml
 4225  vim inv.yaml 
 4226  ansible-playbook facts.yaml -i inv.yaml
 4227  vim inv.yaml 
 4228  vim facts.yaml
 4229  vim local.yaml
 4230  ansible-playbook facts.yaml -i local.yaml
 4231  ansible-playbook -i inv.yaml local.yaml
 4232  vim local.yaml
 4233  ansible-playbook -i inv.yaml local.yaml
 4234  vim local.yaml
 4235  ansible-playbook -i inv.yaml local.yaml
 4236  vim local.yaml
 4237  ansible-playbook -i inv.yaml local.yaml
 4238  vim local.yaml
 4239  ansible-playbook -i inv.yaml local.yaml
 4240  vim local.yaml
 4241  ansible-playbook -i inv.yaml local.yaml
 4242  vim loop.yaml
 4243  ansible-playbook -i inv.yaml loop.yaml
 4244  vim loop.yaml
 4245  mc
 4246  ls
 4247  ls -l
 4248  ansible-lint play.yaml
 4249  vim play.yaml
 4250  vim roles/web/handlers/main.yaml
 4251  vim roles/web/tasks/main.yaml
 4252  ansible-lint play.yaml
 4253  ansible-lint local.yaml
 4254  vim ansible_lint_conf.yaml
 4255  ansible-lint local.yaml
 4256  ansible-lint local.yaml -c ansible_lint_conf.yaml
 4257  ls
 4258  cd roles
 4259  ls
 4260  cd web
 4261  ls
 4262  sudo pip3 install molecule
 4263  molecule varsion
 4264  molecule version
 4265  molecule --version
 4266  molecule init scenario
 4267  ls -l
 4268  ls -la
 4269  vim molecule/default/molecule.yml
 4270  molecule test
 4271  vim roles/web/tasks/main.yaml
 4272  vim tasks/main.yaml
 4273  molecule test
 4274  ls -l
 4275  vim molecule/default/molecule.yml
 4276  cd ../../

```
