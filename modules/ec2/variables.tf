variable "ami" {
  description = "AMI for the instance"
}

variable "instance_type" {
  description = "Type of instance"
}

variable "subnet_id" {
  description = "Subnet ID for the instance"
}

variable "SG-id" {
    type = string
  
}

variable "instance_name" {
  description = "Name of the instance"
}
