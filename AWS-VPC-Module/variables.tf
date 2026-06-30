variable "cidr_vpc" {
  type        = string
  default     = "10.0.0.0/16"
}

variable "project" {
  type        = string
}

variable "environment" {
  type        = string
}

variable "vpc_tags"{
  type        = map(string)
  default     = {}
}

variable "internetgateway_tags"{
  type        = map(string)
  default     = {}
}

variable "public_subnet_tags"{
  type        = map(string)
  default     = {}
}

variable "private_subnet_tags"{
  type        = map(string)
  default     = {}
}

variable "database_subnet_tags"{
  type        = map(string)
  default     = {}
}

variable "public_routetable_tags"{
  type        = map(string)
  default     = {}
}

variable "private_routetable_tags"{
  type        = map(string)
  default     = {}
}

variable "database_routetable_tags"{
  type        = map(string)
  default     = {}
}

variable "elastip_ip_tags"{
  type        = map(string)
  default     = {}
}

variable "public_subnet_cidrs"{
  type        = list(string)
  default     = ["10.0.1.0/24","10.0.2.0/24"]
  validation {
    condition     = length(var.public_subnet_cidrs) == var.no_of_availability_zones
    error_message = "The number of public subnet CIDRs must match the number of availability zones."
  }
}

variable "private_subnet_cidrs"{
  type        = list(string)
  default     = ["10.0.10.0/24","10.0.11.0/24"]
  validation {
    condition     = length(var.private_subnet_cidrs) == var.no_of_availability_zones
    error_message = "The number of private subnet CIDRs must match the number of availability zones."
  }
}

variable "database_subnet_cidrs"{
  type        = list(string)
  default     = ["10.0.20.0/24","10.0.21.0/24"]
  validation {
    condition     = length(var.database_subnet_cidrs) == var.no_of_availability_zones
    error_message = "The number of database subnet CIDRs must match the number of availability zones."
  }
}


variable "no_of_availability_zones"{
  type        = number
  default     = 2
}