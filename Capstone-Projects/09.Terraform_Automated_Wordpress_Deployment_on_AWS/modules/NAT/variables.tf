variable "az1_eip" {
    description = "created eip az1"
    type = string 
}

variable "az2_eip" {
    description = "created eip az2"
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
