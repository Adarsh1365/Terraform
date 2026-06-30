variable "ami_id" {
  type=string
}

variable "instance_type" {
  type=string
  default="t2.micro"
  validation {
    condition     = contains(["t3.micro", "t3.small", "t3.medium"], var.instance_type)
    error_message = "Invalid instance type. Allowed values are: t3.micro, t3.small, t3.medium."
  }
}

variable "sg_ids" {
  type=list
}

variable "project" {
    type=string
}

variable "environment" {
    type=string
}

variable "component" {
    type=string
}

variable "ec2_tags" {
    type=map
    default = {}
}

variable "subnet_id" {
  type=string
}