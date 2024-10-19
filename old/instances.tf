resource "aws_instance" "frontend" {
  ami                    = var.frontend_ami
  instance_type         = var.instance_type
  subnet_id             = aws_subnet.frontend_subnet.id
  associate_public_ip_address = true
  security_groups       = [aws_security_group.public_sg.name]

  root_block_device {
    volume_size = var.frontend_instance_volume_size
  }

  tags = {
    Name = "Frontend"
  }
}

resource "aws_instance" "backend" {
  ami                    = var.backend_ami
  instance_type         = var.instance_type
  subnet_id             = aws_subnet.backend_subnet.id
  associate_public_ip_address = true
  security_groups       = [aws_security_group.public_sg.name]

  root_block_device {
    volume_size = var.backend_instance_volume_size
  }

  tags = {
    Name = "Backend"
  }
}
