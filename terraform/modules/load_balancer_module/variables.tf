#modules/load_balancer_module/variables.tf

variable "name" {
  description = "Name of the load balancer"
  type        = string
}

variable "vm1_internal_ip" {
  description = "Internal IP of VM1"
  type        = string
}

variable "vm2_internal_ip" {
  description = "Internal IP of VM2"
  type        = string
}

variable "subnet_id_a" {
  description = "Subnet ID of VM1"
  type        = string
}

variable "subnet_id_b" {
  description = "Subnet ID of VM2"
  type        = string
}
