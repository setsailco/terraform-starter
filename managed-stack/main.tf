# This resource here is to show you how plan policies work.

provider "aws" {
  region = "us-east-1"
}

provider "spacelift" {}

data "spacelift_current_stack" "this" {}

resource "random_password" "secret" {
  length  = 32
  special = true
}

module "ec2-module" {
  source  = "spacelift.io/setsailco/ec2-module/default"
  version = "0.0.1"

  # Required inputs
  name = var.ec2_name # string
}
