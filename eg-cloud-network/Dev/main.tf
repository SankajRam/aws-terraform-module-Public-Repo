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
subnet_cidr="${var.subnet_cidr}"
vpc_name="${var.vpc_name}"
region="${var.region"}
}
#vpc_id="${module.eg_vpc.vpc.id}"

