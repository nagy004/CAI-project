module "network" {
  source = "./modules/network"
  cidr_block = var.vpc_cidr_block
}

module "backend" {
  source            = "./modules/ec2"
  instance_name     = "backend"
  ami               = var.ami
  instance_type     = var.instance_type
  subnet_id         = module.network.public_subnet_id
  security_group_id = ["module.network.security_group_id","module.network.security_group_id"]  # Pass the ID directly
}

module "frontend" {
  source            = "./modules/ec2"
  instance_name     = "frontend"
  ami               = var.ami
  instance_type     = var.instance_type
  subnet_id         = module.network.public_subnet_id
  security_group_id = ["module.network.security_group_id","module.network.security_group_id"]  # Pass the ID directly
}

module "mysql_rds" {
  source              = "./modules/rds"
  allocated_storage    = var.allocated_storage
  storage_type        = var.storage_type
  engine              = var.engine
  engine_version      = var.engine_version
  db_instance_class   = var.db_instance_class
  username            = var.db_username
  password            = var.db_password
  db_name             = var.db_name
  subnet_group_id     = module.network.public_subnet_id
  security_group_id   = ["module.network.security_group_id","module.network.security_group_id"]  # Pass the ID directly
}
provider "aws" {
  region = var.aws_region  
}

