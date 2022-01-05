module "stack-module" {
  source  = "spacelift.io/setsailco/stack-module/default"
  version = "0.1.8"

  # Required inputs 
  additional_stack_labels = []
  environment = "dev"
  push_tag = "test-tf"
  project_root = "managed-stack"
  repository_name = "terraform-starter"
  stack_name = "test-tf-stack"
  default_branch = "main"

}