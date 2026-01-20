
variable "vpc-name" {
  default = "OnlineBookStore-VPC"
}

#To get this value from Root module
variable "region" {
}

variable "vpc-cidr-block" {
  type    = string
  default = "192.168.0.0"
}

variable "vpc-cidr-netmask" {
  type    = number
  default = "16" #VPC cidr Netmask
}

variable "subnet-map-public-ip-on-launch" {
  type    = bool
  default = true
}

