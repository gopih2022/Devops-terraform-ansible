terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

provider "aws" {
region = "us-east-1"
}
resource "aws_instance" "myserver" {
  ami = "ami-0e86e20dae9224db8"
  vpc_security_group_ids  = "sg-0a628e9cba5f160e0"
  instance_type = "t2.micro"
  key_name = "gopi-role"

  tags = {
    Name = "gopi-DevOps-batch-server"
    env = "Production"
    owner = "Gopi"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}

