#variable "ami_id" {
#  type= string
# default= "ami-0220d79f3f480ecf5"
#}

#variable "instance_type" {
# type= string
#default= "t3.micro"
#}


variable "environment" {
  type    = string
  default = "dev"
}

variable "project" {
  type    = string
  default = "roboshop"
}

variable "domain" {
  type    = string
  default = "adarshdevopslearn.online"
}

variable "instances" {
  type = map(any)
  default = {
    "mongodb" = {
      "instance_type" = "t3.micro"
      "ami_id"        = "ami-0220d79f3f480ecf5"
    },
    "mysql" = {
      "instance_type" = "t3.micro"
      "ami_id"        = "ami-051f7e7f6c2f40dc1"
    },
    "redis" = {
      "instance_type" = "t3.micro"
      "ami_id"        = "ami-0220d79f3f480ecf5"
    },
    "rabbitmq" = {
      "instance_type" = "t3.micro"
      "ami_id"        = "ami-0220d79f3f480ecf5"
    },
    "catalouge" = {
      "instance_type" = "t3.micro"
      "ami_id"        = "ami-0220d79f3f480ecf5"
    },
    "user" = {
      "instance_type" = "t3.micro"
      "ami_id"        = "ami-0220d79f3f480ecf5"
    },
    "cart" = {
      "instance_type" = "t3.micro"
      "ami_id"        = "ami-0220d79f3f480ecf5"
    },
    "shipping" = {
      "instance_type" = "t3.micro"
      "ami_id"        = "ami-0220d79f3f480ecf5"
    },
    "payment" = {
      "instance_type" = "t3.micro"
      "ami_id"        = "ami-0220d79f3f480ecf5"
    },
    "frontend" = {
      "instance_type" = "t3.micro"
      "ami_id"        = "ami-0220d79f3f480ecf5"
    }
  }
}