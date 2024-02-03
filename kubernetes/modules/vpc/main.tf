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


resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.kube_adm_vpc.id

  route {
    cidr_block = var.cidr_open
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.public_routetable_name
  }
}

resource "aws_route_table_association" "public_route_associate" {
  subnet_id      = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}


resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.kube_adm_vpc.id

  route {
    cidr_block           = var.cidr_open
    network_interface_id = var.nat_network_interface_id

  }

  tags = {
    Name = var.private_routetable_name
  }
}

resource "aws_route_table_association" "private_route_associate" {
  subnet_id      = aws_subnet.subnet_2.id
  route_table_id = aws_route_table.private_route_table.id
}