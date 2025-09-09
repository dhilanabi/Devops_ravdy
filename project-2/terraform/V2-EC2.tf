
provider "aws" {
region  = "ap-south-1"
}

resource "aws_instance" "demo_server" {
  ami           = "ami-0861f4e788f5069dd"
  instance_type = "t2.micro"
  key_name   = "demo_server"
  security_groups = ["demo_server-sg"]
  tags = {
    Name = "demo_server"
  }
}

resource "aws_security_group" "demo_server-sg" {
  name        = "demo_server-sg"
  description = "SSH_access"
 
  ingress {
    description = "SSH_access"
    from_port   = 22
    to_port     = 22  
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "demo_server-sg"
  }
}