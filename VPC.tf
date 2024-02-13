# Create VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  assign_generated_ipv6_cidr_block = true

  tags = {
    Name = "VPC"
  }
}
# create internet gateway

resource "aws_internet_gateway" "internet-gateway" {
    vpc_id = aws_vpc.vpc.id

  tags= {
    Name   = "IGW"
   
  }
}

resource "aws_subnet" "pb-subnet" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "172.0.1.0/24"
    availability_zone = var.aws_region
    map_public_ip_on_launch = true
tags = {
    Name = "Public-Subnet"
  
}
  
}

resource "aws_route_table" "pb-route-table" {
    vpc_id = aws_vpc.vpc.id 
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id =  aws_internet_gateway.internet-gateway.id  
         }
tags = {
  Name = "Public-RT"
}
  
}

resource "aws_route_table_association" "pb-subnet-route-table-association" {
    subnet_id = aws_subnet.pb-subnet.id
    route_table_id = aws_route_table.pb-route-table.id
  
}

resource "aws_subnet" "pv-subnet" {
    vpc_id = aws_vpc.vpc.id
     cidr_block = "172.0.2.0/24"
     availability_zone = "ca-central-1a"
     map_public_ip_on_launch = false

     tags = {
       Name = "Private-subnet"
     }
  
}

resource "aws_security_group" "aws-sg" {
  name        = "aws-sg"

  vpc_id      = aws_vpc.vpc.id
  ingress {
    from_port        = 22   
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   
  }
  ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
    

}
}


  
