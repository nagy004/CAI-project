resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr_block
}

#------------------------------------------- Security Groups ------------------------------------------------#

resource "aws_security_group" "nagy_sg" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # SSH access
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # HTTP access
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # HTTPS access
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "frontend_sg"
  }
}

resource "aws_security_group" "nagy_db_sg" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.nagy_sg.id]  # Allow traffic from backend_sg
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "backend_sg"
  }
}


resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
}



#-------------------------------------------------- Subnet ----------------------------------------------------#


# Public subnets
resource "aws_subnet" "public_subnet" {
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "Nagy-Public Subnet-${count.index + 1}"
  }
}

# Private subnets
resource "aws_subnet" "private_subnet" {
  count                   = length(var.private_subnet_cidrs)
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private_subnet_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name = "Nagy-Private Subnet-${count.index + 1}"
  }
}


#------ code before refactory -------#

# resource "aws_subnet" "public_subnet" {
#   vpc_id                  = aws_vpc.my_vpc.id
#   cidr_block              = "10.0.1.0/24"  # Public subnet CIDR block
#   availability_zone       = var.availability_zones[0]

#   map_public_ip_on_launch = true  # Enable public IP assignment

#   tags = {
#     Name = "Nagy-Public Subnet"
#   }
# }

# resource "aws_subnet" "private_subnet" {
#   vpc_id                  = aws_vpc.my_vpc.id
#   cidr_block              = "10.0.2.0/24"  # Private subnet CIDR block
#   availability_zone       = var.availability_zones[1]

#   map_public_ip_on_launch = false  # Disable public IP assignment

#   tags = {
#     Name = "Nagy-Private Subnet"
#   }
# }


#----------------------------------------------- Routing Table -----------------------------------------------#

# Public Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
}

# Associate public subnets with the public route table
resource "aws_route_table_association" "public_route_table_association" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

#------ code before refactory -------#

# resource "aws_route_table" "public_route_table" {
#   vpc_id = aws_vpc.my_vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.my_igw.id
#   }
# }

# resource "aws_route_table_association" "public_route_table_association" {
#   subnet_id      = aws_subnet.public_subnet.id
#   route_table_id = aws_route_table.public_route_table.id
# }


