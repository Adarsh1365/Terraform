variable "project" {
  type        = string
}

variable "environment" {
  type        = string
}

variable "component" {
  type        = string
}

variable "tags"{
    type        = map(string)
  default     = {}
}
variable "vpc_id" {
  type        = string
}