# EC2 Module and Security Group Module with Apache2 UserData

I used Terraform to create modularized configurations for deploying an EC2 instance with a specified security group and apache2 installed using UserData.

## Task 1: EC2 Module

```markdown
provider "aws" {
  region     = "us-east-1"
  access_key = "paste-access-key"
  secret_key = "paste-secret-key"
}

resource "aws_instance" "ec2test" {
  ami           = "ami-0ebfd941bbafe70c6"
  instance_type = "t2.micro"
```

## Task 2: Security Group Module

```markdown
resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP inbound traffic and all outbound traffic"
  vpc_id      = "vpc-02083b2bc94485b7a"

}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.allow_http.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}
```

## Task 3: UserData Script

`apache_userdata.sh`

```markdown
#!/bin/bash

# Update the package list
sudo apt update -y

# Install Apache2
sudo apt install apache2 -y

# Enable Apache2 to start on boot
sudo systemctl enable apache2

# Start the Apache2 service
sudo systemctl start apache2
```

## Task 4: Main Terraform Config

```markdown
provider "aws" {
  region     = "us-east-1"
  access_key = "paste_access_key"
  secret_key = "paste_secret_key"
}

module "ec2test"{
    source = "./modules/ec2"
}

module "security-group" {
  source  = "./modules/security_group"
}
```

## Task 5: Deployment

```markdown
terraform init    # Initializes Terraform, downloading necessary providers
terraform plan    # Creates an execution plan.
terraform apply   # Applies the changes to create the ECS cluster

```