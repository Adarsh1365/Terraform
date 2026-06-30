variable "project" {
  type        = string
  default     = "roboshop"
}

variable "environment" {
  type        = string
  default     = "test"
}

variable "component" {
  type        = string
  default     = "cart"
}

variable "ami_id" {
  type        = string
  default     = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
}

