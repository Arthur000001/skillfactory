#modules/instance_module/variables.tf

variable "name" {
  description = "Name of the instance"
  type        = string
}

variable "zone" {
  description = "Zone for the instance"
  type        = string
}

variable "image_family" {
  description = "Image family for the instance"
  type        = string
  default     = "debian-11"
}

variable "subnet_id" {
  description = "ID of the subnet"
  type        = string
}

