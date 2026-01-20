

#************ SG using Dynamic block ************
# See at the end for SG created using separate rules resource

resource "aws_security_group" "OnlineBS-sg-Dynamic-Block" {
  name   = var.sg-name
  vpc_id = var.vpc-id

  dynamic "ingress" {
    for_each = toset(var.sg-inbound-ports)
    # iterator = "ingress"
    content {

      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.sg-inbound-cidr-ipv4]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sg-name
  }

}


#************ Below SG is created with new method i.e. using separate rules resource (Recommended to use).

# Security Group
# resource "aws_security_group" "OnlineBS-sg" {
#   name        = var.sg-name
#   description = "Security Group Created for OnlineBookStore Java Application"
#   vpc_id      = var.vpc-id

#   tags = {
#     Name = var.sg-name
#   }
# }

# #Inbound rules
# resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
#   for_each          = toset(var.sg-inbound-ports)
#   security_group_id = aws_security_group.OnlineBS-sg.id
#   # description       = "General Rules required for a Tomcat Deployment"
#   from_port   = each.value
#   ip_protocol = "tcp"
#   to_port     = each.value
#   cidr_ipv4   = var.sg-inbound-cidr-ipv4 # Allow All

# }

# # Outbound Rules
# resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
#   security_group_id = aws_security_group.OnlineBS-sg.id
#   ip_protocol       = "-1"  # 'all' can also be apssed  # semantically equivalent to all ports
#   cidr_ipv4         = var.sg-outbound-cidr-ipv4 #Allow All
# }


