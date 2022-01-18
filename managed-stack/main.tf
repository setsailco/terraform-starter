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
