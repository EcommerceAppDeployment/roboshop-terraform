provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "sri-terraform-bucket" 
    key    = "tools/terraform.tfstate"
    region = "us-east-1"
  }
}


provider "vault" {
  address = "http://vault-internal.sdevops.shop:8200"
}