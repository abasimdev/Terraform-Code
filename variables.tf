
# Providers variables
variable "region" {
  default = "us-east-1"
}

variable "access-key" {
  default = ""
}

variable "secret-key" {
  default = ""
}


# VPC Variables
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


# EC2 Variables
variable "ec2-instance-type" {
  default = "t2.medium"
}
variable "ec2-name" {
  default = "OnlineBookStore-EC2"
  #   default = ["test-1", "test-2"]

}


# SG Variables
variable "sg-outbound-cidr-ipv4" {
  type    = string
  default = "0.0.0.0/0" # Allow All
}

variable "sg-inbound-ports" {
  type    = list(string)
  default = [22, 80, 443, 8080, 8081] # SSH, HTTP, HTTPS, Tomcat, Nexus
}

variable "sg-inbound-cidr-ipv4" {
  type    = string
  default = "0.0.0.0/0" # Allow All
}

