# Teraform Modules - VPC and S3 Bucket with Backend Storage

I used Terraform to create a modularized configuration for building an Amazon VPC and S3 bucket. Additionally I configured Terraform to use S3 as the backend storage for storing Terraform state file. 

## Task 1: S3 Bucket Module
The S3 bucket should be the first thing to be created so the backend configuration can have an environment to be deployed on. Comment all the other files.

```markdown
# Create S3 bucket
resource "aws_s3_bucket" "example" {
  bucket = "cole-palmer-is-a-baller"

  tags = {
    Name        = "cole-palmer"
    Environment = "Dev"
  }
}
```
After deploying, delete the local statefile `.terraform` and `terraform.tfstate`, as it will be a conflict and not deploy the statefile to the S3 bucket. Then deploy again with the vpc, and backend config. Comment S3 to avoid error of creating a new bucket.

## Task 2: VPC Module
Terraform module to create VPC with CIDR block and subnets.

```markdown
# Create AWS VPC
 resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main-vpc"
  }
  }

# Create AWS Subnet
  resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "main-subnet"
  }
}
```

## Task 3: Main Terraform Configuration File

```markdown
# Provider Configuration
provider "aws" {
  region     = "check_console"
  access_key = "paste_access_key"
  secret_key = "paste_secret_key"
}

module "vpc"{
    source = "./modules/vpc"
}
module "bucket"{
    source = ".//modules/s3"
}
```

## Task 4: Backend Storage Configuration

```markdown
terraform {
  backend "s3" {
    bucket         = "cole-palmer-is-a-baller" #s3 bucket name
    key            = "terraform/terraform.tfstate"
    region         = "... "  #desired AWS region
    encrypt        = true
    
  }
}

```