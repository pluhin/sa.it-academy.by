```bash 
2767  git clone git@github.com:pluhin/sa.it-academy.by.git
 2768  cd  sa.it-academy.by
 2769  git checkout m-sa2-12-20
 2770  cd demo
 2771  ls
 2772  mkdir 15.K8s
 2773  cd 15.K8s
 2774  ls
 2775  mkdir mini
 2776  cd mini
 2777  vim Vagrantfile
 2778  ping 192.168.1.201
 2779  ifconfig
 2780  vim Vagrantfile
 2781  vagrant up
 2782  cd /tmp/sa.it-academy.by/demo
 2783  cd 15.K8s/
 2784  ls
 2785  vim mini/Vagrantfile
 2786  minikube --help
 2787  minikube start --help
 2788* q!
 2789  minikube start
 2790  minikube stop
 2791  minikube stop --help
 2792  minikube start --help
 2793  minikube start --memory='4000mb'
 2794* vim mini/Vagrantfile
 2795* vim Vagrantfile
 2796* vagrant up
 2797  whereis conntrack
 2798* vagrant halt && vagrant destroy -f
 2799  kubectl cluster-info
 2800  minikube service list
 2801  minikube stop
 2802* vagrant up
 2803  minikube start
 2804  minikube service list
 2805  minikube stop
 2806  minikube delete
 2807  minikube start
 2808  kubectl proxy --address='0.0.0.0' --disable-filter=true
 2809  minikube dashboard
 2810  kubectl proxy --address='0.0.0.0' --disable-filter=true
 2811  kubectl get pod
 2812  kubectl get pods
 2813  kubectl get services
 2814  cd ../mi
 2815  cd mini
 2816  vagrant ssh
 2817  vim ~/.kube/config
 2818* vagrant halt && vagrant destroy -f
 2819  cd ../
 2820  cd fullK8s
 2821  vim Vagrantfile
 2822  vagrant up
 2823* cd /tmp
 2824* git clone git@github.com:kubernetes-sigs/kubespray.git
 2825* ccd kubespray
 2826* cd kubespray
 2827* ls
 2828* vim  requirements.txt
 2829* sudo pip3 install -r requirements.txt
 2830* cp -rfp inventory/sample inventory/plu
 2831  vim Vagrantfile
 2832* nmap 10.20.30.30-33
 2833* declare -a IPS=(10.20.30.30 10.20.30.31 10.20.30.33)
 2834* CONFIG_FILE=inventory/plu/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
 2835* vim inventory/plu/hosts.yaml
 2836* vim ansible.cfg
 2837* ansible-playbook -i inventory/plu/hosts.yaml -u vagrant -b cluster.yml
 2838  ls -l 
 2839* kubectl cluster-info
 2840* minikube stop
 2841* kubectl cluster-info
 2842  vagrant ssh master
 2843* vim /etc/nginx/conf.d/k8s_dashboard.conf
 2844* cd ../sa.it-academy.by/demo/15.K8s
 2845* vim history.md
 2846  vagrant halt && vagrant destroy -f
```

/tmp/kubespray/ansible.cfg 


```ini
timeout = 120
```


### History on master in full k8s

```bash
    1  kubectl cluster-info
    2  kubectl create serviceaccount dashboard-admin-
    3  kubectl create serviceaccount dashboard-admin-sa
    4  kubectl create clusterrolebinding dashboard-admin-sa --clusterrole=cluster-admin --serviceaccount=default:dashboard-admin-sa
    5  kubectl get secrets
    6  kubectl describe secret dashboard-admin-sa-token-vd5pr
    7  kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta8/aio/deploy/recommended.yaml
    8  kubectl proxy
    9  history

```
