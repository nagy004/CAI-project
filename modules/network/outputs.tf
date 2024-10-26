output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}



output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "Nagy_security_group_id" {
  value = aws_security_group.nagy_sg.id
}


output "Nagy_db_security_group_id" {
  value = aws_security_group.nagy_db_sg.id
  # count = length(var.subnet-cidr)
  
}


