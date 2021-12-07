terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "${var.region}"
  access_key = "AKIARJ6UUCFIPOB7V3JD"
  secret_key = "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"
}


module "eg_vpc" {
source = "../modules/eg-infra-vpc"
vpc_cidr ="${var.vpc_cidr}"
tenancy  ="default"
azs      = "${var.zone}"                                       //["eu-west-1a", "eu-west-1b", "eu-west-1c"]
private_subnets ="null"                                               //["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets  = "null"                                              //["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
enable_nat_gateway = true
enable_vpn_gateway = true
subnet_cidr="${var.subnet_cidr}"
tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
#vpc_id="${module.eg_vpc.vpc.id}"

