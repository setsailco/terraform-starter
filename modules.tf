resource "spacelift_module" "ec2-module" {
  administrative    = true
  name              = "ec2-module"
  branch            = "main"
  description       = "Ec2 terraform module"
  project_root      = "terraform_modules/ec2-module"
  repository        = "terraform-starter"
}

resource "spacelift_module" "stack-module" {
  administrative    = true
  name              = "stack-module"
  branch            = "nathannolan9169/sc-30434/spacelift-stack-module-policies-admin-stacks"
  description       = "Stack Module. Used to create and manage all Applications Stacks"
  project_root      = "modules/stack"
  repository        = "metaverse"
}
