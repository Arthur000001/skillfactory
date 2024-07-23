#modules/instance_module/main.tf

terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.61.0"
    }
  }
}

resource "yandex_compute_instance" "vm" {
  name = var.name
  zone = var.zone

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.my_image.id
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

data "yandex_compute_image" "my_image" {
  family = var.image_family
}

output "internal_ip_address" {
  value = yandex_compute_instance.vm.network_interface[0].ip_address
}

output "external_ip_address" {
  value = yandex_compute_instance.vm.network_interface[0].nat_ip_address
}

output "zone" {
  value = yandex_compute_instance.vm.zone
}
