terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.48.0"
    }
  }

  backend "s3" {
    bucket  = "remote-state-bucket-90s"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    use_lockfile= true
  }

}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}