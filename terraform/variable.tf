# AWS region
variable "region" {
    description = "my aws VPC region"
    default = "us-east-1"
}


# CIDR BLOCK FOR VPC
variable "vpc_cidr" {
    description = "CIDR for the VPC"
    type = string
    default = "10.0.0.0/26"
}


#CIDR BLOCK FOR PUBLIC SUBNETS
variable "public_subnet_1A_cidr" {
    description = "CIDR for the public subnet 1A"
    default = "10.0.0.0/28"
}


# Instance type
variable "ec2_instance_type" {
    description = "instance type"
    default = "t2.micro"
}


# Instance AMI
variable "ec2_ami" {
    description = "Ubuntu-20.04"
    default = "ami-0778521d914d23bc1"
}


# DOMAIN NAME
variable "domain_name" {
    default = "georgiaaltschoolcloudengineering.co.uk"
}

# TTL RECORD
variable "record_ttl" {
    default = "300"
}