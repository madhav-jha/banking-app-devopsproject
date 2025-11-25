variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-1"
}

variable "project_name" {
  description = "Project name tag"
  type        = string
  default     = "devops-banking-app"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.small"
}

variable "key_name" {
  description = "Existing AWS key pair name"
  type        = string
  default     = "madhav-devops-key"
}

variable "public_cidr" {
  description = "Allowed CIDR for SSH/HTTP"
  type        = string
  default     = "0.0.0.0/0"
}
