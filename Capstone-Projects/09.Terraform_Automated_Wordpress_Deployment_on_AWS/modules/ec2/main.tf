# Create a bastion host (jump server)... EC2 instance with the apache user data

resource "aws_instance" "bastion_host" {
  ami           = "ami-0ebfd941bbafe70c6"
  instance_type = "t2.micro"
  subnet_id = var.az1_public_subnets_ids
  security_groups = [var.security_group_id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd

               # Download and set up WordPress
              wget https://wordpress.org/latest.tar.gz
              tar -xzf latest.tar.gz
              cp -r wordpress/* /var/www/html/
              chown -R apache:apache /var/www/html/
              chmod -R 755 /var/www/html/

              # Configure WordPress to connect to RDS
              cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
              sed -i "s/database_name_here/${var.rds_db_name}/" /var/www/html/wp-config.php
              sed -i "s/username_here/${var.rds_db_user}/" /var/www/html/wp-config.php
              sed -i "s/password_here/${var.rds_db_password}/" /var/www/html/wp-config.php
              sed -i "s/localhost/${var.rds_db_endpoint}/" /var/www/html/wp-config.php

              systemctl restart httpd

              yum update -y
              yum install -y amazon-efs-utils
              mkdir -p /var/www/html
              mount -t efs -o tls ${var.efs_file_system}:/ /var/www/html
              echo "${var.efs_file_system}:/ /var/www/html efs defaults,_netdev 0 0" >> /etc/fstab
              EOF

}