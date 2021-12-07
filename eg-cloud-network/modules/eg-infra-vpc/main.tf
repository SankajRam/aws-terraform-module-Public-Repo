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
  azs             = "var.zone}          //["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

