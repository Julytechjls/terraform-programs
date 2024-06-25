variable "subnet_id" {
  description = "The ID of the subnet to launch the instance in"
  type        = string
}

variable "ami" {
  description = "The AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type to use"
  type        = string
}

variable "key_name" {
  description = "The key name to use for the instance"
  type        = string
}

variable "security_group_id" {
  description = "The ID of the security group to associate with the instance"
  type        = string
}
