resource "aws_db_instance" "mysql" {
  allocated_storage    = var.allocated_storage
  storage_type        = var.storage_type
  engine              = var.engine
  engine_version      = var.engine_version
  instance_class      = var.db_instance_class
  username            = var.username
  password            = var.password
  skip_final_snapshot = true

  db_subnet_group_name = var.subnet_group_id
  vpc_security_group_ids = [var.Nagy-DB-security_group_id]
}

