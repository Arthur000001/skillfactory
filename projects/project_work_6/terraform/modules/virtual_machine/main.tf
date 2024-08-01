terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.61.0"
    }
  }
}

data "local_file" "ssh_private_key" {
  filename = var.ssh_private_key_path
}

data "local_file" "ssh_public_key" {
  filename = var.ssh_public_key_path
}

data "local_file" "cloud_config" {
  filename = var.get_name_file_config
}

resource "yandex_compute_instance" "vm" {
  name = var.name
  
  resources {
    cores  = var.cores
    memory = var.memory
    core_fraction = var.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = var.disk_size
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  service_account_id = var.service_account_id
  metadata = {
    ssh-keys           = "${var.user_name}:${data.local_file.ssh_public_key.content}"
    serial-port-enable = "1"
    install-unified-agent = "0"
    user-data = data.local_file.cloud_config.content
  }

  scheduling_policy {
    preemptible = true
  }
}

output "internal_ip_address" {
  value = yandex_compute_instance.vm.network_interface[0].ip_address
}

output "external_ip_address" {
  value = yandex_compute_instance.vm.network_interface[0].nat_ip_address
}