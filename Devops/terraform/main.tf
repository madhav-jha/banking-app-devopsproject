terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# provider config (using us-west-1)
provider "aws" {
  region = "us-west-1"
}

# basic variables
variable "ami_id" {
  description = "Ubuntu 22.04 LTS AMI id (us-west-1)"
  default     = "ami-04f34746e5e1ec0fe"
}

variable "key_name" {
  description = "existing AWS key pair name"
  default     = "devops-key"
}

variable "vpc_id" {
  description = "VPC id where I want to create servers"
  default     = "vpc-0687fbf273a4bf486"   
}

# simple security group for this lab
resource "aws_security_group" "devops_sg" {
  name        = "devops-sg"
  description = "security group for devops project"
  vpc_id      = var.vpc_id

  # SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }



  # sample NodePort service
  ingress {
    from_port   = 31002
    to_port     = 31002
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # K8s API server
  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # allow all outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# jenkins master
resource "aws_instance" "jenkins_master" {
  ami                    = var.ami_id
  instance_type          = "t3.medium"
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  tags = {
    Name = "jenkins-master"
    Role = "jenkins_master"
  }
}

# jenkins agent
resource "aws_instance" "jenkins_agent" {
  ami                    = var.ami_id
  instance_type          = "t3.medium"
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  tags = {
    Name = "jenkins-agent"
    Role = "jenkins_agent"
  }
}

# k8s master
resource "aws_instance" "k8s_master" {
  ami                    = var.ami_id
  instance_type          = "t3.medium"
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  tags = {
    Name = "k8s-master"
    Role = "k8s_master"
  }
}

# k8s worker nodes (3)
resource "aws_instance" "k8s_worker" {
  count                  = 3
  ami                    = var.ami_id
  instance_type          = "t3.small"
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  tags = {
    Name = "k8s-worker-${count.index + 1}"
    Role = "k8s_worker"
  }
}

# monitoring node
resource "aws_instance" "monitoring" {
  ami                    = var.ami_id
  instance_type          = "t3.small"
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  tags = {
    Name = "monitoring-node"
    Role = "monitoring"
  }
}

# elastic ip for few important servers
resource "aws_eip" "jenkins_master_eip" {
  vpc      = true
  instance = aws_instance.jenkins_master.id

  tags = {
    Name = "jenkins-master-eip"
  }
}

resource "aws_eip" "jenkins_agent_eip" {
  vpc      = true
  instance = aws_instance.jenkins_agent.id

  tags = {
    Name = "jenkins-agent-eip"
  }
}

resource "aws_eip" "k8s_master_eip" {
  vpc      = true
  instance = aws_instance.k8s_master.id

  tags = {
    Name = "k8s-master-eip"
  }
}

# outputs for quick view
output "jenkins_master_eip" {
  value       = aws_eip.jenkins_master_eip.public_ip
  description = "jenkins master public ip"
}

output "jenkins_agent_eip" {
  value       = aws_eip.jenkins_agent_eip.public_ip
  description = "jenkins agent public ip"
}

output "k8s_master_eip" {
  value       = aws_eip.k8s_master_eip.public_ip
  description = "k8s master public ip"
}

output "k8s_worker_ips" {
  value       = [for w in aws_instance.k8s_worker : w.public_ip]
  description = "k8s workers public ips"
}

output "monitoring_ip" {
  value       = aws_instance.monitoring.public_ip
  description = "monitoring node public ip"
}
