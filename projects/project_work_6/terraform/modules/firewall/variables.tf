variable "name" {
  description = "Name of the security group"
  type        = string
}

variable "network_id" {
  description = "ID of the network to which the security group belongs"
  type        = string
}

variable "ssh_port" {
  description = "Port for SSH access"
  type        = number
  default     = 22
}

variable "cidr_blocks" {
  description = "CIDR blocks to allow"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
