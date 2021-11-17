provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "test" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "test" {
  ami           = data.aws_ami.test.id
  instance_type = "t3.micro"

  tags = {
    Name = var.name
  }
}
