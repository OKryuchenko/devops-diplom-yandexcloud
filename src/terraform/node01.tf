
resource "yandex_compute_instance" "node01" {
  name = "sonar-01"
  zone = "ru-central1-a"
  hostname = "sonar-01.kryuchenko.ru"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
     image_id    = "${var.centos-7-base}"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
#    ssh-keys = "${file("./meta.txt")}"
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }
}

#resource "yandex_compute_instance" "node01" {
#  name                      = "node01"
#
#  hostname                  = "node01.netology.cloud"
#  allow_stopping_for_update = true
#  boot_disk {
#    initialize_params {
#      image_id    = "${var.centos-7-base}"
#      name        = "root-node01"
#      type        = "network-nvme"
#      size        = "50"
#    }
#  }
#
#  network_interface {
#    subnet_id = "${yandex_vpc_subnet.default.id}"
#    nat       = true
#  }
#
#  metadata = {
#    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
#  }
#}
