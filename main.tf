terraform {
  required_version = "~> 0.12.9"
}

provider "aws" {
  region  = "${var.global_region}"
#  version = "~> 2.0"
}

module "vpc" {
  source = "git::ssh://git@github.com/terraform-aws-modules/terraform-aws-vpc?ref=v2.17.0"

  name = "${var.vpc_name}"
  cidr = "${var.global_cidr}"
  azs             = "${var.global_az}"0
  private_subnets = "${var.global_private_subnets}"
  public_subnets  = "${var.global_public_subnets}"

  enable_nat_gateway = "${var.vpc_nat}"

  tags = {
    Orchestration = "${var.tag_orchestration}"
    Environment   = "${var.tag_environment}"
    Owner         = "${var.tag_owner}"
  }
}
