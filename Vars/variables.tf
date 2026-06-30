variable "environment" {
  type= string
  default = "dev"
}
variable "project" {
  type= string
  default = "roboshop"
}
variable "ami_id" {
  type= string
  default = "ami-0220d79f3f480ecf5"
  description = "ami id of Redhat"
}

variable "instance_type" {
  type= string
  default = "t3.micro"
  description = "instance type"
}

variable "ec2-instance" {
  type= list(string)
  default = ["mongodb", "mysql", "redis","rabbitmq"]
}