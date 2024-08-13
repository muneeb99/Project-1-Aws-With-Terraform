// Provider Block //

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAQKPILQCTNJEHHW7V"
  secret_key = "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"
}

// Web-Server Instance

resource "aws_instance" "WindowServer" {
  ami = "ami-07d9456e59793a7d5"
  instance_type = var.ec2-instance_type
  subnet_id = aws_subnet.My-Public-subnet.id
  tags = {
    Name = var.instance_name
  }
}
// DB-Server Instance Name
resource "aws_instance" "DBServer" {
  ami = "ami-07d9456e59793a7d5"
  instance_type = var.ec2-instance_type
  subnet_id = aws_subnet.My-Private-subnet.id
  tags = {
    Name = "DB-Server"
  }
}
// VPC Block

resource "aws_vpc" "Lab-Vpc" {
  cidr_block = var.Vpc_cidr
  tags = {
    
  }
}
resource "aws_subnet" "My-Public-subnet" {
  vpc_id = aws_vpc.Lab-Vpc.id
  cidr_block = var.public-subnet-cidr
  tags = {
    name = var.Public-Subnet
  }
  
}
resource "aws_subnet" "My-Private-subnet" {
  vpc_id = aws_vpc.Lab-Vpc.id
  cidr_block = var.private-subnet-cidr
  tags = {
    name=var.Private-Subnet
  }
  
}
