terraform {
  required_providers {
    spacelift = {
      source = "spacelift-io/spacelift"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.64.2"
    }
  }
}