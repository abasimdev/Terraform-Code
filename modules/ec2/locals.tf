

locals {
  # ec2-name       = "OnlineBookStore-EC2"
  user-data-file = "${path.module}/scripts/user-data.sh"
  tomcat-script  = "${path.module}/scripts/tomcat.sh"
  docker-script  = "${path.module}/scripts/docker.sh"

}