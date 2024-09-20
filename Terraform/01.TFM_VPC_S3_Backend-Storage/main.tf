provider "aws" {
  region     = "check_console"
  access_key = "paste_access_key"
  secret_key = "paste_secret_key"
}

module "vpc"{
    source = "./modules/vpc"
}

module "bucket"{
    source = ".//modules/s3"
}
