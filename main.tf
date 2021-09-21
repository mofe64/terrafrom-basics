terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
provider "aws" {
  region  = var.aws_region
  profile = "default"
}

data "aws_ami" "ubuntu" {
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



resource "aws_instance" "web" {
  ami           = "ami-00399ec92321828f5"
  instance_type = "t3.micro"

  tags = {
    Name = var.instance_name
  }

}

resource "local_file" "pet" {
  filename        = "/root/pets.txt"
  content         = "Test content for terraform"
  file_permission = "0700"
}


