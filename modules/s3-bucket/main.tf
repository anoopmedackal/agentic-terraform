# =====================================================================
# Module: s3-bucket
# Deploys a purely private S3 bucket (standard S3, Free Tier eligible)
# with a unique, non-predictable name.
#
# NOTE: This module intentionally contains NO provider block and NO
# hardcoded credentials/profile. It inherits the AWS provider from the
# root module - standard Terraform best practice for reusable modules.
# =====================================================================

# 1. Unique, non-predictable suffix for the bucket name
resource "random_id" "bucket_suffix" {
  byte_length = 8
}

# 2. The S3 bucket (standard storage class - guardrail #2)
resource "aws_s3_bucket" "this" {
  # random_id.hex yields 16 lowercase hex chars -> name stays <= 63 chars
  bucket        = "${var.bucket_prefix}-${random_id.bucket_suffix.hex}"
  force_destroy = var.force_destroy

  tags = var.tags
}

# 3. Block ALL public access - mandatory guardrail #4 (all four = true)
resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
