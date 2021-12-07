resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.tenancy}"
  
  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "${var.subnet_cidr}"
  azs      = "${var.zone}"                                       //["eu-west-1a", "eu-west-1b", "eu-west-1c"]
private_subnets ="null"                                               //["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets  = "null"                                              //["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
enable_nat_gateway = true
enable_vpn_gateway = true

  tags = {
    Name = "Main"
  }
}

output "aws_vpc"{
  value="${aws_vpc.main.id}"
}

