# Create the public route table for the public subnets
resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block  = "0.0.0.0/0"
    gateway_id  = var.aws_internet_gateway
  }
}

# associate with the az1 public route table with the subnets
resource "aws_route_table_association" "az1_public_route_table_assoc" {
  subnet_id      = var.az1_public_subnets_ids  
  route_table_id = aws_route_table.public_route_table.id  
}

# associate with the az2 public route table with the subnets
resource "aws_route_table_association" "az2_public_route_table_assoc" {
  subnet_id      = var.az2_public_subnets_ids
  route_table_id = aws_route_table.public_route_table.id
}



# Create the private-az1 route table for the private subnets
resource "aws_route_table" "private_az1_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = var.az1_NAT_public_access
  }
}

# associate the az1 private route table with the subnets
resource "aws_route_table_association" "az1_private_route_table_assoc" {
  count          = length(var.private_az1_subnets_ids)  
  subnet_id      = var.private_az1_subnets_ids[count.index]  
  route_table_id = aws_route_table.private_az1_route_table.id  
}





# Create the private-az2 route table for the private subnets
resource "aws_route_table" "private_az2_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = var.az2_NAT_public_access
  }
}

# associate the az1 private route table with the subnets
resource "aws_route_table_association" "az2_private_route_table_assoc" {
  count          = length(var.private_az2_subnets_ids)  
  subnet_id      = var.private_az2_subnets_ids[count.index]  
  route_table_id = aws_route_table.private_az2_route_table.id  
}