variable "yc_token" {
   default = ""
}

variable "yc_cloud_id" {
  default = ""
}

variable "yc_folder_id" {
  default = "b1ggfj7poanps828f81r"
}

variable "yc_region" {
  default = "ru-central1-a"
}

variable "access_key" {
  default = ""
}
variable "secret_key" {
  default = ""
}
variable "centos-7-base" {
  default = "fd8or6nf10d435nom2bf"
}
## Заменить на ID своего облака
## https://console.cloud.yandex.ru/cloud?section=overview
#variable "yandex_cloud_id" {
#  default = "b1gi170919ih7bgt9sr7"
#}
#
## Заменить на Folder своего облака
## https://console.cloud.yandex.ru/cloud?section=overview
#variable "yandex_folder_id" {
#  default = "b1ggfj7poanps828f81r"
#}
#
## Заменить на ID своего образа
## ID можно узнать с помощью команды yc compute image list
#
#variable "yc_folder_id" {
#  default = "b1ggfj7poanps828f81r"
#}

#export TF_VAR_yc_token="token"
#export TF_VAR_yc_cloud_id="id"
#export TF_VAR_yc_folder_id="b1ggfj7poanps828f81r"