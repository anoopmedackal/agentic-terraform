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

variable "bucket_prefix" {
  description = "Prefix for the unique private S3 bucket name (random hex suffix appended by the module)."
  type        = string
  default     = "workshop-private"
}

variable "environment" {
  description = "Environment label used for tagging (e.g. workshop, dev, prod)."
  type        = string
  default     = "workshop"
}
