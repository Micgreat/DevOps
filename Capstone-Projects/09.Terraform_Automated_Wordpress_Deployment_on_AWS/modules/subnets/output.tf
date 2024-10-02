# output of az1 public subnets ids
output "az1_public_subnets_ids" {
    description = "The ID's of az1 public subnets created"
    value       = aws_subnet.az1_public_subnets.id
}

# output of az2 public subnets ids
output "az2_public_subnets_ids" {
    description = "The ID's of az2 public subnets created"
    value       = aws_subnet.az2_public_subnets.id
}




# output of private az1 subnets ids
output "private_az1_subnets_ids" {
    description = "The ID's of private az1 subnets created"
    value = aws_subnet.private_az1_group_subnets[*].id  
}

# output of private az2 subnets ids
output "private_az2_subnets_ids" {
    description = "The ID's of private az2 subnets created"
    value = aws_subnet.private_az2_group_subnets[*].id  
}

