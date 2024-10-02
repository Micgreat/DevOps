# Output the RDS instance details
output "rds_db_endpoint" {
  description = "The endpoint of the RDS MySQL instance"
  value       = aws_db_instance.mysql.endpoint
}

output "rds_db_name" {
  description = "The database name for the RDS MySQL instance"
  value       = aws_db_instance.mysql.db_name
}

# Output for Database Username
output "rds_db_user" {
  description = "The username for the RDS MySQL instance"
  value       = aws_db_instance.mysql.username
  sensitive   = true
}

# Output for Database Password
output "rds_db_password" {
  description = "The password for the RDS MySQL instance"
  value       = aws_db_instance.mysql.password
  sensitive   = true
}