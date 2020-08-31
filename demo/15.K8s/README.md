# K8s

## Minikube

```Vagrantfile

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"
  config.ssh.insert_key = false
  config.vm.define "minikube" do |kube|
  config.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
      vb.cpus = "4"
  end
  config.vm.network "public_network", ip: "192.168.1.201",  bridge: "eno1"
  config.vm.network "forwarded_port",
      guest: 30000,
      host:  30000,
      auto_correct: true

  config.vm.network "forwarded_port",
      guest: 80,
      host:  80,
      auto_correct: true

  config.vm.network "forwarded_port",
      guest: 443,
      host:  443,
      auto_correct: true

    config.vm.provision "kubectl", type: "shell",  inline: <<-SCRIPT
echo "Installing kubectl"
apt-get -qq update && apt-get install -qqy apt-transport-https conntrack
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubectl.list
apt-get update -qq
apt-get install -qqy kubectl
SCRIPT


    config.vm.provision "docker", type: "shell", inline: <<-SCRIPT
sudo apt-get remove docker docker-engine docker.io
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
sudo apt-get update -qq
sudo apt-get install -yqq docker-ce
usermod -aG docker vagrant
sudo docker run hello-world
SCRIPT

    config.vm.provision "minikube", type: "shell", inline: <<-SCRIPT
echo "Downloading minikube"
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin
SCRIPT

    config.vm.provision "k8s", type: "shell", inline: <<-SCRIPT
echo "Setting up and starting K8S"
sudo minikube start --vm-driver none
sudo kubectl cluster-info
sudo kubectl proxy --address='0.0.0.0' --disable-filter=true  &
sudo minikube dashboard --url
SCRIPT
  end

end

```

## Mini intsall/run 

```bash
 4751  cd  k8s_mini
 4752  vim Vagrantfile
 4753  ifconfig
 4754  vim Vagrantfile
 4755  vagrant up
 4756  minikube --help
 4757  minikube start --help
 4758  minikube start
 4759  kubectl cluster-info
 4760  minikube status
 4761  kubectl get nodes
 4762  kubectl proxy --address='0.0.0.0' --disable-filter=true
 4763  kubectl proxy --address='0.0.0.0' --disable-filter=true &&
 4764  kubectl proxy --address='0.0.0.0' --disable-filter=true &
 4765  kubectl get services --all-namespaces
 4766  minikube dashboard
 4767  minikube ssh
 4768  minikube stop
 4769  vim /tmp/k8s_mini/Vagrantfile
 4770* vagrant halt && vagrant destroy -f
```

---

## K3s

```Vagrantfile
$script = <<-SCRIPT
export DEBIAN_FRONTEND=noninteractive
apt-get update && apt-get upgrade -yqq
apt-get install -yqq vim mc net-tools
cat /tmp/pub_key.pub >> /home/vagrant/.ssh/authorized_keys
chown vagrant:vagrant /home/vagrant/.ssh/authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
SCRIPT

PUB_KEY_PATH = "~/.ssh/id_rsa.pub"

MACHINES = {
  'k3s-1'  =>  { vcpu: '1', ram: '2048', ip: '192.168.1.222'},
#  'k3s-2' =>  { vcpu: '1', ram: '2048', ip: '192.168.1.223'},
}

INSTANCES = MACHINES.flat_map do |server_name, server|
    server.merge({
      :vagrant_name => "#{server_name}",
    })
end

Vagrant.configure("2") do |config|
  config.vm.synced_folder ".", "/vagrant", disabled: true

  INSTANCES.each do |instance|
    config.vm.define instance[:vagrant_name] do |node|
      node.vm.box = "bento/debian-10"
      node.vm.hostname = instance[:vagrant_name]
      node.vm.network "public_network", ip: instance[:ip], bridge: "eno1"
      node.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.memory = instance[:ram]
        vb.cpus = instance[:vcpu]
      end
      node.vm.provision "file", source: PUB_KEY_PATH, destination: "/tmp/pub_key.pub"
      node.vm.provision "shell", inline: $script
    end
  end
end

```

## K3s Install

```bash
root@k3s-1:~# history 
    1  curl -sfL https://get.k3s.io | sh -
    2  kubectl get nodes
    3  kubectl get nodes
    4  kubectl get services
    5  kubectl get services --all-nodes
    6  kubectl get services --all-namespases
    7  kubectl get services --all-namespaces
    8  ifconfig 
    9  vim /etc/rancher/k3s/k3s.yaml 
   10  cat /etc/rancher/k3s/k3s.yaml 
   11  vim dashboard.yaml
   12  kubectl create -f dashboard.yaml
   13  cat /etc/rancher/k3s/k3s.yaml 
   14  kubectl get secrets
   15  kubectl create serviceaccount dashboard-admin-sa
   16  kubectl create clusterrolebinding dashboard-admin-sa --clusterrole=cluster-admin --serviceaccount=default:dashboard-admin-sa
   17  kubectl get secrets
   18  kubectl describe secret dashboard-admin-sa-token-s4d9x
   19  history 


```

## K8s 

```bash
 8575  git clone git@github.com:kubernetes-sigs/kubespray.git
 8576  cd kubespray
 8577  rm -rf .git*
 8578  cp -rfp inventory/sample inventory/plu
 8579  declare -a IPS=(192.168.254.XXX 192.168.254.XXX)
 8580  CONFIG_FILE=inventory/plu/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
 8581  ansible-playbook -i inventory/plu/hosts.yaml --become-user=root --become-method=su cluster.yml -u user --ask-pass --ask-become-pass --become
 8582  vim ~/.ssh/config
 8583  cd ../
 8584  cd 15.K8s
 8585  home_connect_local
 8586* ansible-playbook -i inventory/plu/hosts.yaml --become-user=root --become-method=su cluster.yml -u user --ask-pass --ask-become-pass --become
```