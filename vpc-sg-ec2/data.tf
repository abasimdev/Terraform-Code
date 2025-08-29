

# Pull Ubuntu 24.04 AMI (Image)
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# Pull Key-pair by its name, created outside of TF to associate with ec2
data "aws_key_pair" "key-pair" {
  key_name = "ec2-key"
}
