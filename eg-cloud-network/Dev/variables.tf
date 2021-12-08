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
