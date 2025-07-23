variable "region" {
  default = "eu-west-2"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  default = "10.0.1.0/24"
}

variable "public_subnet_2_cidr" {
  default = "10.0.2.0/24"
}

variable "availability_zones" {
  default = ["eu-west-2a", "eu-west-2b"]
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  default = "Mustapha12345!"  # Use secrets manager or env vars in production!
  sensitive = true
}

variable "db_name" {
  default = "drupaldb"
}