
```bash
    3  cd ansible/
    4  ls
    5  cat inv.yaml
    6  vim web.yaml
    7  cat inv.yaml
    8  vim web.yaml
    9  mkdir -p roles/webserver/{tasks,handlers,defaults,files,templates}
   10  ls -l roles/
   11  ls -l roles/webserver/
   12  vim roles/webserver/tasks/main.yaml
   13  vim roles/webserver/tasks/http_deb.yaml
   14  vim roles/webserver/tasks/http_rh.yaml
   15  vim roles/webserver/tasks/main.yaml
   16  vim roles/webserver/defaults/main.yaml
   17  ansible-playbook web.yaml -i inv.yaml
   18  ansible -m ping -i inv.yaml all
   19  ansible-playbook web.yaml -i inv.yaml
   20  vim roles/webserver/tasks/main.yaml
   21  vim roles/webserver/files/index.html
   22  vim roles/webserver/handlers/main.yaml
   23  vim roles/webserver/tasks/main.yaml
   24  vim roles/webserver/defaults/main.yaml
   25  ansible-playbook web.yaml -i inv.yaml
   26  vim roles/webserver/tasks/main.yaml
   27  ansible-playbook web.yaml -i inv.yaml
   28  vim roles/webserver/tasks/main.yaml
   29  vim roles/webserver/templates/hosts.j2
   30  vim roles/webserver/defaults/main.yaml
   31  vim roles/webserver/templates/hosts.j2
   32  vim roles/webserver/tasks/main.yaml
   33  ansible-playbook web.yaml -i inv.yaml
   34  vim roles/webserver/tasks/main.yaml
   35  ansible-playbook web.yaml -i inv.yaml -t tests
   36  vim local.yaml
   37  ansible-playbook local.yaml -e "slack_token=XXXXXXXXXXXXXXX"
   38  vim local.yaml
   39  pip3 install ansible-lint
   40  pip3 install ansible-lint --upgade --force-reinstall
   41  pip3 install ansible-lint --upgrade --force-reinstall
   42  ansible-lint
   43  env
   44  env | grep path
   45  env | grep PATH
   46  cp /home/vagrant/.local/bin/ansible-lint /usr/local/bin
   47  sudo cp /home/vagrant/.local/bin/ansible-lint /usr/local/bin
   48  ansible-lint
   49  ansible-lint --version
   50  sudo rm /usr/local/bin/ansible-lint
   51  export PATH="$HOME/.local/bin:$PATH"
   52  ansible-lint
   53  ansible-lint web.yaml
   54  vim web.yaml
   55  ansible-lint web.yaml
   56  vim web.yaml
   57  ansible-lint web.yaml
   58  vim web.yaml
   59  ansible-playbook --check web.yaml
   60  vim web.yaml
   61  ansible-playbook --check web.yaml
   62  vim web.yaml
   63  pip3 install molecule
   64  molecule
   65  pip3 install molecule molecule-docker
   66  apt-get install     apt-transport-https     ca-certificates     curl     gnupg     lsb-release
   67  sudo apt-get install     apt-transport-https     ca-certificates     curl     gnupg     lsb-release
   68  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
   69  echo   "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
   70    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   71  sudo apt-update
   72  sudo apt-get update
   73  apt-get install docker-ce docker-ce-cli containerd.io
   74  sudo apt-get install docker-ce docker-ce-cli containerd.io
   75  usermod -aG docker vagrant
   76  sudo usermod -aG docker vagrant
   77  cd ansible/
   78  cd roles/webserver/
   79  molecule init scenario -d docker
   80  ls -l
   81  molecule test
   82  vim molecule/default/molecule.yml
   83  molecule test
   84  vim molecule/default/molecule.yml
   85  molecule test
   86  vim molecule/default/molecule.yml
   87  history
```