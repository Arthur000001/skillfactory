terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.61.0"
    }
  }
}

resource "yandex_iam_service_account" "this" {
  name = var.service_account_name
}

resource "yandex_iam_service_account_key" "this" {
  service_account_id = yandex_iam_service_account.this.id
}

resource "yandex_resourcemanager_folder_iam_member" "editor" {
  for_each = toset(var.roles)
  folder_id = var.folder_id
  role      = each.value
  member    = "serviceAccount:${yandex_iam_service_account.this.id}"
}
