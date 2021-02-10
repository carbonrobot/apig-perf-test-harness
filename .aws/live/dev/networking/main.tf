provider "aws" {
  version = "~> 3.5"
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "nextjs-fargate-demo-842852627350-terraform-state"
    key            = "networking/terraform.tfststate"
    region         = "us-east-1"
    dynamodb_table = "nextjs-fargate-demo-terraform-locks"
  }
}

locals {
  prefix = "nextjs-fargate-demo"
  stage  = "dev"
}

module "networking" {
  source = "../../../modules/networking"

  prefix = local.prefix
  tags = {
    Source  = "terraform"
    Service = "${local.prefix}-networking"
    Stage   = local.stage
  }
}
