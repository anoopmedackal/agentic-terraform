output "bucket_name" {
  description = "Name of the private S3 bucket created by the module."
  value       = module.s3_bucket.bucket_id
}

output "bucket_arn" {
  description = "ARN of the private S3 bucket created by the module."
  value       = module.s3_bucket.bucket_arn
}

output "bucket_domain" {
  description = "Regional domain name of the private S3 bucket."
  value       = module.s3_bucket.bucket_regional_domain_name
}
