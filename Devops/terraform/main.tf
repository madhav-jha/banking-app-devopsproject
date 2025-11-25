terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# VPC
resource "aws_vpc" "main_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

# Public subnet 1
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.aws_region}a"

  tags = {
    Name = "${var.project_name}-public-1"
  }
}

# Public subnet 2
resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.aws_region}c"

  tags = {
    Name = "${var.project_name}-public-2"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

# Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.project_name}-public-rt"
  }
}

# Route table association
resource "aws_route_table_association" "public_1_assoc" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_2_assoc" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}

# Security group
resource "aws_security_group" "main_sg" {
  name        = "${var.project_name}-sg"
  description = "Allow SSH, HTTP, HTTPS, and custom ports"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.public_cidr]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.public_cidr]
  }

  ingress {
    description = "Jenkins"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.public_cidr]
  }

  ingress {
    description = "Custom web 3000-3100"
    from_port   = 3000
    to_port     = 3100
    protocol    = "tcp"
    cidr_blocks = [var.public_cidr]
  }

  ingress {
    description = "Prometheus/Grafana common ports"
    from_port   = 9000
    to_port     = 9200
    protocol    = "tcp"
    cidr_blocks = [var.public_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-sg"
  }
}

# ----- EC2 INSTANCES (4 TOTAL) -----

# AMI: ami-04f34746e5e1ec0fe (Ubuntu 22.04 in us-west-1)
locals {
  ubuntu_ami = "ami-04f34746e5e1ec0fe"
}

# 1. Jenkins Master
resource "aws_instance" "jenkins_master" {
  ami                    = local.ubuntu_ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet_1.id
  vpc_security_group_ids = [aws_security_group.main_sg.id]
  key_name               = var.key_name

  tags = {
    Name = "${var.project_name}-jenkins-master"
    Role = "jenkins-master"
  }
}

# 2. Jenkins Agent
resource "aws_instance" "jenkins_agent" {
  ami                    = local.ubuntu_ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet_1.id
  vpc_security_group_ids = [aws_security_group.main_sg.id]
  key_name               = var.key_name

  tags = {
    Name = "${var.project_name}-jenkins-agent"
    Role = "jenkins-agent"
  }
}

# 3. App Server (Docker)
resource "aws_instance" "app_server" {
  ami                    = local.ubuntu_ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet_2.id
  vpc_security_group_ids = [aws_security_group.main_sg.id]
  key_name               = var.key_name

  tags = {
    Name = "${var.project_name}-app-server"
    Role = "app-server"
  }
}

# 4. Monitoring Server
resource "aws_instance" "monitoring_server" {
  ami                    = local.ubuntu_ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet_2.id
  vpc_security_group_ids = [aws_security_group.main_sg.id]
  key_name               = var.key_name

  tags = {
    Name = "${var.project_name}-monitoring"
    Role = "monitoring"
  }
}
