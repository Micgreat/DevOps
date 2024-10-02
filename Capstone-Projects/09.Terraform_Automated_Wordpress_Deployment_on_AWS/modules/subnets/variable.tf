# VPC variable
variable "vpc_id" {
    description = "created aws vpc"
    type = string 
}
# Availablilty Zones Variable
variable "az" {
    description = "Availabiilty zones list"
    type = list(string)
    default = [ "us-east-1a", "us-east-1b" ]
    sensitive = true 
}

# Public Subnets Variable
variable "public_subnets" {
    description = "List of public subnets cidr"
    type = list(string)
    default = [ "10.0.0.0/24", "10.0.1.0/24" ]
}

# Private AZ1 Subnets Variable
variable "private_az1_subnets" {
    description = "List of private-az1 subnets cidr"
    type = list(string)
    default = [ "10.0.2.0/24", "10.0.4.0/24" ]  
}

# Private AZ2 Subnets Variable
variable "private_az2_subnets" {
    description = "List of private-az2 subnets cidr"
    type = list(string)
    default = [ "10.0.3.0/24", "10.0.5.0/24" ]  
}
