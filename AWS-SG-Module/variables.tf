variable "project" {
  type        = string
}

variable "environment" {
  type        = string
}

variable "sg_name" {
  type        = string
}

variable "tags"{
    type        = map(string)
  default     = {}
}
variable "vpc_id" {
  type        = string
}