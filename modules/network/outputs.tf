
output "public_subnet_ids" {
  value = [for subnet in aws_subnet.public_subnet : subnet.id]
}

output "private_subnet_ids" {
  value = [for subnet in aws_subnet.private_subnet : subnet.id]
}

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "Nagy_security_group_id" {
  value = aws_security_group.nagy_sg.id
}


output "Nagy_db_security_group_id" {
  value = aws_security_group.nagy_db_sg.id
 
}



#------ code before refactory -------#
# output "public_subnet_id" {
#   value = aws_subnet.public_subnet.id
# }

# output "private_subnet_id" {
#   value = aws_subnet.private_subnet.id
# }