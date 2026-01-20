
variable "sg-name" {
  default = "OnlineBookStore-SG"
}

# Defind it as required variable/attribute to get its value from Root module using VPC module
variable "vpc-id" {
  type = string

}

variable "sg-outbound-cidr-ipv4" {
  type    = string
  default = "0.0.0.0/0"
}

# SG Inbound/egress rules/ports to open
variable "sg-inbound-ports" {
  type = list(string)
  # General Rules/Ports required for a Tomcat Deployment
  default = [22, 80, 443, 8080, 8081] # SSH, HTTP, HTTPS, Tomcat, Nexus
}

variable "sg-inbound-cidr-ipv4" {
  type    = string
  default = "0.0.0.0/0"
}