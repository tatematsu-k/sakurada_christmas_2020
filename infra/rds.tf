data "aws_secretsmanager_secret" "rds_password" {
  name = "sakurada2020-rds-password"
}

data "aws_secretsmanager_secret_version" "rds_password" {
  secret_id = data.aws_secretsmanager_secret.rds_password.id
}

module "rds_security_group" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"
  version = "3.16.0"

  name        = "sakurada2020-rds_security_group"
  description = "Security group for RDS of sakurada2020."
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = module.vpc.private_subnets_cidr_blocks
  ingress_rules       = ["mysql-tcp"]

  egress_cidr_blocks = module.vpc.private_subnets_cidr_blocks
  egress_rules       = ["all-all"]
}

resource "aws_db_subnet_group" "sakurada2020" {
  name       = "sakurada2020"
  subnet_ids = module.vpc.private_subnets
}

module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "2.20.0"

  engine               = "mysql"
  engine_version       = "5.7.19"
  major_engine_version = "5.7"
  family               = "mysql5.7"
  instance_class       = "db.t2.micro"
  port                 = "3306"
  allocated_storage    = 5
  apply_immediately    = true

  subnet_ids             = module.vpc.private_subnets
  create_db_subnet_group = false
  db_subnet_group_name   = aws_db_subnet_group.sakurada2020.name
  vpc_security_group_ids = [module.rds_security_group.this_security_group_id]

  identifier = "sakurada2020"
  name       = "sakurada2020"
  username   = "root"
  password   = data.aws_secretsmanager_secret_version.rds_password.secret_string

  maintenance_window = "Mon:16:00-Mon:17:00"
  backup_window      = "17:00-19:00"

  parameters = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_connection"
      value = "utf8mb4"
    },
    {
      name  = "character_set_database"
      value = "utf8mb4"
    },
    {
      name  = "character_set_results"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    },
  ]
}
