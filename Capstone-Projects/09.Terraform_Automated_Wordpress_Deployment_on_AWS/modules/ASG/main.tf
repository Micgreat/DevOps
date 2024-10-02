resource "aws_launch_template" "web" {
  name          = "web-launch-configuration"
  image_id     = "ami-0ebfd941bbafe70c6"  # Replace with your desired AMI
  instance_type = "t2.micro"
  vpc_security_group_ids = var.web_sg
  user_data = base64encode(<<-EOF
              #!/bin/bash
              echo "Hello World" > index.html
              nohup python -m SimpleHTTPServer 80 &
              EOF
  )
}

resource "aws_autoscaling_group" "web" {
  launch_configuration = aws_launch_template.web.id
  min_size            = 1
  max_size            = 3
  desired_capacity    = 2
  vpc_zone_identifier = var.az

  tag {
    key                 = "Name"
    value               = "WebServer"
    propagate_at_launch = true
  }

  health_check_type          = "ELB"
  health_check_grace_period = 300

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_autoscaling_attachment" "web" {
  autoscaling_group_name = aws_autoscaling_group.web.name
  lb_target_group_arn    = var.aws_lb_target_group
}
