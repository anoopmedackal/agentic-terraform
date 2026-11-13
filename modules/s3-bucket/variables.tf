variable "bucket_prefix" {
  description = "Prefix for the S3 bucket name. A random 16-char hex suffix is appended to keep it unique."
  type        = string
  default     = "portfolio-private"
}

variable "force_destroy" {
  description = "Whether to delete all objects (including any locked ones) when the bucket is destroyed."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Map of tags to apply to the S3 bucket."
  type        = map(string)
  default     = {}
}
