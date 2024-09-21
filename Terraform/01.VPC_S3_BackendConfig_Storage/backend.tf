terraform {
  backend "s3" {
    bucket         = "cole-palmer-is-a-baller" #s3 bucket name
    key            = "terraform/terraform.tfstate"
    region         = "us-east-1"  #desired AWS region
    encrypt        = true
    
  }
}

