provider "aws" {
  region = "us-east-1"  # Change to your desired region
}

module "ecr" {
  source          = "./modules/ecr"
  repository_name = "coles-repo"  # Change this to your desired repository name
 
}

module "ecs" {
  source      = "./modules/ecs"
  cluster_name = "coles-cluster"  # Change this to your desired cluster name

}
