resource "spacelift_module" "ec2-module" {
  administrative    = true
  name              = "ec2-module"
  branch            = "main"
  description       = "Ec2 terraform module"
  project_root      = "ec2-module"
  repository        = "terraform-starter"
}
