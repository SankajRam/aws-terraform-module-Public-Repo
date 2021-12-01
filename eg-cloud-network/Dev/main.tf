  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = var.aws_region
}


module "eg_vpc" {
source = "../modules/eg-infra-vpc"
vpc_cidr ="196.168.0.0/16"
tenancy  ="default"
vpc_id="${module.eg_vpc.vpc_id"
subnet_cidr="196.168.1.0/24"
  
}
  
