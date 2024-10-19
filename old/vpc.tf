resource "aws_vpc" "ecommerce_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "frontend_subnet" {
  vpc_id            = aws_vpc.ecommerce_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "backend_subnet" {
  vpc_id            = aws_vpc.ecommerce_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_security_group" "public_sg" {
  vpc_id = aws_vpc.ecommerce_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
