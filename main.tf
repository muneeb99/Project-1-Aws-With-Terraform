// Provider Block //

provider "aws" {
  region     = "us-east-1"
}

########################################################################
    #  WEB SERVER INSTANCE
########################################################################

resource "aws_instance" "WindowServer" {

  ami = "ami-07d9456e59793a7d5"
  instance_type = var.ec2-instance_type
  subnet_id = aws_subnet.My-Public-subnet.id
  vpc_security_group_ids = [ aws_security_group.my-sg.id ]
  associate_public_ip_address = true
  tags = {
    Name = var.WEB-SERVER
  }
}
########################################################################
    #  DATABASE SERVER
########################################################################

resource "aws_instance" "DBServer" {
  ami = "ami-07d9456e59793a7d5"
  instance_type = var.ec2-instance_type
  subnet_id = aws_subnet.My-Private-subnet.id
  tags = {
    Name = var.DB-SERVER
  }
}
#######################################################################
    #  VPC BLOCK
#######################################################################


resource "aws_vpc" "Lab-Vpc" {

  cidr_block = var.Vpc_cidr
  tags ={
    Name = var.Vpc-name
  }
}

#######################################################################
    #  PUBLIC SUBNET
#######################################################################

resource "aws_subnet" "My-Public-subnet" {

  vpc_id = aws_vpc.Lab-Vpc.id
  cidr_block = var.public-subnet-cidr
  tags = {
    name = var.Public-Subnet
  }

  
}
#######################################################################
    #  PRIVATE SUBNET
#######################################################################

resource "aws_subnet" "My-Private-subnet" {
  vpc_id = aws_vpc.Lab-Vpc.id
  cidr_block = var.private-subnet-cidr
  tags = {
    name=var.Private-Subnet
  }
  
}

#######################################################################
    #  INTERNET GATEWAY
#######################################################################

 resource "aws_internet_gateway" "myigw" {
   vpc_id = aws_vpc.Lab-Vpc.id
   tags = {
     Name = var.Internet-gateway
   }
 }

 #######################################################################
    # ROUITNG TABLE 
########################################################################
 
 resource "aws_route_table" "publicRT" {
  vpc_id = aws_vpc.Lab-Vpc.id
   tags = {
     Name = var.RT-Table
   }
  } 

  #######################################################################
    #  ROUTING TABLE OF PUBLIC SUBNET
  #######################################################################

  resource "aws_route" "My-public-route" {

  gateway_id = aws_internet_gateway.myigw.id
  route_table_id = aws_route_table.publicRT.id
  destination_cidr_block = "0.0.0.0/0"

  }
 resource "aws_route_table_association" "publicRTass" {
   subnet_id = aws_subnet.My-Public-subnet.id
   route_table_id = aws_route_table.publicRT.id
   
 }

 #######################################################################
    # SECURITY GROUP
 #######################################################################

 resource "aws_security_group" "my-sg" {

  vpc_id = aws_vpc.Lab-Vpc.id
  description = "My security group"
  tags = {
    name = var.Security-group
  }
 }

 #######################################################################
    #  HTTPS ALLOW
 #######################################################################

 resource "aws_vpc_security_group_ingress_rule" "Weballow" {

   security_group_id =aws_security_group.my-sg.id
   cidr_ipv4 = aws_vpc.Lab-Vpc.cidr_block

   from_port = "443"
   to_port = "443"
   ip_protocol = "tcp"
 }
 #######################################################################
    #  SSH ALLOW
#####################################################################

 resource "aws_vpc_security_group_ingress_rule" "sshalow" {

   security_group_id = aws_security_group.my-sg.id
   cidr_ipv4 = aws_vpc.Lab-Vpc.cidr_block
   ip_protocol = "tcp"
   from_port = "22"
   to_port = "22"
 }

 resource "aws_vpc_security_group_egress_rule" "weballowerr" {
   security_group_id = aws_security_group.my-sg.id
   ip_protocol = "-1"
   cidr_ipv4 = "0.0.0.0/0"

 }
 

