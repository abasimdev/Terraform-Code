
#********** VPC **********
module "OnlineBS-vpc" {
  source                         = "./modules/vpc/"
  region                         = var.region
  vpc-cidr-block                 = var.vpc-cidr-block
  vpc-cidr-netmask               = var.vpc-cidr-netmask
  subnet-map-public-ip-on-launch = var.subnet-map-public-ip-on-launch

}
#////////// VPC ENDS //////////

#********** Security Group **********
module "OnlineBS-sg" {
  source                = "./modules/sg/"
  vpc-id                = module.OnlineBS-vpc.OnlineBS-vpc-id
  sg-outbound-cidr-ipv4 = var.sg-outbound-cidr-ipv4
  sg-inbound-ports      = var.sg-inbound-ports
  sg-inbound-cidr-ipv4  = var.sg-inbound-cidr-ipv4

  depends_on = [module.OnlineBS-vpc]

}
#////////// Security Group ENDS //////////

#********** EC2 **********
# module "OnlineBS-ec2" {
#   # for_each = toset(var.ec2-name)
#   source = "./modules/ec2/"

#   ec2-name = var.ec2-name
#   # ec2-name = each.value
#   ec2-ami = data.aws_ami.ubuntu.id
#   # ec2-ami = "ami-0f918f7e67a3323f0" # Ubuntu 24.04 LTS

#   ec2-instance-type = var.ec2-instance-type
#   sg-id             = module.OnlineBS-sg.sg-id
#   subnet-id         = module.OnlineBS-vpc.subnet-id-public-1-a
#   ec2-key-name      = data.aws_key_pair.key-pair.key_name # Create it from AWS console

#   depends_on = [module.OnlineBS-vpc, module.OnlineBS-sg]

# }
# #////////// EC2 ENDS //////////

