output "internal_ip_address_sonar-01" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}

output "external_ip_address_sonar-01" {
  value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}

output "internal_ip_address_nexus-01" {
 value = yandex_compute_instance.vm-2.network_interface.0.ip_address
}

output "external_ip_address_nexus-01" {
 value = yandex_compute_instance.vm-2.network_interface.0.nat_ip_address
}
#output "internal_ip_address_vector-01" {
#  value = yandex_compute_instance.vm-3.network_interface.0.ip_address
#}
#
#output "external_ip_address_vector-01" {
#  value = yandex_compute_instance.vm-3.network_interface.0.nat_ip_address
#}

