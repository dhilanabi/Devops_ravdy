provider "aws" {
region  = "ap-south-1"
}

resource "aws_instance" "demo_server" {
  ami           = "ami-0861f4e788f5069dd"
  instance_type = "t2.micro"
    key_name   = "demo_server"
  tags = {
    Name = "demo_server"
  }
}