output "instance_id" {
  description = "ID of the virtual machine instance"
  value       = yandex_compute_instance.vm.id
}
