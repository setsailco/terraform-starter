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
  version = "0.0.2"

  # Required inputs
  name = var.ec2_name# string
}


resource "spacelift_mounted_file" "managed" {
  stack_id      = data.spacelift_current_stack.this.id
  relative_path = "test.tfvars"
  content       = filebase64(format("env/test.tfvars"))
}

resource "spacelift_environment_variable" "stack_tfvars" {
  stack_id   = data.spacelift_current_stack.this.id
  name       = "TF_CLI_ARGS"
  value      = format("-var-file=test.tfvars")
  write_only = false
}