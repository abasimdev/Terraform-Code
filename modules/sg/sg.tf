
# Security Group
resource "aws_security_group" "OnlineBS-sg" {
  name        = var.sg-name
  description = "Security Group Created for OnlineBookStore Java Application"
  vpc_id      = var.vpc-id

  tags = {
    Name = var.sg-name
  }
}

# Outbound Rules
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.OnlineBS-sg.id
  cidr_ipv4         = var.sg-outbound-cidr-ipv4 #Allow All
  ip_protocol       = "-1"                      # semantically equivalent to all ports
}

#Inbound rules
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  for_each          = toset(var.sg-inbound-ports)
  security_group_id = aws_security_group.OnlineBS-sg.id
  # description       = "General Rules required for a Tomcat Deployment"
  cidr_ipv4   = var.sg-inbound-cidr-ipv4 # Allow All
  from_port   = each.value
  ip_protocol = "tcp"
  to_port     = each.value

}