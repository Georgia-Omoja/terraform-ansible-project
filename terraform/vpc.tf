# VPC 
resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = "vpc-001"
    }
}


# PUBLIC SUBNET 1A
resource "aws_subnet" "public_subnet_1a" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.public_subnet_1A_cidr
    availability_zone = us-east-1a

    tags {
        Name = "PUBLIC SUBNET 1A"
    }

}


# INTERNET GATEWAY
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id

    tags = {
        Name = "igw-001"
    }
}


# ROUTE TABLE
resource "aws_route_table" "rtb" {
    vpc_id = aws_vpc.vpc.id

    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        "Name" = "rtb-001"
    }
}


# SUBNET ASSOCIATION
resource "aws_route_table_association" "rtb" {
    subnet_id = aws_subnet.public_subnet_1a.id
    route_table_id = aws_route_table.rtb.id
        
}


# SECURITY GROUP
resource "aws_security_group" "public-subnet-sg" {
    name        = "Public Subnet SG"
    description = "Allow SSH and HTTP traffic"
    vpc_id      = aws_vpc.vpc.id

    ingress {
        description = "Inbound HTTP traffic"
        from_port   = "80"
        to_port     = "80"
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
        description = "Inbound HTTPS traffic"
        from_port   = "443"
        to_port     = "443"
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Inbound SSH traffic"
        from_port   = "22"
        to_port     = "22"
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port   = "0"
        protocol    = "-1"
        to_port     = "0"
    }
    tags = {
        Name = "PUBLIC-SUBNET-sg"
    }
}

resource "aws_security_group" "alb-sg" {
    name        = "ALB SG"
    description = "Allow HTTP traffic"
    vpc_id      = aws_vpc.vpc.id

    ingress {
        description = "Inbound HTTP traffic"
        from_port   = "80"
        to_port     = "80"
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
        description = "Inbound HTTPS traffic"
        from_port   = "443"
        to_port     = "443"
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port   = "0"
        protocol    = "-1"
        to_port     = "0"
    }
    tags = {
        "Name" = "alb-001-sg"
    }
}


