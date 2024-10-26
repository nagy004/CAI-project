variable "cidr_block" {
  description = "CIDR block for the VPC"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}





# variable "availability_zones" {
#   description = "List of availability zones"
#   type        = list(string)
#   default     = ["us-east-1a", "us-east-1b"]
# }

