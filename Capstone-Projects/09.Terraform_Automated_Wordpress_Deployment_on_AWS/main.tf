# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"
}

module "igw" {
  source = "./modules/igw"
  vpc_id = module.vpc.vpc_id
}

module "subnets" {
  source = "./modules/subnets"
  vpc_id = module.vpc.vpc_id
}

module "route_tables" {
  source                  = "./modules/route_tables"
  vpc_id                  = module.vpc.vpc_id
  aws_internet_gateway    = module.igw.aws_internet_gateway
  az1_NAT_public_access   = module.NAT.az1_NAT_public_access
  az2_NAT_public_access   = module.NAT.az2_NAT_public_access
  az1_public_subnets_ids  = module.subnets.az1_public_subnets_ids
  az2_public_subnets_ids  = module.subnets.az2_public_subnets_ids
  private_az1_subnets_ids = module.subnets.private_az1_subnets_ids
  private_az2_subnets_ids = module.subnets.private_az2_subnets_ids

}

module "eip" {
  source = "./modules/elastic_ip"
}

module "NAT" {
  source                 = "./modules/NAT"
  az1_eip                = module.eip.az1_eip
  az2_eip                = module.eip.az2_eip
  az1_public_subnets_ids = module.subnets.az1_public_subnets_ids
  az2_public_subnets_ids = module.subnets.az2_public_subnets_ids
}

module "security_groups" {
  source = "./modules/security_group"
  vpc_id                  = module.vpc.vpc_id
}

module "ec2_bastion" {
  source                 = "./modules/ec2"
  az1_public_subnets_ids = module.subnets.az1_public_subnets_ids
  security_group_id      = module.security_groups.security_group_id
  rds_db_name            = module.rds.rds_db_name
  rds_db_endpoint        = module.rds.rds_db_endpoint
  rds_db_user            = module.rds.rds_db_user
  rds_db_password        = module.rds.rds_db_password
  efs_file_system        = module.efs.efs_file_system

}

module "rds" {
    source = "./modules/RDS"
    private_az1_subnets_ids = module.subnets.private_az1_subnets_ids
    private_az2_subnets_ids = module.subnets.private_az2_subnets_ids
    rds_sg              = module.security_groups.rds_sg
}

module "efs" {
    source = "./modules/EFS"
    private_az1_subnets_ids = module.subnets.private_az1_subnets_ids
    private_az2_subnets_ids = module.subnets.private_az2_subnets_ids
    efs_sg = module.security_groups.efs_sg
  
}

module "alb" {
  source = "./modules/ALB"
  alb_sg = module.security_groups.alb_sg
  az1_public_subnets_ids = module.subnets.az1_public_subnets_ids
  az2_public_subnets_ids = module.subnets.az2_public_subnets_ids
  vpc_id                  = module.vpc.vpc_id
}
  
module "asg" {
  source = "./modules/ASG"
  web_sg = module.security_groups.web_sg
  aws_lb_target_group = module.alb.aws_lb_target_group
}