
variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID for RDS"
  type        = string
}

variable "db_password" {
  description = "Password for RDS instance"
  type        = string
  sensitive   = true
}
