output "s3_bucket_name" {
  value = module.aws.s3_bucket_name
}

output "s3_website_url" {
  value = module.aws.s3_website_url
}


output "cloudfront_domain_name" {
  value = module.aws.cloudfront_domain_name
}

output "virttual_machine" {
  value = module.azure.virtual_machine_id
}

output "virttual_machine_ip" {
  value = module.azure.virtual_machine_ip
}