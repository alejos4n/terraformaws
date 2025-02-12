
provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidrs = ["10.0.2.0/24", "10.0.3.0/24"]
  availability_zone   = "us-east-1a"
  private_subnet_azs  = ["us-east-1b", "us-east-1c"]
}

module "security" {
  source = "../../modules/security"
  vpc_id = module.vpc.vpc_id
}

module "rds" {
  source = "../../modules/rds"

  private_subnet_ids = module.vpc.private_subnet_ids
  security_group_id = module.security.rds_security_group_id
  db_password      = "your-password-here" # TODO: Replace with a secure password
}

module "ec2" {
  source = "../../modules/ec2"

  ami_id           = "ami-0c55b159cbfafe1f0" # TODO: Replace with desired AMI ID
  subnet_id        = module.vpc.public_subnet_id
  security_group_id = module.security.ec2_security_group_id
  key_name         = "your-key-pair-name" # TODO: Replace with your key pair name
}
