resource "aws_db_subnet_group" "mysql_subnet_group" {
  name       = "mysql-subnet-group"
  subnet_ids = [aws_subnet.frontend_subnet.id, aws_subnet.backend_subnet.id]

  tags = {
    Name = "MySQL Subnet Group"
  }
}

resource "aws_db_instance" "mysql" {
  allocated_storage     = var.allocated_storage
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = var.db_instance_class
  name                 = "ecommerce_db"
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.mysql_subnet_group.name
  skip_final_snapshot  = true

  tags = {
    Name = "MySQLDatabase"
  }
}
