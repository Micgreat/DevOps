variable "alb_sg" {
    description = "id for rds db"
    type = list(string)
}

variable "az1_public_subnets_ids" {
    type = string
}

variable "az2_public_subnets_ids" {
    type = string
}

variable "vpc_id" {
    description = "created aws vpc"
    type = string 
}