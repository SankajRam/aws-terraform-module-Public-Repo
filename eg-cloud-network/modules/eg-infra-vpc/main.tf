resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.tenancy}"
  
  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "${var.subnet_cidr}"

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

