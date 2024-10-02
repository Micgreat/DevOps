output "az1_NAT_public_access" {
  description = "The NAT Gateway"
  value       = aws_nat_gateway.az1_NAT_public_access.id
}

output "az2_NAT_public_access" {
  description = "The NAT Gateway"
  value       = aws_nat_gateway.az2_NAT_public_access.id
}