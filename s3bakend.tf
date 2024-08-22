terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "shrimanthbirajdar-b60"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
