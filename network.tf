resource "aws_vpc" "main" {
  cidr_block  = "10.0.0.0/16"
  tags = {
    Name  = "cloud-1-main"
  }
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  tags = {
    Name = "cloud-1-public-sub"
  }
  availability_zone = var.availability_zone
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-west-3a"
  tags = {
    Name= "cloud-1-private-sub"
  }
}

resource "aws_subnet" "private-2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "eu-west-3b"
  tags = {
    Name= "cloud-1-private-sub-2"
  }
}


resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "cloud-1-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    name = "cloud-1-public-rt"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "private-2" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table_association" "private" {
  subnet_id = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-2" {
  subnet_id = aws_subnet.private-2.id
  route_table_id = aws_route_table.private-2.id
}

resource "aws_route_table_association" "public" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}