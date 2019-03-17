# vCenter connection

variable "vsphere_user" {
   default = "i.evseichik@cedoni.corp"
   description = "vSphere user name"
}

variable "vsphere_password" {
  default = "Pasadu!r"
  description = "vSphere password"
}

variable "vsphere_vcenter" {
  default = "10.50.80.10"
  description = "vCenter server FQDN or IP"
}

variable "vsphere_unverified_ssl" {
  default = "true"
  description = "Is the vCenter using a self signed certificate (true/false)"
}

# VM specifications

variable "vsphere_datacenter" {
  default = "Cedoni.corp"
  description = "In which datacenter the VM will be deployed"
}

variable "vsphere_vm_name" {
  default = "jenkins"
  description = "What is the name of the VM"
}

variable "vsphere_vm_template" {
  default = "ubuntu-dev"
  description = "Where is the VM template located"
}


variable "vsphere_cluster" {
  default = "Cluster"
  description = "In which cluster the VM will be deployed"
}

variable "vsphere_resource_pool" {
  default          = "Cluster/Resources/Cedoni-dev"
  description = "Vsphere pool for VM"
}

variable "vsphere_vcpu_number" {
  default = "2"
  description = "How many vCPU will be assigned to the VM (default: 1)"
}

variable "vsphere_memory_size" {
  description = "How much RAM will be assigned to the VM (default: 1024)"
  default     = "4048"
}

variable "vsphere_datastore" {
  default = "Datastore_SSD_Raid50" 
  description = "What is the name of the VM datastore"
}

variable "vsphere_port_group" {
  description = "In which port group the VM NIC will be configured (default: VM Network)"
  default     = "Cedoni.res"
}

variable "vsphere_ipv4_address" {
  description = "What is the IPv4 address of the VM"
  default = "10.50.80.140"
}

variable "vsphere_ipv4_netmask" {
  description = "What is the IPv4 netmask of the VM (default: 24)"
  default     = "24"
}

variable "vsphere_ipv4_gateway" {
  description = "What is the IPv4 gateway of the VM"
  default = "10.50.80.1"
}

variable "vsphere_dns_servers" {
  description = "What are the DNS servers of the VM (default: 8.8.8.8,5.5.5.5)"
  default     = "8.8.8.8"
}

variable "vsphere_domain" {
  description = "What is the domain of the VM"
  default = "cedoni.corp"
}
variable "root_password" {
  description = "Root passwd for ubuntu machine"
  default = "pasadur"
}

variable "vsphere_time_zone" {
  description = "What is the timezone of the VM (default: UTC)"
  default     = "Europe/Minsk"
}
