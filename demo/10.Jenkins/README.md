```bash
4312  mkdir 10.Jenkins
 4313  cd 10.Jenkins
 4314  mkdir {master,node01}
 4315  cd master
 4316  vim Vagrantfile
 4317  vim bootstrap.sh
 4318  vim Vagrantfile
 4319  vim bootstrap.sh
 4320  vagrant up
 4321* top
 4322  docker search jenkins
 4323  docker run -d -p 8081:8080 jenkins/jenkins
 4324  docker run -d -p 8082:8080 jenkins/jenkins
 4325  docker ps
 4326  docker exec -it 1e1ea49db54d bash
 4327  docker kill 1e1ea49db54d
 4328  docker ps
 4329  cd  ../node01
 4330  vim Vagrantfile
 4331  vim authorized_keys
 4332  vim Vagrantfile
 4333  vagrant up
 4334  vim Vagrantfile
 4335  vagrant ssh
 4336  vagrant halt && vagrant destroy -f
 4337  rm -r .vagrant
 4338  cd ../master
 4339  vagrant halt && vagrant destroy -f
 4340  rm -r .vagrant
 4341  cd ../

```
