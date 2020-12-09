module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  version = "2.48.0"

  name = "sakurada-christmas-2020"

  cidr = "11.0.0.0/16"

  azs             = ["ap-northeast-1a", "ap-northeast-1c"]
  private_subnets = ["11.0.1.0/24", "11.0.2.0/24"]
  public_subnets  = ["11.0.101.0/24", "11.0.102.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    terraform = "true"
    service   = "sakurada-christmas"
  }
}
