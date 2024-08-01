terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.61.0"
    }
  }
}

resource "yandex_vpc_security_group" "this" {
  name      = var.name
  network_id = var.network_id

  ingress {
    protocol = "TCP"
    port     = var.ssh_port
    v4_cidr_blocks = var.cidr_blocks
  }

  egress {
    protocol = "ANY"
    port     = 0
    v4_cidr_blocks = var.cidr_blocks
  }
}