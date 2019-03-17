// login and password for access to VCSA
variable "vsphere_password" {
    type = "string"
    default = "Pasadu!r"  
}
variable "vsphere_login" {
     type = "string"
     default = "i.evseichik@cedoni.corp"
}

// The name prefix of the virtual machines to create.
variable "virtual_machine_name_prefix" {
  default = "jenkins-dev"
  type    = "string"
}

// The domain name to set up each virtual machine as.
variable "virtual_machine_domain" {
  default = "cedoni.corp"
  type    = "string"
}

// The network address for the virtual machines, in the form of 10.0.0.0/24.
variable "virtual_machine_network_address" {
  default = "10.50.80.120/24"
  type    = "string"
}


// The default gateway for the network the virtual machines reside in.
variable "virtual_machine_gateway" {
  default = "10.50.80.1"
  type    = "string"
}

// The DNS servers for the network the virtual machines reside in.
variable "virtual_machine_dns_servers" {
  default = "10.50.50.10"
  type    = "string"
}

// The name of the server binary to upload and start on the servers. This
// should already be built and reside in the "pkg" subdirectory of the working
// Terraform configuration directory.
variable "server_binary_name" {
  default = "ovf-example-service"
  type    = "string"
}

// home directory for jenkins
variable "jenkins_home" {
  default = "/var/lib/jenkins/"
  type = "string"
}

//script for installing java
variable "script_name" {
  default = "java.sh"
  type = "string"
}

// The name of the user to be used when running the service binary.
variable "service_user" {
  type    = "string"
  default = "ovf-example"
}

// The home directory of the service user and the location where the service
// binary resides.
variable "service_directory" {
  type    = "string"
  default = "/ovf-example"
}

// A list of SSH keys that will be pushed to the "core" user on each CoreOS
// virtual machine. This allows for the management of each host after
// provisioning.
variable "management_ssh_keys" {
    type    = "list"
     default = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDVw4gwP6u4uUUS5JyhUgWiHbMBqsbaCxjuH2+d6rbj6/AfabkaJqL2qNL8+sUGE5S95wpXrqGWHH1cF7MJW58lDK+P3yBz4vhCgXbS/MbbtY8o7FSoZCQKNVTFxsnd7eGaOIzWvRxpy5qfWhs7DelgYMQMfAxv2e2KIKoxI6nkXMFQAX6Upt8bAY/tV4TSi/twfnOUmcOhJvos6/qBBxBnC7OhUuMBCkz+r7WF6YAI8xxikCZZ2V24gJBTNdulfVCa0C6LXI2Mm7y81JVET3roTywqOsIJxgSb7TZQIIwHpAdqWBwKUG6qPj1rUSBN9h555Hui2idTGfag1irZWIo3 root@centos.cedoni.corp", "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAiPXtXOFTKGrrLp/+w4oC2nyIJaAovMxYdCadGXJnp/dYMcGYWSojaHg258lnC7IVMG9glldIRASv9FTUymy1ntrrg+tiJxZWTOCZNNLbNxNjw1aBpAIrg4XYygV87FXrQ4YlnlJRiaGyE33Ei+yAeFR3mKie/zTg6oSVJIRZStWjVdSp2Q/KX8ju8HUceMFTRQgZ7Wu9FsD+mvXkFKHAXSiRjbBNFIIck+o+vnjcj3srqbE0G2Bx7QMACXtxX+uf5wWuFMabGrpw636hEUFu++kql+MTOUXeBLzCT+leXUcidgU7GOxw6cLjMy+WwH9moN2BCeOjOxZssr1zwzUww== i.evseichik@cedoni.com"]
}
