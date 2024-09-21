resource "aws_instance" "ec2test" {
  ami           = "ami-0ebfd941bbafe70c6"
  instance_type = "t2.micro"

}