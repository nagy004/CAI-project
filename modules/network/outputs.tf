output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet
}



output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "security_group_id" {
  value = [aws_security_group.nagy_sg]  # Wrap in brackets to ensure it's a list
}


