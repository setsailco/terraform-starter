# This resource here is to show you how plan policies work.

provider "aws" {
  region = "us-east-1"
}

resource "random_password" "secret" {
  length  = 32
  special = true
}

module "ec2" {
  source = "setsailco.app.spacelift.io/module/ec2-module"
  version = "0.0.1"
  name = "test_spacelift"
}
