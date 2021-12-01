terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
  access_key = "AKIARJ6UUCFIPOB7V3JD"
  secret_key = "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"
}


module "eg_vpc" {
source = "../modules/eg-infra-vpc"
vpc_cidr ="196.168.0.0/16"
tenancy  ="default"
vpc_id="${module.eg_vpc.vpc_id}"
subnet_cidr="196.168.1.0/24"
  
}
  
