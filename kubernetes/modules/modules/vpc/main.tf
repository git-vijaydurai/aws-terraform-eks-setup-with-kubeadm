resource "aws_vpc" "kube_adm_vpc" {

  cidr_block       = var.kube_adm_vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "subnet_1" {
  vpc_id            = aws_vpc.kube_adm_vpc.id
  cidr_block        = var.subnet-01_cidr
  availability_zone = var.az_zone_a

  tags = {
    Name = var.subnet-01_name
  }
}

resource "aws_subnet" "subnet_2" {
  vpc_id            = aws_vpc.kube_adm_vpc.id
  cidr_block        = var.subnet-02_cidr
  availability_zone = var.az_zone_b

  tags = {
    Name = var.subnet-02_name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.kube_adm_vpc.id

  tags = {
    Name = var.kube-adm_igw-name
  }
}


resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.kube_adm_vpc.id

  route {
    cidr_block = var.cidr_open
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.routetable_name
  }
}

resource "aws_route_table_association" "one_route_associate" {
  subnet_id      = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.route_table.id
}


resource "aws_route_table_association" "two_route_associate" {
  subnet_id      = aws_subnet.subnet_2.id
  route_table_id = aws_route_table.route_table.id
}
