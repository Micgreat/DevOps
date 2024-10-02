# DB Subnet Group for RDS
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [var.private_az1_subnets_ids[1]]

  tags = {
    Name = "rds-subnet-group"
  }
}

# MySQL RDS instance
resource "aws_db_instance" "mysql" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0.23"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "MySecurePassword123"
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = var.rds_sg
  publicly_accessible  = false

  storage_type         = "gp2"
  backup_retention_period = 7
  skip_final_snapshot  = true

  tags = {
    Name = "mysql-rds"
  }
}