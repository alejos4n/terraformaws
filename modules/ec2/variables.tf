
variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where EC2 will be launched"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID for EC2"
  type        = string
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}
