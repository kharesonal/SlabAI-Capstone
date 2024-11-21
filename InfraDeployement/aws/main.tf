module "s3_bucket" {
  source = "./modules/s3"
  bucket_name = "sukhil-multicloud-infra5"
  acl = "public-read"
}

module "aws_cloudfront_distribution" {
  source = "./modules/cloudFront"
  bucket_regional_domain_name =  module.s3_bucket.bucket_regional_domain_name
}

