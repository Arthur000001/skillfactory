variable "zone" {
  description = "The availability zone for the network and subnet"
  type        = string
}

variable "yandex_vpc_subnet_name" {
  description = "Name of the VPC subnet"
  type        = string
}

variable "yandex_vpc_network_name" {
  description = "Name of the VPC network"
  type        = string
}

variable "yandex_vpc_subnet_v4_cidr_blocks" {
  description = "List of CIDR blocks for the subnet"
  type        = list(string)
}
