# =====================================================================
# Example 02: Private S3 Bucket
# Deploys the reusable modules/s3-bucket module from the portfolio root.
#
# Guardrail #3: AWS credentials/profile are NEVER hardcoded here.
# The provider is configured from variables (or omitted so the standard
# AWS credential chain / AWS_PROFILE env var is used).
# =====================================================================

terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.73.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.9.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

# Deploy the reusable private S3 bucket module
module "s3_bucket" {
  source        = "../../modules/s3-bucket"
  bucket_prefix = var.bucket_prefix

  tags = {
    Name        = "Terraform-${var.environment}"
    Environment = var.environment
  }
}
