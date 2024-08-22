# first upon create s3 bucket 
# this bucket name is add this script 
terraform {
  backend "s3" {
    bucket = "shrimanthbirajdar-b70"
    region = "us-east-1"
    key = "terraform.tfstate"
  }
}
provider "aws" {
  
}
resource "aws_instance" "myinstance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  tags                   = var.tags
  vpc_security_group_ids = var.vpc_security_group_ids
}

variable "region" {
  description = "Please enter AWS region"
  default     = "us-east-1"
}

variable "key_name" {
  default = "pj"
}

variable "tags" {
  type = map(string)
  default = {
    env  = "dev"
    Name = "instance1"
  }
}

variable "vpc_security_group_ids" {
  type    = list(string)
  default = ["sg-095d16c928a4862ed"]
}

variable "ami" {
  default = "ami-04a81a99f5ec58529"
}

variable "instance_type" {
  default = "t2.micro"
}
