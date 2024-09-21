provider "aws" {
  region     = "us-east-1"
  access_key = "..."
  secret_key = "..."
}

module "ec2test"{
    source = "./modules/ec2"
}

module "security-group" {
  source  = "./modules/security_group"
}