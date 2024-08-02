terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.61.0"
    }
  }
}

resource "yandex_vpc_network" "this" {
  name = var.yandex_vpc_network_name
}

resource "yandex_vpc_subnet" "this" {
  name           = var.yandex_vpc_subnet_name
  zone           = var.zone
  network_id     = yandex_vpc_network.this.id
  v4_cidr_blocks = var.yandex_vpc_subnet_v4_cidr_blocks
}

output "network_id" {
  value = yandex_vpc_network.this.id
}

output "subnet_id" {
  value = yandex_vpc_subnet.this.id
}
