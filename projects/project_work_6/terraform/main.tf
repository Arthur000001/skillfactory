terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.61.0"
    }
  }
}

provider "yandex" {
  token     = var.yandex_cloud_token
  cloud_id  = var.yandex_cloud_id
  folder_id = var.yandex_folder_id
  zone      = var.zone
}

module "network" {
  source                            = "./modules/network"
  zone                              = var.zone
  yandex_vpc_network_name           = var.yandex_vpc_network_name
  yandex_vpc_subnet_name            = var.yandex_vpc_subnet_name
  yandex_vpc_subnet_v4_cidr_blocks  = var.yandex_vpc_subnet_v4_cidr_blocks
}

module "service_account" {
  source                = "./modules/service_account"
  service_account_name  = var.service_account_name_vm
  folder_id             = var.yandex_folder_id
  roles                 = var.service_account_roles_aev
}

module "firewall" {
  source      = "./modules/firewall"
  name        = var.firewall_name
  network_id  = module.network.network_id
  ssh_port    = var.firewall_ssh_port_twenty_second
  cidr_blocks = var.firewall_cidr_blocks
}

module "vm1" {
  source                = "./modules/virtual_machine"
  name                  = var.vm1_name
  cores                 = var.cores
  memory                = var.memory
  image_id              = var.image_family_ubuntu
  disk_size             = var.disk_size
  subnet_id             = module.network.subnet_id
  service_account_id    = module.service_account.service_account_id
  ssh_private_key_path  = var.ssh_private_key_path
  ssh_public_key_path   = var.ssh_public_key_path
  user_name             = "${var.vm1_name}${var.user_name_ubuntu}"
  core_fraction         = "20"
  get_name_file_config  = "${path.module}/cloud-config/ubuntu-vm1.yml"
}

module "vm2" {
  source                = "./modules/virtual_machine"
  name                  = var.vm2_name
  cores                 = var.cores
  memory                = var.memory
  image_id              = var.image_family_ubuntu
  disk_size             = var.disk_size
  subnet_id             = module.network.subnet_id
  service_account_id    = module.service_account.service_account_id
  ssh_private_key_path  = var.ssh_private_key_path
  ssh_public_key_path   = var.ssh_public_key_path
  user_name             = "${var.vm2_name}${var.user_name_ubuntu}"
  core_fraction         = "20"
  get_name_file_config  = "${path.module}/cloud-config/ubuntu-vm2.yml"
}

module "vm3" {
  source                = "./modules/virtual_machine"
  name                  = var.vm3_name
  cores                 = var.cores
  memory                = var.memory
  image_id              = var.image_family_centos
  disk_size             = var.disk_size
  subnet_id             = module.network.subnet_id
  service_account_id    = module.service_account.service_account_id
  ssh_private_key_path  = var.ssh_private_key_path
  ssh_public_key_path   = var.ssh_public_key_path
  user_name             = "${var.vm3_name}${var.user_name_centos}"
  core_fraction         = "5"
  get_name_file_config  = "${path.module}/cloud-config/centos-vm3.yml"
}