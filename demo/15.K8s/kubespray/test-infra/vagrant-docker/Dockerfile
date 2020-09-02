# Docker image published at quay.io/kubespray/vagrant

ARG KUBESPRAY_VERSION
FROM quay.io/kubespray/kubespray:${KUBESPRAY_VERSION}

ENV VAGRANT_VERSION=2.2.7
ENV VAGRANT_DEFAULT_PROVIDER=libvirt

RUN apt-get update && apt-get install -y wget libvirt-dev openssh-client rsync git

# Install Vagrant
RUN wget https://releases.hashicorp.com/vagrant/${VAGRANT_VERSION}/vagrant_${VAGRANT_VERSION}_x86_64.deb
RUN dpkg -i vagrant_${VAGRANT_VERSION}_x86_64.deb
RUN vagrant plugin install vagrant-libvirt
