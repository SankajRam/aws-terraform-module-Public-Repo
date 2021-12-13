variable "region"{
  type        = string
  description = "region"
}

variable "zone"{
  type        = string
  description = "VPC Zone"
}

variable "vpc_cidr"{
  type        = string
  description = "CIDR"
}

variable "subnet_cidr"{
  type        = string
  description = "CIDR"
}

variable "vpc_name"{
  type   = string
  description= "vpc name "
}

variable "subnet" {
   type = map
   default = {
      sub-1 = {
         az = "az1"
         cidr = "az1_cidr"
      }
      sub-2 = {
         az = "az2"
         cidr = "az2_cidr"
      }
      sub-3 = {
         az = "az3"
         cidr = "az3_cidr"
      }
   }
}
