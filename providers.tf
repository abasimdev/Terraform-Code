
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }   
  }

    backend "s3" {
    bucket = "terraform-state-files-testing-ap-south-1"
    key    = "prod/"
    use_lockfile = true
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
  # access_key = var.access-key # Commented because Passing from aws configure
  # secret_key = var.secret-key # Commented because Passing from aws configure
}