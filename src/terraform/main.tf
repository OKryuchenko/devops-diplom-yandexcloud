
// Create a new instance



resource "yandex_compute_instance" "vm-2" {
 name = "nexus-01"

 resources {
   cores  = 2
   memory = 2
 }

 boot_disk {
   initialize_params {
#      image_id = "fd8iqd03vink8hs1nppp"
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
#
#resource "yandex_compute_instance" "vm-3" {
#  name = "vector-01"
#
#  resources {
#    cores  = 2
#    memory = 2
#  }
#
#  boot_disk {
#    initialize_params {
##      image_id = "fd8iqd03vink8hs1nppp"
#      image_id    = "${var.centos-7-base}"
#    }
#  }
#
#  network_interface {
#    subnet_id = yandex_vpc_subnet.subnet-1.id
#    nat       = true
#  }
#
#  metadata = {
##    ssh-keys = "${file("./meta.txt")}"
#    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
#  }
#}
resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}


