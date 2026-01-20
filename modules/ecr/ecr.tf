
# AWS ECR Module

resource "aws_ecr_repository" "spc" {
  name                 = "spc"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}