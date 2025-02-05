resource "local_file" "inventory" {
  content = <<-DOC
    ---
    # Ansible inventory containing variable values from Terraform.
    # Generated by Terraform.
    # ANSIBLE_HOST_KEY_CHECKING=False
    nginx:
      hosts:
        nginx-01:
          ansible_host: ${yandex_compute_instance.nginx.network_interface.0.nat_ip_address}
    database:
      children:
        master:
        slave:
    master:    
      hosts:
        db01:
          ansible_host: ${yandex_compute_instance.db01.network_interface.0.ip_address}
    slave:
      hosts:
        db02:
          ansible_host: ${yandex_compute_instance.db02.network_interface.0.ip_address}
    wordpress:
      hosts:
        wordpress-01:
          ansible_host: ${yandex_compute_instance.wordpress.network_interface.0.ip_address}
    monitoring:
      hosts:
        monitoring-01: 
          ansible_host: ${yandex_compute_instance.monitoring.network_interface.0.ip_address}
    cvs:
      children:
        gitlab:
        runner:
    gitlab:
      hosts:
        gitlab-01:
          ansible_host: ${yandex_compute_instance.gitlab.network_interface.0.ip_address}
    runner:
      hosts:
        runner-01:
          ansible_host: ${yandex_compute_instance.runner.network_interface.0.ip_address}
    deployment:
      children:
        runner:
        wordpress:
    gatewayed:
      vars:
        ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q centos@${yandex_compute_instance.nginx.network_interface.0.nat_ip_address}"'
      children:
        database:
        wordpress:
        monitoring:
        cvs:
    DOC
  filename = "../ansible/inventory/stage.yml"

  depends_on = [
    yandex_compute_instance.nginx,
    yandex_compute_instance.db01,
    yandex_compute_instance.db02,
    yandex_compute_instance.monitoring,
    yandex_compute_instance.gitlab,
    yandex_compute_instance.runner
  ]
}
