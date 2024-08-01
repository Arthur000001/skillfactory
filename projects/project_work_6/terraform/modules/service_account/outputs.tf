output "service_account_id" {
  description = "ID of the service account"
  value       = yandex_iam_service_account.this.id
}

output "service_account_key_id" {
  description = "ID of the service account key"
  value       = yandex_iam_service_account_key.this.id
}
