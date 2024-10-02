#variable for vpc
variable "vpc_id" {
    description = "created aws vpc"
    type = string 
}

#variable for igw
variable "aws_internet_gateway" {
    description = "Internet gateway"
    type = string
}

#variable for az1 NAT
variable "az1_NAT_public_access" {
    description = "NAT gateway"
    type = string
}

#variable for az2 NAT
variable "az2_NAT_public_access" {
    description = "NAT gateway"
    type = string
}

#variable for az1 public subnet
variable "az1_public_subnets_ids" {
    description = "az1 public subnet ID's"
    type = string
}

#variable for az2 public subnet
variable "az2_public_subnets_ids" {
    description = "az2 public subnet ID's"
    type = string
}

# variable for az1 private subnets
variable "private_az1_subnets_ids" {
    description = "List of the public subnet ID's"
    type = list(string)
}

# variable for az2 private subnets
variable "private_az2_subnets_ids" {
    description = "List of the public subnet ID's"
    type = list(string)
}
