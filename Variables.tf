
// Instance Name Variable
variable "WEB-SERVER" {
  description = "Name of My instance in EC2"
  type = string
  default = "Web-Server"
}
variable "DB-SERVER" {
  description = "Name of my Database server"
  type = string
  default = "DB-SERVER"
}

// Instance type Variable
variable "ec2-instance_type" {
  description = "Type of my Instance"
  type = string
  default = "t2.micro"
}


// VPC Name 

variable "Vpc-name" {

    description = "Name of my main vpc"
    type = string
    default = "My-Vpc"
}

// VPC CIDR Variable
variable "Vpc_cidr" {

    description = "Cidr of my Vpc"
    type = string
    default = "10.0.0.0/16"
}

// Public Subnet Name
variable "Public-Subnet" {

  description = "Name of Public Subnet"
  type = string
  default = "My-Public-Subnet"
}
// Public Subnet CIDR

variable "public-subnet-cidr" {
  description = "CIDR of public subnet"
  type = string
  default = "10.0.1.0/24"
}
// Private Subnet Name

variable "Private-Subnet" {
  description = "Name of Private Subnet"
  type = string
  default = "My-Private-Subnet"
}
// Private Subnet CIDR

variable "private-subnet-cidr" {
  description = "CIDR of private subnet"
  type = string
  default = "10.0.2.0/24"
  
}

// Internet gateway block

variable "Internet-gateway" {
  description = "Internet gateway of my vpc"
  type = string
  default = "my-igw"
}

// Routing table for public subnet

variable "publicRT" {
  description = "Route table of public subnet"
  type = string
  default = "Public-subnet-RT"

}

// Public subnet association

variable "PublicRTassociation" {
  description = "public subnet association"
  type = string
  default = "Association"
}

// Routing table

variable "RT-Table" {
  description = "Routing table of VPC"
  type = string
  default = "route-table"
}
// Security group

variable "Security-group" {
  description = "Security group of my vpc"
  type = string
  default = "vpc-sg"
  
}


variable "table_name" {
  description = "Name of the table in dynamoDB"
  type = string
  default = "Employee-data"
  
}
variable "dynamoDB-Bucket" {
description = "Exported dynamodb data to s3"
type = string
default = "dynamod-s3"
}

