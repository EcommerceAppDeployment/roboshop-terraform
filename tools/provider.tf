provider "vault" {
    address = "https://vault_p-internal.sdevops.shop:8200"
    skip_tls_verify = true
   
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {}
}