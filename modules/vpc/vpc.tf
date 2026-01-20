
# AWS VPC Module

# VPC
resource "aws_vpc" "onlineBS-vpc" {
  cidr_block           = "${var.vpc-cidr-block}/${var.vpc-cidr-netmask}"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.vpc-name
  }
}

# Public Subnet
resource "aws_subnet" "onlineBS-public-subnets" {
  for_each                = local.public-subnets
  vpc_id                  = aws_vpc.onlineBS-vpc.id
  cidr_block              = each.value["cidr"]
  map_public_ip_on_launch = var.subnet-map-public-ip-on-launch
  availability_zone       = each.value["az"]

  tags = {
    Name = "onlineBS-public-subnet-${each.value["tag-name-suffix"]}"
  }

  depends_on = [aws_vpc.onlineBS-vpc]
}

# Private Subnet
resource "aws_subnet" "onlineBS-private-subnets" {
  for_each                = local.private-subnets
  vpc_id                  = aws_vpc.onlineBS-vpc.id
  cidr_block              = each.value["cidr"]
  map_public_ip_on_launch = true
  availability_zone       = each.value["az"]

  tags = {
    Name = "onlineBS-private-subnet-${each.value["tag-name-suffix"]}"
  }

  depends_on = [aws_vpc.onlineBS-vpc]
}

# Public Route Table
resource "aws_route_table" "OnlineBS-public-route-table" {
  vpc_id = aws_vpc.onlineBS-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.OnlineBS-igw.id
  }

  tags = {
    Name = "onlineBS-public-route-table"
  }

  depends_on = [aws_vpc.onlineBS-vpc]
}

# Associate RT to public Subnets
resource "aws_route_table_association" "OnlineBS-public-route-table-association" {
  for_each       = { for k, v in aws_subnet.onlineBS-public-subnets : k => v.id } # Two public subnets
  subnet_id      = aws_subnet.onlineBS-public-subnets[each.key].id
  route_table_id = aws_route_table.OnlineBS-public-route-table.id

  depends_on = [aws_route_table.OnlineBS-public-route-table, aws_subnet.onlineBS-public-subnets]
}

# Internet Gateway
resource "aws_internet_gateway" "OnlineBS-igw" {
  vpc_id = aws_vpc.onlineBS-vpc.id

  tags = {
    Name = "onlineBS-IGW"
  }

  depends_on = [aws_vpc.onlineBS-vpc]
}