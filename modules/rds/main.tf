
# DB Subnet Group
resource "aws_db_subnet_group" "main" {
  name        = "main-db-subnet-group"
  description = "DB subnet group for RDS"
  subnet_ids  = var.private_subnet_ids
}

# RDS Instance
resource "aws_db_instance" "main" {
  identifier           = "main-db"
  allocated_storage    = 20
  storage_type        = "gp2"
  engine              = "mysql"
  engine_version      = "8.0"
  instance_class      = "db.t3.micro"
  db_name             = "mydb"
  username            = "admin"
  password            = var.db_password
  skip_final_snapshot = true

  vpc_security_group_ids = [var.security_group_id]
  db_subnet_group_name   = aws_db_subnet_group.main.name
}
