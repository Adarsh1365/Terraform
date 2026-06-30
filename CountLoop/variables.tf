variable "ami_id" {
  type= string
  default= "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
  type= string
  default= "t3.micro"
}

variable "instances" {
  type= list(string)
  default= ["mongodb", "mysql", "redis", "rabbitmq", "catalouge", "user", "cart", "shipping", "payment", "frontend"]
}

 variable "environment"{
   type= string
   default= "dev"
 }

variable "project"{
  type= string
  default= "roboshop"
}

variable "domain"{
  type= string
  default= "adarshdevopslearn.online"
}