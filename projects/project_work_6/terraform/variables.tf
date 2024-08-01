variable "yandex_cloud_token" {
  type = string
}

variable "yandex_cloud_id" {
  type = string
}

variable "yandex_folder_id" {
  type = string
}

variable "zone" {
  description = "Use specific availability zone"
  type        = string
  default     = "ru-central1-a"
}

variable "image_family_ubuntu" {
  description = "Image family ID for Ubuntu"
  type        = string
}

variable "image_family_centos" {
  description = "Image family ID for CentOS"
  type        = string
}

variable "ssh_key_vm" {
  description = "SSH keys for accessing the VMs"
  type        = string
}

variable "organization_id" {
  description = "Access of your organization"
  type        = string
}

variable "instance_count" {
  description = "Number of VM instances to create"
  type        = number
  default     = 1
}

variable "cores" {
  description = "Number of CPU cores for the VM"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Amount of memory for the VM in GB"
  type        = number
  default     = 2
}

variable "disk_size" {
  description = "Size of the boot disk in GB"
  type        = number
  default     = 20
}

variable "service_account_name_vm" {
  description = "Name service account"
  type        = string
}

variable "service_account_roles_aev" {
  description = "List of roles to assign to the service account with: admin, editor, viewer"
  type        = list(string)
}

variable "yandex_vpc_subnet_v4_cidr_blocks" {
  description = "List address"
  type        = list(string)
}

variable "yandex_vpc_subnet_name" {
  description = "Name vpc subnet name"
  type        = string
}

variable "yandex_vpc_network_name" {
  description = "Name vpc network name"
  type        = string
}

variable "firewall_name" {
  description = "Firewall name"
  type        = string
}

variable "firewall_cidr_blocks" {
  description = "CIDR blocks to allow"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "firewall_ssh_port_twenty_second" {
  description = "Firewall ssh port"
  type        = number
  default     = 22
}

variable "ssh_private_key_path" {
  description = "Path to the SSH private key"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key"
  type        = string
}

variable "user_name_ubuntu" {
  description = "Username admin OS"
  type        = string
}

variable "user_name_centos" {
  description = "Username admin OS"
  type        = string
}

variable "user_name_arthur" {
  description = "Username admin OS"
  type        = string
}

variable "vm1_name" {
  description = "Name vm"
  type        = string
  default     = "vm1"
}

variable "vm2_name" {
  description = "Name vm"
  type        = string
  default     = "vm2"
}

variable "vm3_name" {
  description = "Name vm"
  type        = string
  default     = "vm3"
}