output "s3_bucket_name" {
  description = "s3 bucket name"
  value = module.s3_bucket.bucket_name
}

output "s3_website_url" {
  description = "website link"
  value = module.s3_bucket.bucket_website_endpoint
}

output "cloudfront_domain_name" {
  description = "The domain name of the CloudFront distribution"
  value       = module.aws_cloudfront_distribution.cloudfront_domain_name
}

output "cloudfront_distribution_arn" {
  description = "The ARN of the CloudFront distribution"
  value       = module.aws_cloudfront_distribution.cloudfront_distribution_arn
}

output "cloudfront_status" {
  description = "The current status of the CloudFront distribution"
  value       = module.aws_cloudfront_distribution.cloudfront_status
}