# Create security group for the bastion host
resource "aws_security_group" "ssh" {
  name        = "ssh_sg"
  description = "Security group to allow SSH access"
  vpc_id      = var.vpc_id

  # Inbound rule to allow SSH (port 22) from any IP (0.0.0.0/0)
  ingress {
    description      = "Allow SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  # Outbound rules - allow all outbound traffic
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh-sg"
  }
}



# Create security group for ALB
resource "aws_security_group" "alb" {
  name        = "alb_sg"
  description = "Security group to allow ALB access"
  vpc_id      = var.vpc_id

   # Inbound rule to allow HTTP (port 80)
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

    # Inbound rule to allow HTTPS (port 443) from any IP (0.0.0.0/0)
  ingress {
    description      = "Allow HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
 
   # Outbound rules - allow all outbound traffic
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb-sg"
  }
}


# Create security group for Webserver
resource "aws_security_group" "web" {
  name        = "web_sg"
  description = "Security group to allow Webserver access"
  vpc_id      = var.vpc_id

   # Allow HTTP (80) from alb-sg
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups =  [aws_security_group.alb.id]
  }

    # Allow HTTPS (443) from alb-sg
  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

    # Allow SSH (22) from ssh-sg
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups = [aws_security_group.ssh.id]
  }
 
   # Outbound rules - allow all outbound traffic
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}



# Create security group for database
resource "aws_security_group" "db" {
  name        = "db_sg"
  description = "Security group to allow RDS access"
  vpc_id      = var.vpc_id

   # Inbound rule to allow RDS
    ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.web.id]
  }

   # Outbound rules - allow all outbound traffic
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "db-sg"
  }
}


# Create security group for EFS
resource "aws_security_group" "efs" {
  name        = "efs_sg"
  description = "Security group to allow EFS access"
  vpc_id      = var.vpc_id

   # Allow NFS (2049) from web-sg
  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    security_groups =  [aws_security_group.web.id]
  }

    # Allow NFS (2049) from ssh-sg
  ingress {
    from_port        = 2049
    to_port          = 2049
    protocol         = "tcp"
    security_groups = [aws_security_group.ssh.id]
    
  }
  
   # Outbound rules - allow all outbound traffic
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "efs-sg"
  }
}