terraform {
  required_version = ">= 1.0.0"
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs = var.azs
}

module "ec2" {
  source = "./modules/ec2"
  subnet_id = module.subnet.public_subnet_ids[0]
  instance_type = var.instance_type
  ami_id = var.ami_id
  key_name = var.key_name
}
