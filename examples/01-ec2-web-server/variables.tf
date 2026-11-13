variable "aws_region" {
  description = "AWS region to deploy into."
  type        = string
  default     = "ap-south-2"
}

variable "aws_profile" {
  description = "AWS CLI profile name. Leave null (default) to use the AWS_PROFILE environment variable or the standard shared-credentials chain."
  type        = string
  default     = null
}

variable "instance_type" {
  description = "EC2 instance type (Free Tier eligible t3.micro by default - guardrail #2)."
  type        = string
  default     = "t3.micro"
}

variable "ami_ssm_path" {
  description = "AWS SSM public parameter path resolving the latest Ubuntu AMI ID."
  type        = string
  default     = "/aws/service/canonical/ubuntu/server/24.04/stable/current/amd64/hvm/ebs-gp3/ami-id"
}

variable "tags" {
  description = "Map of tags to apply to the EC2 instance."
  type        = map(string)
  default = {
    Name        = "Terraform-EC2-Web-Server"
    Environment = "workshop"
  }
}
