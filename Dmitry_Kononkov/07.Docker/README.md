# Homework Assignment 1: Docker Installation and Basic Commands

## 1-2. Docker installation:
```bash
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER
```
### Output:
```
sudo apt-get update
Hit:1 http://by.archive.ubuntu.com/ubuntu jammy InRelease
Get:2 http://by.archive.ubuntu.com/ubuntu jammy-updates InRelease [119 kB]
Hit:3 http://by.archive.ubuntu.com/ubuntu jammy-backports InRelease
Get:4 http://by.archive.ubuntu.com/ubuntu jammy-security InRelease [110 kB]
Get:5 http://by.archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages [1326 kB]
Get:6 http://by.archive.ubuntu.com/ubuntu jammy-updates/main Translation-en [268 kB]
Get:7 http://by.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 Packages [1043 kB]
Get:8 http://by.archive.ubuntu.com/ubuntu jammy-security/main amd64 Packages [1109 kB]
Get:9 http://by.archive.ubuntu.com/ubuntu jammy-security/main Translation-en [207 kB]
Get:10 http://by.archive.ubuntu.com/ubuntu jammy-security/universe amd64 Packages [838 kB]
Fetched 5019 kB in 4s (1419 kB/s)                     
Reading package lists... Done

sudo apt-get install ca-certificates curl
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
ca-certificates is already the newest version (20230311ubuntu0.22.04.1).
ca-certificates set to manually installed.
curl is already the newest version (7.81.0-1ubuntu1.15).
curl set to manually installed.
0 upgraded, 0 newly installed, 0 to remove and 2 not upgraded.

sudo install -m 0755 -d /etc/apt/keyrings

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
Get:1 https://download.docker.com/linux/ubuntu jammy InRelease [48.8 kB]
Hit:2 http://by.archive.ubuntu.com/ubuntu jammy InRelease            
Hit:3 http://by.archive.ubuntu.com/ubuntu jammy-updates InRelease
Hit:4 http://by.archive.ubuntu.com/ubuntu jammy-backports InRelease
Hit:5 http://by.archive.ubuntu.com/ubuntu jammy-security InRelease
Get:6 https://download.docker.com/linux/ubuntu jammy/stable amd64 Packages [26.1 kB]
Fetched 74.9 kB in 1s (56.6 kB/s)
Reading package lists... Done

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  docker-ce-rootless-extras git git-man iptables less liberror-perl libip6tc2 libltdl7 libnetfilter-conntrack3 libnfnetlink0 libnftnl11 libslirp0 pigz slirp4netns
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite git-daemon-run | git-daemon-sysvinit git-doc git-email git-gui gitk gitweb git-cvs git-mediawiki git-svn firewalld nftables
The following NEW packages will be installed:
  containerd.io docker-buildx-plugin docker-ce docker-ce-cli docker-ce-rootless-extras docker-compose-plugin git git-man iptables less liberror-perl libip6tc2 libltdl7 libnetfilter-conntrack3 libnfnetlink0 libnftnl11
  libslirp0 pigz slirp4netns
0 upgraded, 19 newly installed, 0 to remove and 2 not upgraded.
Need to get 122 MB of archives.
After this operation, 445 MB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://by.archive.ubuntu.com/ubuntu jammy/universe amd64 pigz amd64 2.6-1 [63.6 kB]
Get:2 http://by.archive.ubuntu.com/ubuntu jammy-updates/main amd64 less amd64 590-1ubuntu0.22.04.1 [143 kB]
Get:3 http://by.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libip6tc2 amd64 1.8.7-1ubuntu5.1 [20.2 kB]
Get:4 http://by.archive.ubuntu.com/ubuntu jammy/main amd64 libnfnetlink0 amd64 1.0.1-3build3 [14.6 kB]
Get:5 http://by.archive.ubuntu.com/ubuntu jammy/main amd64 libnetfilter-conntrack3 amd64 1.0.9-1 [45.3 kB]
Get:6 http://by.archive.ubuntu.com/ubuntu jammy/main amd64 libnftnl11 amd64 1.2.1-1build1 [65.5 kB]
Get:7 http://by.archive.ubuntu.com/ubuntu jammy-updates/main amd64 iptables amd64 1.8.7-1ubuntu5.1 [455 kB]
Get:8 http://by.archive.ubuntu.com/ubuntu jammy/main amd64 liberror-perl all 0.17029-1 [26.5 kB]
Get:9 http://by.archive.ubuntu.com/ubuntu jammy-updates/main amd64 git-man all 1:2.34.1-1ubuntu1.10 [954 kB]
Get:10 http://by.archive.ubuntu.com/ubuntu jammy-updates/main amd64 git amd64 1:2.34.1-1ubuntu1.10 [3166 kB]
Get:11 https://download.docker.com/linux/ubuntu jammy/stable amd64 containerd.io amd64 1.6.28-1 [29.6 MB]
Get:12 http://by.archive.ubuntu.com/ubuntu jammy/main amd64 libltdl7 amd64 2.4.6-15build2 [39.6 kB]
Get:13 http://by.archive.ubuntu.com/ubuntu jammy/main amd64 libslirp0 amd64 4.6.1-1build1 [61.5 kB]
Get:14 http://by.archive.ubuntu.com/ubuntu jammy/universe amd64 slirp4netns amd64 1.0.1-2 [28.2 kB]
Get:15 https://download.docker.com/linux/ubuntu jammy/stable amd64 docker-buildx-plugin amd64 0.12.1-1~ubuntu.22.04~jammy [28.2 MB]
Get:16 https://download.docker.com/linux/ubuntu jammy/stable amd64 docker-ce-cli amd64 5:25.0.2-1~ubuntu.22.04~jammy [13.7 MB]
Get:17 https://download.docker.com/linux/ubuntu jammy/stable amd64 docker-ce amd64 5:25.0.2-1~ubuntu.22.04~jammy [24.3 MB]                                                                                                   
Get:18 https://download.docker.com/linux/ubuntu jammy/stable amd64 docker-ce-rootless-extras amd64 5:25.0.2-1~ubuntu.22.04~jammy [9312 kB]                                                                                   
Get:19 https://download.docker.com/linux/ubuntu jammy/stable amd64 docker-compose-plugin amd64 2.24.5-1~ubuntu.22.04~jammy [12.1 MB]                                                                                         
Fetched 122 MB in 11s (10.7 MB/s)                                                                                                                                                                                            
debconf: delaying package configuration, since apt-utils is not installed
Selecting previously unselected package pigz.
(Reading database ... 71312 files and directories currently installed.)
Preparing to unpack .../00-pigz_2.6-1_amd64.deb ...
Unpacking pigz (2.6-1) ...
Selecting previously unselected package less.
Preparing to unpack .../01-less_590-1ubuntu0.22.04.1_amd64.deb ...
Unpacking less (590-1ubuntu0.22.04.1) ...
Selecting previously unselected package libip6tc2:amd64.
Preparing to unpack .../02-libip6tc2_1.8.7-1ubuntu5.1_amd64.deb ...
Unpacking libip6tc2:amd64 (1.8.7-1ubuntu5.1) ...
Selecting previously unselected package libnfnetlink0:amd64.
Preparing to unpack .../03-libnfnetlink0_1.0.1-3build3_amd64.deb ...
Unpacking libnfnetlink0:amd64 (1.0.1-3build3) ...
Selecting previously unselected package libnetfilter-conntrack3:amd64.
Preparing to unpack .../04-libnetfilter-conntrack3_1.0.9-1_amd64.deb ...
Unpacking libnetfilter-conntrack3:amd64 (1.0.9-1) ...
Selecting previously unselected package libnftnl11:amd64.
Preparing to unpack .../05-libnftnl11_1.2.1-1build1_amd64.deb ...
Unpacking libnftnl11:amd64 (1.2.1-1build1) ...
Selecting previously unselected package iptables.
Preparing to unpack .../06-iptables_1.8.7-1ubuntu5.1_amd64.deb ...
Unpacking iptables (1.8.7-1ubuntu5.1) ...
Selecting previously unselected package containerd.io.
Preparing to unpack .../07-containerd.io_1.6.28-1_amd64.deb ...
Unpacking containerd.io (1.6.28-1) ...
Selecting previously unselected package docker-buildx-plugin.
Preparing to unpack .../08-docker-buildx-plugin_0.12.1-1~ubuntu.22.04~jammy_amd64.deb ...
Unpacking docker-buildx-plugin (0.12.1-1~ubuntu.22.04~jammy) ...
Selecting previously unselected package docker-ce-cli.
Preparing to unpack .../09-docker-ce-cli_5%3a25.0.2-1~ubuntu.22.04~jammy_amd64.deb ...
Unpacking docker-ce-cli (5:25.0.2-1~ubuntu.22.04~jammy) ...
Selecting previously unselected package docker-ce.
Preparing to unpack .../10-docker-ce_5%3a25.0.2-1~ubuntu.22.04~jammy_amd64.deb ...
Unpacking docker-ce (5:25.0.2-1~ubuntu.22.04~jammy) ...
Selecting previously unselected package docker-ce-rootless-extras.
Preparing to unpack .../11-docker-ce-rootless-extras_5%3a25.0.2-1~ubuntu.22.04~jammy_amd64.deb ...
Unpacking docker-ce-rootless-extras (5:25.0.2-1~ubuntu.22.04~jammy) ...
Selecting previously unselected package docker-compose-plugin.
Preparing to unpack .../12-docker-compose-plugin_2.24.5-1~ubuntu.22.04~jammy_amd64.deb ...
Unpacking docker-compose-plugin (2.24.5-1~ubuntu.22.04~jammy) ...
Selecting previously unselected package liberror-perl.
Preparing to unpack .../13-liberror-perl_0.17029-1_all.deb ...
Unpacking liberror-perl (0.17029-1) ...
Selecting previously unselected package git-man.
Preparing to unpack .../14-git-man_1%3a2.34.1-1ubuntu1.10_all.deb ...
Unpacking git-man (1:2.34.1-1ubuntu1.10) ...
Selecting previously unselected package git.
Preparing to unpack .../15-git_1%3a2.34.1-1ubuntu1.10_amd64.deb ...
Unpacking git (1:2.34.1-1ubuntu1.10) ...
Selecting previously unselected package libltdl7:amd64.
Preparing to unpack .../16-libltdl7_2.4.6-15build2_amd64.deb ...
Unpacking libltdl7:amd64 (2.4.6-15build2) ...
Selecting previously unselected package libslirp0:amd64.
Preparing to unpack .../17-libslirp0_4.6.1-1build1_amd64.deb ...
Unpacking libslirp0:amd64 (4.6.1-1build1) ...
Selecting previously unselected package slirp4netns.
Preparing to unpack .../18-slirp4netns_1.0.1-2_amd64.deb ...
Unpacking slirp4netns (1.0.1-2) ...
Setting up libip6tc2:amd64 (1.8.7-1ubuntu5.1) ...
Setting up less (590-1ubuntu0.22.04.1) ...
Setting up libnftnl11:amd64 (1.2.1-1build1) ...
Setting up liberror-perl (0.17029-1) ...
Setting up docker-buildx-plugin (0.12.1-1~ubuntu.22.04~jammy) ...
Setting up containerd.io (1.6.28-1) ...
Created symlink /etc/systemd/system/multi-user.target.wants/containerd.service → /lib/systemd/system/containerd.service.
Setting up docker-compose-plugin (2.24.5-1~ubuntu.22.04~jammy) ...
Setting up libltdl7:amd64 (2.4.6-15build2) ...
Setting up docker-ce-cli (5:25.0.2-1~ubuntu.22.04~jammy) ...
Setting up libslirp0:amd64 (4.6.1-1build1) ...
Setting up pigz (2.6-1) ...
Setting up libnfnetlink0:amd64 (1.0.1-3build3) ...
Setting up git-man (1:2.34.1-1ubuntu1.10) ...
Setting up docker-ce-rootless-extras (5:25.0.2-1~ubuntu.22.04~jammy) ...
Setting up slirp4netns (1.0.1-2) ...
Setting up git (1:2.34.1-1ubuntu1.10) ...
Setting up libnetfilter-conntrack3:amd64 (1.0.9-1) ...
Setting up iptables (1.8.7-1ubuntu5.1) ...
update-alternatives: using /usr/sbin/iptables-legacy to provide /usr/sbin/iptables (iptables) in auto mode
update-alternatives: using /usr/sbin/ip6tables-legacy to provide /usr/sbin/ip6tables (ip6tables) in auto mode
update-alternatives: using /usr/sbin/iptables-nft to provide /usr/sbin/iptables (iptables) in auto mode
update-alternatives: using /usr/sbin/ip6tables-nft to provide /usr/sbin/ip6tables (ip6tables) in auto mode
update-alternatives: using /usr/sbin/arptables-nft to provide /usr/sbin/arptables (arptables) in auto mode
update-alternatives: using /usr/sbin/ebtables-nft to provide /usr/sbin/ebtables (ebtables) in auto mode
Setting up docker-ce (5:25.0.2-1~ubuntu.22.04~jammy) ...
Created symlink /etc/systemd/system/multi-user.target.wants/docker.service → /lib/systemd/system/docker.service.
Created symlink /etc/systemd/system/sockets.target.wants/docker.socket → /lib/systemd/system/docker.socket.
Processing triggers for libc-bin (2.35-0ubuntu3.6) ...
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 78.)
debconf: falling back to frontend: Readline
Scanning processes...                                                                                                                                                                                                         
Scanning linux images...                                                                                                                                                                                                      

sudo usermod -aG docker $USER
```

```
docker --version
Docker version 25.0.2, build 29cf629
```

## 3-4.  Docker image "hello-world":
### Pull docker image:
```bash
docker pull hello-world
```
### Output:
```bash
Using default tag: latest
latest: Pulling from library/hello-world
c1ec31eb5944: Pull complete 
Digest: sha256:4bd78111b6914a99dbc560e6a20eab57ff6655aea4a80c50b0c5491968cbc2e6
Status: Downloaded newer image for hello-world:latest
docker.io/library/hello-world:latest
```
### Check image:
```bash
docker images
```
### Output:
```bash
REPOSITORY    TAG       IMAGE ID       CREATED        SIZE
hello-world   latest    d2c94e258dcb   9 months ago   13.3kB
```
### Run docker image:
```bash
docker run hello-world
```
### Output:
```bash
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```


# Homework Assignment 2: Building a Docker Image with Dockerfile

## Web application:
### go.mod
```
module  github.com/kdimakon/simple-web-app-golang

go  1.21.0
```
### main.go
```
package  main
import (
    "net/http"
    "os"
)

func  indexHandler(w  http.ResponseWriter, r  *http.Request) {
    w.Write([]byte("<h1>Hello World!</h1>"))
}

func  main() {
    port  :=  os.Getenv("PORT")
    if  port  ==  "" {
         port  =  "3000"
    }

    mux  :=  http.NewServeMux()
    
    mux.HandleFunc("/", indexHandler)
    http.ListenAndServe(":"+port, mux)
}
```
### Dockerfile
```
FROM  golang:1.12.0-alpine3.9
RUN  mkdir  /app
ADD  .  /app
WORKDIR  /app
RUN  go  build  -o  main  .
CMD  ["/app/main"]
```
### Docker Build:
```
docker build -t golang-web-app:v1 .
```
### Output:
```
[+] Building 40.7s (10/10) FINISHED                                                                                                                                                        docker:default
 => [internal] load build definition from Dockerfile                                                                                                                                                 0.1s
 => => transferring dockerfile: 157B                                                                                                                                                                 0.0s
 => [internal] load metadata for docker.io/library/golang:1.12.0-alpine3.9                                                                                                                           2.5s
 => [internal] load .dockerignore                                                                                                                                                                    0.1s
 => => transferring context: 2B                                                                                                                                                                      0.0s
 => [1/5] FROM docker.io/library/golang:1.12.0-alpine3.9@sha256:6c143f415448f883ed034529162b3dc1c85bb2967fdd1579a873567b22bcb790                                                                    30.5s
 => => resolve docker.io/library/golang:1.12.0-alpine3.9@sha256:6c143f415448f883ed034529162b3dc1c85bb2967fdd1579a873567b22bcb790                                                                     0.1s
 => => sha256:6c143f415448f883ed034529162b3dc1c85bb2967fdd1579a873567b22bcb790 2.37kB / 2.37kB                                                                                                       0.0s
 => => sha256:69371d496b2b4e99120216fa3c5057b0c5468411370ab24ea99cd87d7b1d9203 1.36kB / 1.36kB                                                                                                       0.0s
 => => sha256:2205a315f9c751a8c205aa42f29ad0ff29918c40d85c8ddaabac99e0cb46b5d8 3.80kB / 3.80kB                                                                                                       0.0s
 => => sha256:8e402f1a9c577ded051c1ef10e9fe4492890459522089959988a4852dee8ab2c 2.75MB / 2.75MB                                                                                                       0.6s
 => => sha256:ce7779d8bfe3415e27ec3bf5950b2ab67a854c608595f0f2e49066fb5806fd12 301.88kB / 301.88kB                                                                                                   0.5s
 => => sha256:de1a1e452942df2228b914d2ce9be43f18b137f4ebc3dce9491bc08c2630a2ea 154B / 154B                                                                                                           0.6s
 => => extracting sha256:8e402f1a9c577ded051c1ef10e9fe4492890459522089959988a4852dee8ab2c                                                                                                            0.5s
 => => sha256:1bdc943bc000449a960c5121688afe0a9b51837407bf0478391b6bad6642d36f 124.28MB / 124.28MB                                                                                                  13.6s
 => => sha256:a8c461e224a623234c9f2ff60e4249678c9e6847add7152ac80239b13d14df4c 126B / 126B                                                                                                           1.1s
 => => extracting sha256:ce7779d8bfe3415e27ec3bf5950b2ab67a854c608595f0f2e49066fb5806fd12                                                                                                            0.6s
 => => extracting sha256:de1a1e452942df2228b914d2ce9be43f18b137f4ebc3dce9491bc08c2630a2ea                                                                                                            0.0s
 => => extracting sha256:1bdc943bc000449a960c5121688afe0a9b51837407bf0478391b6bad6642d36f                                                                                                           15.6s
 => => extracting sha256:a8c461e224a623234c9f2ff60e4249678c9e6847add7152ac80239b13d14df4c                                                                                                            0.0s
 => [internal] load build context                                                                                                                                                                    0.1s
 => => transferring context: 669B                                                                                                                                                                    0.0s
 => [2/5] RUN  mkdir  /app                                                                                                                                                                           2.0s
 => [3/5] ADD  .  /app                                                                                                                                                                               0.6s
 => [4/5] WORKDIR  /app                                                                                                                                                                              0.3s
 => [5/5] RUN  go  build  -o  main  .                                                                                                                                                                3.9s
 => exporting to image                                                                                                                                                                               0.4s
 => => exporting layers                                                                                                                                                                              0.4s
 => => writing image sha256:c0f2a8ac5dcadc4977ff8e9448859ab88dc7c44432cf8902225bde1a5b17b666                                                                                                         0.0s
 => => naming to docker.io/library/golang-web-app:v1          
```
### Docker run:
```
docker run -p  3000:3000 -it golang-web-app:v1
```
### Check 1:
```
curl -L http://localhost:3000
```
### Output:
```
<h1>Hello World!</h1>
```
### Check 2:
```
curl -I http://localhost:3000
```
### Output:
```
HTTP/1.1 200 OK
Date: Tue, 06 Feb 2024 13:04:54 GMT
Content-Length: 21
Content-Type: text/html; charset=utf-8
```
### Docker ps:
```
CONTAINER ID   IMAGE               COMMAND       CREATED         STATUS         PORTS                                       NAMES
52af8f1fc611   golang-web-app:v1   "/app/main"   3 minutes ago   Up 3 minutes   0.0.0.0:3000->3000/tcp, :::3000->3000/tcp   epic_lehmann
```