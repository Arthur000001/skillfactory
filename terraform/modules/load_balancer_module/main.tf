#modules/load_balancer_module/main.tf

terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.61.0"
    }
  }
}

resource "yandex_lb_target_group" "target_group" {
  name = var.name

  target {
    address   = var.vm1_internal_ip
    subnet_id = var.subnet_id_a
  }
  target {
    address   = var.vm2_internal_ip
    subnet_id = var.subnet_id_b
  }
}

resource "yandex_lb_network_load_balancer" "load_balancer" {
  name        = var.name
  description = "Network Load Balancer for nginx and apache instances"

  listener {
    name = "http"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.target_group.id
    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
      }
      interval            = 10
      timeout             = 5
      healthy_threshold   = 2
      unhealthy_threshold = 2
    }
  }
}

output "load_balancer_ip" {
  value = [for listener in yandex_lb_network_load_balancer.load_balancer.listener : [for spec in listener.external_address_spec : spec.address][0]][0]
}

