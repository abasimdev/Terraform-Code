
locals {
  #   vpc-name = "OnlineBookStore-VPC" # To make VPC name constant

  # Public subnets values to make it dynamic in resource block
  public-subnets = {
    "public-a" = {
      az              = "${var.region}a"                                  #us-east-1a
      cidr            = cidrsubnet(aws_vpc.onlineBS-vpc.cidr_block, 4, 1) # cidrsubnet to dynamically generate CIDRs from next available IP ranges
      tag-name-suffix = "1a"                                              # attribute for numbering the Subnet name
    }
    "public-b" = {
      az              = "${var.region}b" #us-east-1b
      cidr            = cidrsubnet(aws_vpc.onlineBS-vpc.cidr_block, 4, 2)
      tag-name-suffix = "1b"
    }
  }

  # Private subnets values to make it dynamic in resource block
  private-subnets = {
    "private-a" = {
      az              = "${var.region}a"
      cidr            = cidrsubnet(aws_vpc.onlineBS-vpc.cidr_block, 8, 1)
      tag-name-suffix = "1a"
    }
    "private-c" = {
      az              = "${var.region}c"
      cidr            = cidrsubnet(aws_vpc.onlineBS-vpc.cidr_block, 8, 2)
      tag-name-suffix = "1c"
    }
  }

}