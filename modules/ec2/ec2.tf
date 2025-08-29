
# AWS EC2 Module

# EC2 (Instance)
resource "aws_instance" "onlineBS-ec2" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.ec2-instance-type
  vpc_security_group_ids = [var.sg-id]
  subnet_id              = var.subnet-id
  key_name               = var.ec2-key-name
  # key_name               = aws_key_pair.onlineBS-ec2-key-pair.key_name
  # user_data              = file(local.user-data-file)

  # lifecycle {
  #   ignore_changes = [ vpc_security_group_ids ]
  # }

  tags = {
    Name = var.ec2-name
  }

  # connection { # SSH Connection to execute remote-exec provisioner
  #   type        = "ssh"
  #   user        = "ubuntu"
  #   private_key = file("C:\\Users\\asbaig\\Downloads\\pluralsight.pem")
  #   host        = self.public_ip

  # }
  # provisioner "remote-exec" { # inline remote-exec to update and upgrade packages
  #   inline = [ "sudo apt update && sudo apt upgrade -y" ]

  # }
  #  provisioner "remote-exec" { # To copy and run script inside ec2
  #   scripts = [ local.docker-script ]

  # }
}

# # Create AWS key-pair
# resource "aws_key_pair" "onlineBS-ec2-key-pair" {
#   key_name   = "pluralsight"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
# }