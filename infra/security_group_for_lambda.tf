module "lambda_security_group" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"
  version = "3.16.0"

  name        = "sakurada2020-lambda_security_group"
  description = "Security group for Lambda of sakurada2020."
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["https-443-tcp"]

  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules       = ["all-all"]
}
