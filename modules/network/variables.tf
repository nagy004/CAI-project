variable "cidr_block" {
  description = "CIDR block for the VPC"
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  default     = "us-east-1a" # Update as needed
}

variable "availability_zone-2" {
  description = "Availability zone for the peivate subnet"
  default     = "us-east-1b" # Update as needed
}
# variable "security_group_id" {
#   description = "List of security group IDs"
#   type        = list(string)  # Change to list of strings
# }
