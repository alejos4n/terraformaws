
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "availability_zone" {
  description = "Availability zone for public subnet"
  type        = string
}

variable "private_subnet_azs" {
  description = "Availability zones for private subnets"
  type        = list(string)
}
