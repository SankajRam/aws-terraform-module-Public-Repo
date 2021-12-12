resource "aws_vpc" "r21vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.tenancy}"
  
  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

resource "aws_subnet" "r21subnet" {
  vpc_id     = aws_vpc.r21vpc.id
  cidr_block = "${var.subnet_cidr}"
  availability_zone = "${var.zone}"          
  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id     = aws_vpc.r21vpc.id
  tags = {
    Name = var.vpc_name
    Terraform = "true"
    Environment = "dev"
  }
}

resource "aws_route_table" "igw_rt" {
  vpc_id = aws_vpc.r21vpc.id
  tags = {
    Name = "igw_rt"
    Terraform = "true"
    Environment = "dev"
  }
  
  
}

resource "aws_route" "rtb" {
  route_table_id            = aws_route_table.igw_rt.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "rt_associations" {
  subnet_id      = aws_subnet.r21subnet.id
  route_table_id = aws_route_table.igw_rt.id
}



