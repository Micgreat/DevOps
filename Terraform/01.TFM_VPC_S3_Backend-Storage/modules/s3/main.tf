resource "aws_s3_bucket" "example" {
  bucket = "cole-palmer-is-a-baller"

  force_destroy = true

  tags = {
    Name        = "cole-palmer"
    Environment = "Dev"
  }
}
