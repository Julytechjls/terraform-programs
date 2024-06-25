variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "subnet_cidr_block" {
  description = "The CIDR block for the subnet"
  type        = string
}

variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
}
