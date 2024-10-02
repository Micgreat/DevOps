

variable "web_sg" {
    type = list(string) 
}

variable "az" {
    description = "Availabiilty zones list"
    type = list(string)
    default = [ "us-east-1a", "us-east-1b" ]
    sensitive = true 
}

variable "aws_lb_target_group" {
    type = string 
}