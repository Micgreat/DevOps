# Create the public subnets for AZ1
resource "aws_subnet" "az1_public_subnets" {
    vpc_id              = var.vpc_id
    cidr_block          = var.public_subnets[0]
    availability_zone   = var.az[0]  

  tags = {
    Name = "public_subnet_${0}"
  }
}

# Create the public subnets for AZ2
resource "aws_subnet" "az2_public_subnets" {
    vpc_id              = var.vpc_id
    cidr_block          = var.public_subnets[1]
    availability_zone   = var.az[1]  

  tags = {
    Name = "public_subnet_${1}"
  }
}

# Create the private az1 (app & data) subnets 
resource "aws_subnet" "private_az1_group_subnets" {
    count               = length(var.private_az1_subnets)
    vpc_id              = var.vpc_id
    cidr_block          = var.private_az1_subnets[count.index]
    availability_zone   = var.az[0]

    tags = {
      Name = "private_app_subnet_${count.index}"
    }
  
}

# Create the private az2 (app & data) subnets  
resource "aws_subnet" "private_az2_group_subnets" {
    count               = length(var.private_az2_subnets)
    vpc_id              = var.vpc_id
    cidr_block          = var.private_az2_subnets[count.index]
    availability_zone   = var.az[1]

    tags = {
      Name = "private_subnet_${count.index}"
    }
  
}