
provider "aws" {
region  = "ap-south-1"
}

resource "aws_instance" "demo-serverpro" {
  ami           = "ami-0861f4e788f5069dd"
  instance_type = "t2.micro"
  key_name   = "demo_server"
  security_groups = ["demo-server-sg"]
  tags = {
    Name = "demo-server"
  }
}

resource "aws_security_group" "demo-server-sg" {
  name        = "demo-server-sg"
  description = "SSH-access"
 
  ingress {
    description = "SSH-access"
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
    Name = "demo-server-sg"
  }
}