variable "aws_region" {
  description = "The AWS region to deploy to"
  type        = string
  default     = "us-east-1"  # Change this to your desired region
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "ami" {
  description = "AMI ID for Ubuntu 22.04"
  default     = "ami-0c55b159cbfafe1f0" # Update with the correct AMI ID
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  default     = "t2.micro"
}

variable "allocated_storage" {
  description = "Allocated storage for the RDS instance"
  default     = 20
}

variable "storage_type" {
  description = "Storage type for the RDS instance"
  default     = "gp2"
}

variable "engine" {
  description = "Database engine"
  default     = "mysql"
}

variable "engine_version" {
  description = "Version of the database engine"
  default     = "8.0"
}

variable "db_instance_class" {
  description = "DB instance class for RDS"
  default     = "db.t3.micro"
}

variable "db_username" {
  description = "Username for the database"
}

variable "db_password" {
  description = "Password for the database"
}

variable "db_name" {
  description = "Name of the database to create"
  default     = "mydatabase"
}
