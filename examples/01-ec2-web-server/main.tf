# =====================================================================
# Example 01: EC2 Web Server (Free Tier)
#
# Refactored portfolio example: a minimal Ubuntu 24.04 EC2 instance on a
# Free Tier eligible t3.micro.
#
# Guardrail #3: NO AWS credentials/profile are hardcoded here. The AWS
# provider reads `aws_region` / `aws_profile` from variables; leave
# `aws_profile` null to use AWS_PROFILE or the shared-credential chain.
# Guardrail #2: instance_type defaults to t3.micro (Free Tier eligible).
# =====================================================================

terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.73.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

# Resolve the latest Ubuntu 24.04 LTS AMI via the public AWS/Canonical
# SSM parameter path (no hardcoded, region-locked AMI IDs).
data "aws_ssm_parameter" "ubuntu_ami" {
  name = var.ami_ssm_path
}

# Free Tier eligible EC2 instance (guardrail #2)
resource "aws_instance" "web_server" {
  ami           = data.aws_ssm_parameter.ubuntu_ami.value
  instance_type = var.instance_type

  tags = var.tags
}
