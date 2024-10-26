#------------------------------------ Network -------------------------------------#
module "network" {
  source = "./modules/network"
  cidr_block = var.vpc_cidr_block
}

#-------------------------------------- EC2 ---------------------------------------#

locals {
  ec2_instances = [
    {
      name          = "backend"
      ami           = var.ami
      instance_type = var.instance_type
    },
    {
      name          = "frontend"
      ami           = var.ami
      instance_type = var.instance_type
    }
  ]
}

module "ec2_instances" {
  source  = "./modules/ec2"
  for_each = { for instance in local.ec2_instances : instance.name => instance }
  
  instance_name = each.value.name
  ami           = each.value.ami
  instance_type = each.value.instance_type
  subnet_id     = module.network.public_subnet_ids[0]
  SG-id         = module.network.Nagy_security_group_id
}


#-------- code before refactory ---------#

# module "backend" {
#   source            = "./modules/ec2"
#   instance_name     = "backend"
#   ami               = var.ami
#   instance_type     = var.instance_type
#   subnet_id         = module.network.public_subnet_id
#   SG-id = module.network.Nagy_security_group_id
# }

# module "frontend" {
#   source            = "./modules/ec2"
#   instance_name     = "frontend"
#   ami               = var.ami
#   instance_type     = var.instance_type
#   subnet_id         = module.network.public_subnet_id
#   SG-id = module.network.Nagy_security_group_id
# }

#-------------------------------------- RDS ---------------------------------------#

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
  subnet_group_id     = module.network.private_subnet_ids[0]
  Nagy-DB-security_group_id = module.network.Nagy_db_security_group_id
}
provider "aws" {
  region = var.aws_region  
}

