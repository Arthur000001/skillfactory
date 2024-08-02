variable "service_account_name" {
  description = "Name of the service account"
  type        = string
}

variable "folder_id" {
  description = "ID of the Yandex folder"
  type        = string
}

variable "roles" {
  description = "List of roles to assign to the service account"
  type        = list(string)
}
