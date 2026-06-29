provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "demo" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "spacelift-demo-ec2"
  }
}

resource "aws_ec2_instance_state" "demo_server_state" {
  instance_id = aws_instance.demo.id
  state       = "running"
}