provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA4SDNVMUL4P7I5IMR"
  secret_key = "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"
}

module "ec2test"{
    source = "./modules/ec2"
}

module "security-group" {
  source  = "./modules/security_group"
}