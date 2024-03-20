terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>5.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
      
}

resource "aws_instance" "Beanstalk" {
  
  instance_type = "t2.micro"
  ami = "ami-0d7a109bf30624c99"
  vpc_security_group_ids = [aws_security_group.beanstalk_sg.id]


  tags = {

    Name = "Beanstalk_Server"
  }
    
}

resource "aws_security_group" "beanstalk_sg" {
  name        = "beanstalk_sg"
  description = "Allow SSH and HTTP traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

