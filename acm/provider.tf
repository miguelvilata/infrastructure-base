############################
## REMOTE STATE CONFIGURE ##
############################
terraform {
  required_version = ">= 1.0.2"
  backend "s3" {
    bucket = "terraform-devops-dev"
    key    = "dev/acm_terraform.tfstate"
    region = "eu-west-1"
  }
}
################################
## CONFIGURATION AWS PROVIDER ##
################################
provider "aws" {
  #version = "~> 3.4"
  region  = var.region
}

provider "aws" {
  alias  = "cloudfront"
  #version = "~> 3.4"
  region  = var.region_cloudfront
}

# Using these data sources allows the configuration to be
# generic for any region.
data "aws_region" "current" {
}

data "aws_availability_zones" "available" {
}
