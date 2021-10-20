
```bash
    1  history
    2  sudo apt-get update
    3  sudo apt-get install     apt-transport-https     ca-certificates     curl     gnupg     lsb-release
    4  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    5  echo   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    6    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    7  sudo apt-get update
    8  sudo apt-get install docker-ce docker-ce-cli containerd.io
    9  sudo usermod -aG docker $USER
   10  sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compos
   11  sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
   12  docker-compose
   13  sudo chmod +x /usr/local/bin/docker-compose
   14  docker-compose
   15  docker-compose --version
   16  mkdir demo/{1-6}
   17  mkdir -p demo/{1-6}
   18  cd demo/1
   19  mkdir demo/{1..6}
   20  cd demo/1
   21  vim docker-compose.yaml
   22  docker-compose up
   23  docker-compose down --volumes
   24  ip addr
   25  cd demo/1/
   26  docker-compose up -d
   27  vim docker-compose.yaml
   28  docker-compose restart db
   29  docker-compose restart drupal
   30  docker-compose exec drupal bash
   31  docker-compose logs drupal
   32  docker-compose logs db
   33  docker-compose down
   34  cd ../2
   35  vim docker-compose.yaml
   36  vim Dockerfile
   37  vim index.html
   38  vim nginx.conf
   39  docker-compose up -d
   40  vim docker-compose.yaml
   41  docker-compose down --volumes
   42  cd ../3
   43  vim docker-compose.yaml
   44  mkdir app
   45  vim app/index.html
   46  docker volume create --driver local --opt type=none --opt device=`pwd`/app  --opt o=bind data
   47  docker volume list
   48  docker-compose up -d
   49  docker volume inspect data
   50  ls -l "/var/lib/docker/volumes/data/_data"
   51  sudo ls -l /var/lib/docker/volumes/data/_data
   52  sudo ls -l /var/lib/docker/volumes/data/
   53  curl -I http://localhst:8200
   54  curl -I http://localhost:8200
   55  curl -I http://localhost:8100
   56  docker-compose down --volumes
   57  ls -l
   58  cd ../4
   59  vim docker-compose.yaml
   60  cp -r ../3/app ./
   61  ls
   62  vim docker-compose.yaml
   63  sudo apt install nfs-kernel-server
   64  sudo apt install nfs-common
   65  vim docker-compose.yaml
   66  mkdir /opt/dc/
   67  mkdsudo ir /opt/dc/
   68  sudo mkdir /opt/dc/
   69  sudo /etc/exports
   70  sudo vim /etc/exports
   71  sudo export -a
   72  sudo exports -a
   73  sudo exportfs -ra
   74  docker-compose up
   75  sudo docker-compose up
   76  sudo service nfs status
   77  sudo systemctl restart nfs-kernel-server
   78  docker-compose up
   79  vim docker-compose.yaml
   80  mkdir /mnt/test
   81  sudo mkdir /mnt/test
   82  sudo mount 192.168.2.150:/opt/dc /mnt/test/
   83  ls -l /mnt/test/
   84  cp ../3/app/index.html /opt/dc/
   85  sudo cp ../3/app/index.html /opt/dc/
   86  ls -l /mnt/test/
   87  df
   88  df -h
   89  sudo umount /mnt/test
   90  df -h
   91  docker volume list
   92  docker volume rm 4_data_nfs
   93  docker volume list
   94  docker-compose up
   95  vim docker-compose.yaml
   96  docker-compose up
   97  cd ../5
   98  vim docker-compose.yaml
   99  ls
  100  cp -r ../4/app/ ./
  101  vim docker-compose.yaml
  102  vim .env
  103  vim docker-compose.yaml
  104  docker-compose up -d
  105  vim app/app.php
  106  vim docker-compose.yaml
  107  vim .env
  108  vim app/app.php
  109  docker-compose down
  110  docker-compose up
  111  vim app/app.php
  112  cd ../6
  113  curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
  114  sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
  115  sudo apt install terraform
  116  terraform --version
  117  vim main.tf
  118  terraform init
  119  ls -la
  120  vim main.tf
  121  terraform plan
  122  terraform apply --auto-approve
  123  vim main.tf
  124  terraform plan
  125  terraform apply --auto-approve
  126  cd
  127  cp -r demo/ /vagrant/
  128  history
```

## NFS file

```bash
vagrant@vagrant:~$ cat /etc/exports
# /etc/exports: the access control list for filesystems which may be exported
#		to NFS clients.  See exports(5).
#
# Example for NFSv2 and NFSv3:
# /srv/homes       hostname1(rw,sync,no_subtree_check) hostname2(ro,sync,no_subtree_check)
#
# Example for NFSv4:
# /srv/nfs4        gss/krb5i(rw,sync,fsid=0,crossmnt,no_subtree_check)
# /srv/nfs4/homes  gss/krb5i(rw,sync,no_subtree_check)
#
/opt/dc   *(rw,sync,no_subtree_check)
```


