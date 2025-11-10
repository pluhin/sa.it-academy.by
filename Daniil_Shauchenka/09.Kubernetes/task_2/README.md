```

kubectl cluster-info
Kubernetes control plane is running at https://192.168.49.2:8443
CoreDNS is running at https://192.168.49.2:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
docker ps
CONTAINER ID   IMAGE                                 COMMAND                  CREATED          STATUS          PORTS                                                                                                                                  NAMES
43bcc34f87bd   gcr.io/k8s-minikube/kicbase:v0.0.48   "/usr/local/bin/entr…"   18 minutes ago   Up 18 minutes   127.0.0.1:32768->22/tcp, 127.0.0.1:32769->2376/tcp, 127.0.0.1:32770->5000/tcp, 127.0.0.1:32771->8443/tcp, 127.0.0.1:32772->32443/tcp   minikube
0976c32adeee   docker-compose-1-app                  "java -jar app.jar"      3 hours ago      Up 3 hours      0.0.0.0:8080->8080/tcp, [::]:8080->8080/tcp                                                                                            app
a702a3bf637d   postgres:15                           "docker-entrypoint.s…"   3 hours ago      Up 3 hours      0.0.0.0:5432->5432/tcp, [::]:5432->5432/tcp                                                                                            postgres-db
36e8daf729d1   kindest/node:v1.30.0                  "/usr/local/bin/entr…"   5 days ago       Up 5 days       127.0.0.1:33375->6443/tcp                                                                                                              demo-cluster-control-plane
ndocker info
Client: Docker Engine - Community
 Version:    28.5.1
 Context:    default
 Debug Mode: false
 Plugins:
  buildx: Docker Buildx (Docker Inc.)
    Version:  v0.29.1
    Path:     /usr/libexec/docker/cli-plugins/docker-buildx
  compose: Docker Compose (Docker Inc.)
    Version:  v2.40.2
    Path:     /usr/libexec/docker/cli-plugins/docker-compose

Server:
 Containers: 10
  Running: 4
  Paused: 0
  Stopped: 6
 Images: 9
 Server Version: 28.5.1
 Storage Driver: overlay2
  Backing Filesystem: extfs
  Supports d_type: true
  Using metacopy: false
  Native Overlay Diff: true
  userxattr: false
 Logging Driver: json-file
 Cgroup Driver: systemd
 Cgroup Version: 2
 Plugins:
  Volume: local
  Network: bridge host ipvlan macvlan null overlay
  Log: awslogs fluentd gcplogs gelf journald json-file local splunk syslog
 CDI spec directories:
  /etc/cdi
  /var/run/cdi
 Swarm: inactive
 Runtimes: io.containerd.runc.v2 runc
 Default Runtime: runc
 Init Binary: docker-init
 containerd version: b98a3aace656320842a23f4a392a33f46af97866
 runc version: v1.3.0-0-g4ca628d1
 init version: de40ad0
 Security Options:
  apparmor
  seccomp
   Profile: builtin
  cgroupns
 Kernel Version: 6.8.0-86-generic
 Operating System: Ubuntu 24.04.3 LTS
 OSType: linux
 Architecture: x86_64
 CPUs: 8
 Total Memory: 7.709GiB
 Name: home
 ID: bd3b6de1-0ffd-4ccc-93cd-26b89fe1ca57
 Docker Root Dir: /var/lib/docker
 Debug Mode: false
 Experimental: false
 Insecure Registries:
  ::1/128
  127.0.0.0/8
 Live Restore Enabled: false

kubectl get nodes
NAME       STATUS   ROLES           AGE   VERSION
minikube   Ready    control-plane   18m   v1.34.0
```
