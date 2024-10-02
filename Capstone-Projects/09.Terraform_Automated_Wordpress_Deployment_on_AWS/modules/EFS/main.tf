resource "aws_efs_file_system" "wordpress_efs" {
  creation_token = "wordpress-efs"
  performance_mode = "generalPurpose"

  tags = {
    Name = "wordpress-efs"
  }
}

resource "aws_efs_mount_target" "wordpress_mount_target_az1" {
  file_system_id = aws_efs_file_system.wordpress_efs.id
  subnet_id      = var.private_az1_subnets_ids[1]  # Your public subnet ID
  security_groups = var.efs_sg # Security group for EFS
}

resource "aws_efs_mount_target" "wordpress_mount_target_az2" {
  file_system_id = aws_efs_file_system.wordpress_efs.id
  subnet_id      = var.private_az2_subnets_ids[1]  # Your public subnet ID
  security_groups = var.efs_sg  # Security group for EFS
}
