variable "region" {
  description = "The AWS region to deploy resources."
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Type of EC2 instance."
  type        = string
  default     = "t2.micro"
}

variable "frontend_ami" {
  description = "AMI for the frontend instance."
  type        = string
}

variable "backend_ami" {
  description = "AMI for the backend instance."
  type        = string
}

variable "db_username" {
  description = "Database username."
  type        = string
}

variable "db_password" {
  description = "Database password."
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "Instance class for the RDS database."
  type        = string
  default     = "db.t3.micro"
}

variable "frontend_instance_volume_size" {
  description = "Volume size for the frontend instance."
  type        = number
  default     = 8
}

variable "backend_instance_volume_size" {
  description = "Volume size for the backend instance."
  type        = number
  default     = 8
}

variable "allocated_storage" {
  description = "Allocated storage for the RDS instance."
  type        = number
  default     = 20
}
