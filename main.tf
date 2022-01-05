terraform {
  required_providers {
    spacelift = {
      source = "spacelift-io/spacelift"
      version = "0.1.8"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.64.2"
    }

    local = {
      source = "hashicorp/local"
      version = "2.1.0"
    }
  }
}
