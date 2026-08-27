variable "demo_id" {
  type    = number
  default = 41
}

variable "lxc_password" {
  type      = string
  default   = "DemoPass_123"
  sensitive = true
}
