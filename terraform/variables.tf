variable "aws_region" {
  description = "AWS region to deploy resources into"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Name prefix used for tagging all resources"
  type        = string
  default     = "devops-portfolio"
}

variable "instance_type" {
  description = "EC2 instance type for the app server"
  type        = string
  default     = "t2.micro"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH into the instance (restrict this in production)"
  type        = string
  default     = "0.0.0.0/0"
}

variable "key_name" {
  description = "Name of an existing EC2 key pair for SSH access"
  type        = string
}
