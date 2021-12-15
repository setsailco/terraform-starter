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
  count         = var.use_tf_vars ? 1 : 0
  stack_id      = spacelift_stack.this.id
  relative_path = format("%s.tfvars", var.environment)
  content       = filebase64(format("%s/%s", path.module, var.tf_vars_path))
}

resource "spacelift_environment_variable" "stack_tfvars" {
  count      = var.use_tf_vars ? 1 : 0
  stack_id   = spacelift_stack.this.id
  name       = "TF_CLI_ARGS"
  value      = format("-var-file=%s.tfvars", var.environment)
  write_only = false
}