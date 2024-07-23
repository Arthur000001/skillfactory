#main.tf

terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.61.0"
    }
  }

  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true

  }
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

resource "yandex_vpc_network" "network" {
  name = var.name_network
}

resource "yandex_vpc_subnet" "subnet_a" {
  name           = var.resource_name_subnet_a
  zone           = var.zone_central_a
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = [var.v4_cidr_block_a]
}

resource "yandex_vpc_subnet" "subnet_b" {
  name           = var.resource_name_subnet_b
  zone           = var.zone_central_b
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = [var.v4_cidr_block_b]
}

module "vm1" {
  source    = "./modules/instance_module"
  name      = var.name_vm1
  zone      = var.zone_central_a
  subnet_id = yandex_vpc_subnet.subnet_a.id
}

module "vm2" {
  source    = "./modules/instance_module"
  name      = var.name_vm2
  zone      = var.zone_central_b
  subnet_id = yandex_vpc_subnet.subnet_b.id
}

module "load_balancer" {
  source          = "./modules/load_balancer_module"
  name            = "my-load-balancer"
  vm1_internal_ip = module.vm1.internal_ip_address
  vm2_internal_ip = module.vm2.internal_ip_address
  subnet_id_a     = yandex_vpc_subnet.subnet_a.id
  subnet_id_b     = yandex_vpc_subnet.subnet_b.id
}

output "internal_ip_address_vm1" {
  value = module.vm1.internal_ip_address
}

output "external_ip_address_vm1" {
  value = module.vm1.external_ip_address
}

output "internal_ip_address_vm2" {
  value = module.vm2.internal_ip_address
}

output "external_ip_address_vm2" {
  value = module.vm2.external_ip_address
}

output "vm1_zone" {
  value = module.vm1.zone
}

output "vm2_zone" {
  value = module.vm2.zone
}

output "load_balancer_ip" {
  value = module.load_balancer.load_balancer_ip
}
