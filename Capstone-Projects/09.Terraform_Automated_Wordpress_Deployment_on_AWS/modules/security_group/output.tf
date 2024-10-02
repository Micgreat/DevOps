output "security_group_id" {
  description = "The ID of the security group allowing SSH and HTTP"
  value       = aws_security_group.ssh.id
}

output "rds_sg" {
  description = "ID of the security group for RDS DB"
  value       = [aws_security_group.db.id]
}

output "efs_sg" {
  description = "security group of efs"
  value = [aws_security_group.efs.id]
}

output "alb_sg" {
  description = "security group of alb"
  value = [aws_security_group.alb.id]
}

output "web_sg" {
  description = "security group of alb"
  value = [aws_security_group.web.id]
}