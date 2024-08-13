// Instance Name Variable
variable "instance_name" {
  description = "Name of My instance in EC2"
  type = string
  default = "Web-Server"
}
// Instance type Variable
variable "ec2-instance_type" {
  description = "Type of my Instance"
  type = string
  default = "t2.micro"
}

// VPC CIDR Variable
variable "Vpc_cidr" {
    description = "Cidr of my Vpc"
    type = string
  default = "10.0.0.0/16"
}
// VPC Name 
variable "Vpc-name" {
    description = "Name of my main vpc"
  type = string
  default = "My-vpc"
}
// Public Subnet
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
// Private Subnet

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