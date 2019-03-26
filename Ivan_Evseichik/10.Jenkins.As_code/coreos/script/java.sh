#!/bin/bash
# Install Java
mkdir /var/lib/jenkins/java
cd /var/lib/jenkins/java
wget -O java.tar.gz  https://javadl.oracle.com/webapps/download/AutoDL?BundleId=236878_42970487e3af4f5aa5bca3f542482c60
tar xzvf java.tar.gz
rm java.tar.gz
rm /var/lib/jenkins/.bashrc
echo 'export PATH=$PATH:/var/lib/jenkins/java/jre1.8.0_201/bin/' > /var/lib/jenkins/.bashrc

