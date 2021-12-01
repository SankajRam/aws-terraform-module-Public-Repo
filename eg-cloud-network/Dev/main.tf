module "eg_vpc" {
source = "../modules/eg-infra-vpc"
vpc_cidr ="196.168.0.0/16"
tenancy  ="default"
vpc_id="${module.eg_vpc.vpc_id"
subnet_cidr="196.168.1.0/24"
  
}
  
