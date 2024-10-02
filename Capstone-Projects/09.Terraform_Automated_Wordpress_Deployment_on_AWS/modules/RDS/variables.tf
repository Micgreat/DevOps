# Private AZ1 Subnets Variable
variable "private_az1_subnets_ids" {
    description = "List of private-az1 subnets cidr"
    type = list(string)
}

variable "rds_sg" {
    description = "id for rds db"
    type = list(string)
}