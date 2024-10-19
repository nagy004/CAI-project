variable "ami" {
  description = "AMI for the instance"
}

variable "instance_type" {
  description = "Type of instance"
}

variable "subnet_id" {
  description = "Subnet ID for the instance"
}

variable "security_group_id" {
  description = "List of security group IDs"
  type        = list(string)  # Change to list of strings
}

variable "instance_name" {
  description = "Name of the instance"
}
