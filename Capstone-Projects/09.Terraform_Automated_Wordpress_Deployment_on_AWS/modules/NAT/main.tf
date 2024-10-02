# Create NAT Gateway for AZ1

resource "aws_nat_gateway" "az1_NAT_public_access" {
  allocation_id = var.az1_eip
  subnet_id     = var.az1_public_subnets_ids

}

# Create NAT Gateway for AZ2

resource "aws_nat_gateway" "az2_NAT_public_access" {
  allocation_id = var.az2_eip
  subnet_id     = var.az2_public_subnets_ids

}
