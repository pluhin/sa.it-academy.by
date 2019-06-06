## 08.Jenkins.Start

1. Setup Vagrant file

* initialize vagrant in current directory
`vagrant init` # create Vagrantfile

* edit Vagrantfile
[Vagrantfile](./Vagrantfile)
plus statrup.sh(install packages, create user etc.)

* start virtual mashine
`vagrant up`

2. Install Jenkins && Default settings setup

* (startup.sh)
* create node (vagrant, autorized_key)
* make Credentials; add id_rsa(private)
* add node 

3. Hide Jenkins behind the web server Ngnix (revers proxy)

* install nginx
```bash
yum install epel-release
yum install nginx
```
* edit /etc/nginx/nginx.conf
[nginx.conf](./nginx.conf)

* `sysctl nginx start`
