resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "tf-vpc"
  }
}

resource "aws_internet_gateway" "my_ig" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "tf-ig"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id                 = aws_vpc.my_vpc.id
  cidr_block             = var.subnet_cidr_block
  availability_zone      = "${var.aws_region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "tf-subnet"
  }
}

resource "aws_route_table" "my_routeTable" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_ig.id
  }

  tags = {
    Name = "tf-rt"
  }
}

resource "aws_route_table_association" "public_subnet_asso" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.my_routeTable.id
}

resource "aws_security_group" "my_securityGroup" {
  name   = "tf-securityGroup"
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

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
