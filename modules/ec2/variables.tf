

variable "ec2-name" {
  type    = string
  default = "OnlineBookStore-EC2"
}

variable "ec2-ami" {
  type = string
}

variable "ec2-instance-type" {
  type    = string
  default = "t2.medium"
}

variable "ec2-key-name" {
  type    = string
  default = null
}

# Get it from Root module using VPC module
variable "subnet-id" {
}

# Get it from Root module using SG module
variable "sg-id" {
}

