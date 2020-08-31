# Offline environment

In case your servers don't have access to internet (for example when deploying on premises with security constraints), you need to setup:

* a HTTP reverse proxy/cache/mirror to serve some static files (zips and binaries)
* an internal Yum/Deb repository for OS packages
* an internal container image registry that need to be populated with all container images used by Kubespray. Exhaustive list depends on your setup
* [Optional] an internal PyPi server for kubespray python packages (only required if your OS doesn't provide all python packages/versions listed in `requirements.txt`)
* [Optional] an internal Helm registry (only required if `helm_enabled=true`)

## Configure Inventory

Once all artifacts are accessible from your internal network, **adjust** the following variables in your inventory to match your environment:

```yaml
# Registry overrides
gcr_image_repo: "{{ registry_host }}"
docker_image_repo: "{{ registry_host }}"
quay_image_repo: "{{ registry_host }}"

kubeadm_download_url: "{{ files_repo }}/kubernetes/{{ kube_version }}/kubeadm"
kubectl_download_url: "{{ files_repo }}/kubernetes/{{ kube_version }}/kubectl"
kubelet_download_url: "{{ files_repo }}/kubernetes/{{ kube_version }}/kubelet"
# etcd is optional if you **DON'T** use etcd_deployment=host
etcd_download_url: "{{ files_repo }}/kubernetes/etcd/etcd-{{ etcd_version }}-linux-amd64.tar.gz"
cni_download_url: "{{ files_repo }}/kubernetes/cni/cni-plugins-linux-{{ image_arch }}-{{ cni_version }}.tgz"
crictl_download_url: "{{ files_repo }}/kubernetes/cri-tools/crictl-{{ crictl_version }}-{{ ansible_system | lower }}-{{ image_arch }}.tar.gz"
# If using Calico
calicoctl_download_url: "{{ files_repo }}/kubernetes/calico/{{ calico_ctl_version }}/calicoctl-linux-{{ image_arch }}"

# CentOS/Redhat
## Docker
docker_rh_repo_base_url: "{{ yum_repo }}/docker-ce/$releasever/$basearch"
docker_rh_repo_gpgkey: "{{ yum_repo }}/docker-ce/gpg"
## Containerd
extras_rh_repo_base_url: "{{ yum_repo }}/centos/$releasever/extras/$basearch"
extras_rh_repo_gpgkey: "{{ yum_repo }}/containerd/gpg"

# Fedora
## Docker
docker_fedora_repo_base_url: "{{ yum_repo }}/docker-ce/{{ ansible_distribution_major_version }}/{{ ansible_architecture }}"
docker_fedora_repo_gpgkey: "{{ yum_repo }}/docker-ce/gpg"
## Containerd
containerd_fedora_repo_base_url: "{{ yum_repo }}/containerd"
containerd_fedora_repo_gpgkey: "{{ yum_repo }}/docker-ce/gpg"

# Debian
## Docker
docker_debian_repo_base_url: "{{ debian_repo }}/docker-ce"
docker_debian_repo_gpgkey: "{{ debian_repo }}/docker-ce/gpg"
## Containerd
containerd_debian_repo_base_url: "{{ ubuntu_repo }}/containerd"
containerd_debian_repo_gpgkey: "{{ ubuntu_repo }}/containerd/gpg"
containerd_debian_repo_repokey: 'YOURREPOKEY'

# Ubuntu
## Docker
docker_ubuntu_repo_base_url: "{{ ubuntu_repo }}/docker-ce"
docker_ubuntu_repo_gpgkey: "{{ ubuntu_repo }}/docker-ce/gpg"
## Containerd
containerd_ubuntu_repo_base_url: "{{ ubuntu_repo }}/containerd"
containerd_ubuntu_repo_gpgkey: "{{ ubuntu_repo }}/containerd/gpg"
containerd_ubuntu_repo_repokey: 'YOURREPOKEY'

# If using helm
helm_stable_repo_url: "{{ helm_registry }}"
```

For the OS specific settings, just define the one matching your OS.
If you use the settings like the one above, you'll need to define in your inventory the following variables:

* `registry_host`: Container image registry. If you _don't_ use the same repository path for the container images that the ones defined in [Download's role defaults](https://github.com/kubernetes-sigs/kubespray/blob/master/roles/download/defaults/main.yml), you need to override the `*_image_repo` for these container images. If you want to make your life easier, use the same repository path, you won't have to override anything else.
* `files_repo`: HTTP webserver or reverse proxy that is able to serve the files listed above. Path is not important, you can store them anywhere as long as it's accessible by kubespray. It's recommended to use `*_version` in the path so that you don't need to modify this setting everytime kubespray upgrades one of these components.
* `yum_repo`/`debian_repo`/`ubuntu_repo`: OS package repository depending of your OS, should point to your internal repository. Adjust the path accordingly.
* `helm_registry`: Helm Registry to use for `stable` Helm Charts if `helm_enabled: true`

## Install Kubespray Python Packages

Look at the `requirements.txt` file and check if your OS provides all packages out-of-the-box (Using the OS package manager). For those missing, you need to either use a proxy that has Internet access (typically from a DMZ) or setup a PyPi server in your network that will host these packages.

If you're using a HTTP(S) proxy to download your python packages:

```bash
sudo pip install --proxy=https://[username:password@]proxyserver:port -r requirements.txt
```

When using an internal PyPi server:

```bash
# If you host all required packages
pip install -i https://pypiserver/pypi -r requirements.txt

# If you only need the ones missing from the OS package manager
pip install -i https://pypiserver/pypi package_you_miss
```

## Run Kubespray as usual

Once all artifacts are in place and your inventory properly set up, you can run kubespray with the regular `cluster.yaml` command:

```bash
ansible-playbook -i inventory/my_airgap_cluster/hosts.yaml -b cluster.yml
```

## Please Note: Offline installation doesn't support CRI-O container runtime at the moment (see [this issue](https://github.com/kubernetes-sigs/kubespray/issues/6233))
