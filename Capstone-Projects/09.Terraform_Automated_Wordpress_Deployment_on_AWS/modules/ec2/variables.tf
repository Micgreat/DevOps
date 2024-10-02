variable "az1_public_subnets_ids" {
    description = "az1 public subnet ID's"
    type = string
}

variable "security_group_id" {
    description = "HTTP and SSH security group"
    type = string
  
}



variable "rds_db_name" {
    description = "database username"
    type = string
}

variable "rds_db_endpoint" {
    description = "database endpoint (hostname)"
    type = string
}

variable "rds_db_user" {
    description = "username of the rds mysql instance"
    type = string
    sensitive = true
}

variable "rds_db_password" {
    description = "password of the rds mysql instance"
    type = string
    sensitive = true
}


variable "efs_file_system" {
    type = string
}