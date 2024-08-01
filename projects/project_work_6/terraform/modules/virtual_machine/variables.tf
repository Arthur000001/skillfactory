variable "name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "cores" {
  description = "Number of CPU cores"
  type        = number
}

variable "memory" {
  description = "Amount of RAM in GB"
  type        = number
}

variable "image_id" {
  description = "Image ID for the boot disk"
  type        = string
}

variable "disk_size" {
  description = "Size of the boot disk in GB"
  type        = number
}

variable "subnet_id" {
  description = "Subnet ID for the network interface"
  type        = string
}

variable "service_account_id" {
  description = "ID of the service account"
  type        = string
}

variable "ssh_private_key_path" {
  description = "Path to the SSH private key"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key"
  type        = string
}

variable "user_name" {
  description = "Username"
  type        = string
}

variable "core_fraction" {
  description = "core faction"
  type        = number
}

variable "get_name_file_config" {
  description = "Name file"
  type        = string
}