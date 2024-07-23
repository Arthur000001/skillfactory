#variables.tf

variable "token" {
  description = "Токен для аутентификации в Yandex Cloud"
  type        = string
}

variable "cloud_id" {
  description = "ID вашего облака в Yandex Cloud"
  type        = string
}

variable "folder_id" {
  description = "Идентификатор папки по умолчанию в облаке Яндекса"
  type        = string
}

variable "zone" {
  description = "Use specific availability zone"
  type        = string
  default     = "ru-central1-a"
}

variable "access_key" {
  description = "Access key for Yandex Cloud bucket"
  type        = string
}

variable "secret_key" {
  description = "Secret key for Yandex Cloud bucket"
  type        = string
}

variable "name_network" {
  description = "name network"
  type        = string
}

variable "v4_cidr_block_a" {
  description = "CIDR block for subnet A"
  type        = string
}

variable "v4_cidr_block_b" {
  description = "CIDR block for subnet B"
  type        = string
}

variable "zone_central_a" {
  description = "zone A"
  type        = string
}

variable "zone_central_b" {
  description = "zone B"
  type        = string
}

variable "name_vm1" {
  description = "name VM1"
  type        = string
}

variable "name_vm2" {
  description = "name VM2"
  type        = string
}

variable "resource_name_subnet_a" {
  description = "name resurce subnetA"
  type        = string
}

variable "resource_name_subnet_b" {
  description = "name resurce subnetB"
  type        = string
}

