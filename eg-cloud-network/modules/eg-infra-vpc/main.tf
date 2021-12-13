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
    #Name="${var.vpc_name}"
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

# resource "aws_vpc_endpoint" "s3" {
#   vpc_id     = aws_vpc.r21vpc.id
#   service_name = "com.amazonaws.${var.region}.s3"
#   route_table_ids = aws_route_table.igw_rt.id 
#   route_table_ids = [
#       aws_route_table.route_tables["${local.stz_rt}"].id,
#       aws_route_table.route_tables["${local.sec_rt}"].id
#   ]

#   tags = {
#     Environment = var.vpc_name
#   }
# }    

resource "aws_security_group" "asg" {
  name        = "egain-asg-01"
  description = "Allow TCP inbound traffic"
  vpc_id = aws_vpc.r21vpc.id
  ingress {
    description      = "Application Access"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    description      = "EG5080-STZ-2b"
    from_port        = 8443
    to_port          = 8443
    protocol         = "tcp"
    cidr_blocks      = ["172.22.61.0/25"]
  }
  tags = {
    Name = "sg"
  }
}

resource "aws_network_acl" "nacl" {
  vpc_id = aws_vpc.r21vpc.id
 
  egress {
    protocol   = "tcp"
    rule_no    = 500
    action     = "allow"
    cidr_block = "172.22.60.0/25"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 900
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 1024
  }

  tags = {
    Name = "nacl"
  }
}
