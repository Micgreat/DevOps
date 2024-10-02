# output az1 eips
output "az1_eip" {
    value = aws_eip.for_az1_NAT.id
}

# output az2 eips
output "az2_eip" {
    value = aws_eip.for_az2_NAT.id
}