terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}


provider "aws" {
  region = "eu-west-2"
}



# create VPC

resource "aws_vpc" "min_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "min_vpc"
  }
}


# create internet gateway 

resource "aws_internet_gateway" "min_internet_gateway" {
  vpc_id = aws_vpc.min_vpc.id
  tags = {
    Name = "min_internet_gateway"
  }
}

# Create public Route Table

resource "aws_route_table" "min-route-table-public" {
  vpc_id = aws_vpc.min_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.min_internet_gateway.id
  }

  tags = {
    Name = "min-route-table-public"
  }
}



# Associate public subnet 1 with public route table


resource "aws_route_table_association" "min-public-subnet1-association" {
  subnet_id      = aws_subnet.min-public-subnet1.id
  route_table_id = aws_route_table.min-route-table-public.id
}

# Associate public subnet 2 with public route table

resource "aws_route_table_association" "min-public-subnet2-association" {
  subnet_id      = aws_subnet.min-public-subnet2.id
  route_table_id = aws_route_table.min-route-table-public.id
}



# Create Public Subnet-1

resource "aws_subnet" "min-public-subnet1" {
  vpc_id                  = aws_vpc.min_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-2a"
  tags = {
    Name = "min-public-subnet1"
  }
}

# Create Public Subnet-2

resource "aws_subnet" "min-public-subnet2" {
  vpc_id                  = aws_vpc.min_vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-2b"
  tags = {
    Name = "min-public-subnet2"
  }
}



# creating network_acl

resource "aws_network_acl" "min-network_acl" {
  vpc_id     = aws_vpc.min_vpc.id
  subnet_ids = [aws_subnet.min-public-subnet1.id, aws_subnet.min-public-subnet2.id]

  ingress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
}