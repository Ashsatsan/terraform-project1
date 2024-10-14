module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.VPC_NAME
  cidr = var.vpcCIDR

  azs             = [var.ZONE1, var.ZONE2, var.ZONE3]
  private_subnets = [var.CIDR_PRIV1, var.CIDR_PRIV2, var.CIDR_PRIV3]
  public_subnets  = [var.CIDR_PUB1, var.CIDR_PUB2, var.CIDR_PUB3]

  enable_nat_gateway = true
  enable_vpn_gateway = true



  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}