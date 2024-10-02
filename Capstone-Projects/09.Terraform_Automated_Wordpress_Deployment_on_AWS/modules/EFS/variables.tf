variable "private_az1_subnets_ids" {
    description = "private subnets in az1"
    type = list(string)
  
}

variable "private_az2_subnets_ids" {
    description = "private subnets in az2"
    type = list(string)
}

variable "efs_sg" {
    description = "efs security group"
    type = list(string)
}