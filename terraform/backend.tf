terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "netology-backet2"
    region     = "ru-central1-a"
    key        = "./terraform.tfstate"
    access_key = "YCAJETS72hXp2OvSUAq6mTF0V"
    secret_key = "YCPnYgKZzPVVVWLMeObGAXitRXWIJzllsw2UgQu2"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}