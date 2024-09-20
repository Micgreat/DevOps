resource "aws_ecr_repository" "this" {
  name                 = "coles-repo"
  image_tag_mutability = "MUTABLE"  # or "IMMUTABLE" based on your requirements


  # Optionally enable scanning on push
  image_scanning_configuration {
    scan_on_push = true
  }
}
