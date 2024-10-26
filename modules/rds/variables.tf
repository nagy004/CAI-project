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
  description = "DB instance class"
}

variable "username" {
  description = "Username for the database"
}

variable "password" {
  description = "Password for the database"
}

variable "db_name" {
  description = "Name of the database to create"
}

variable "subnet_group_id" {
  description = "Subnet group for the RDS"
}

variable "Nagy-DB-security_group_id" {
   type = string

}

variable "final_snapshot_identifier" {
  description = "Identifier for the final snapshot"
  default     = "final-snapshot"
}


