provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  subnet_cidr_block = var.subnet_cidr_block
  aws_region = var.aws_region
}

module "ec2" {
  source = "./modules/ec2"
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = module.vpc.subnet_id
  security_group_id = module.vpc.security_group_id
}

output "myA_public_ip" {
  value = module.ec2.public_ip
}

output "myB_vpc" {
  value = module.vpc.vpc_id
}

output "myC_subnet" {
  value = module.vpc.subnet_id
}

output "myD_arn" {
  value = module.vpc.vpc_arn
}

output "myE_IG" {
  value = module.vpc.ig_id
}
123
