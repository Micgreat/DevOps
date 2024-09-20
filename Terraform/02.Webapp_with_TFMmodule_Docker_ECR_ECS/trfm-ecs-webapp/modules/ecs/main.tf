resource "aws_ecs_cluster" "foo" {
  name = "coles-cluster"

}

resource "aws_ecs_task_definition" "my_task" {
  family                   = "my-task-family"
  network_mode            = "awsvpc"  # or "bridge"
  requires_compatibilities = ["EC2"]  # or "FARGATE"

  container_definitions = jsonencode([{
    name      = "my-container"
    image     = "aws_account_id.dkr.ecr.us-east-1.amazonaws.com/coles-repo:latest"
    memory    = 512
    cpu       = 256
    essential = true
    portMappings = [{
      containerPort = 80
      hostPort      = 80
    }]
  }])
}

resource "aws_ecs_service" "my_service" {
  name            = "my-service"
  cluster         = aws_ecs_cluster.foo.id
  task_definition = aws_ecs_task_definition.my_task.id
  desired_count   = 1

  launch_type = "EC2"  # or "FARGATE"

  network_configuration {
    subnets          = ["subnet-xxx"]  # Add your subnet IDs
    security_groups  = ["sg-xxx"]      # Add your security group ID
    assign_public_ip = false
  }
}
