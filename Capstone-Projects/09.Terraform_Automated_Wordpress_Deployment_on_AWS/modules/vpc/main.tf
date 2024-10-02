# create VPC
resource "aws_vpc" "main" {
    cidr_block  = var.cidr
    tags        = {
    Name        = "main-vpc"
  }
}
