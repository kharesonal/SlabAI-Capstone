resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "this" {
  depends_on = [aws_s3_bucket_public_access_block.this]
  bucket     = aws_s3_bucket.this.id
  policy     = jsonencode(
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Effect": "Allow",
          "Principal": "*",
          "Action": "s3:GetObject",
          "Resource": "arn:aws:s3:::${aws_s3_bucket.this.bucket}/*"
        }
      ]
    }
  )
}

resource "aws_s3_bucket_website_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }                              
}

resource "aws_s3_object" "files" {
  for_each = fileset("../frontend/template", "**")
  bucket    = aws_s3_bucket.this.bucket
  key       = each.value
  source    = "../frontend/template/${each.value}"
  etag      = filemd5("../frontend/template/${each.value}")
  
  # Automatically detect and set the Content-Type
  content_type = lookup(
    {
      "html"  = "text/html"
      "css"   = "text/css"
      "js"    = "application/javascript"
      "jpg"   = "image/jpeg"
      "jpeg"  = "image/jpeg"
      "png"   = "image/png"
      "svg"   = "image/svg+xml"
      "ico"   = "image/x-icon"
      "ttf"   = "font/ttf"
      "woff"  = "font/woff"
      "woff2" = "font/woff2"
      "eot"   = "application/vnd.ms-fontobject"
      "scss"  = "text/x-scss"
    },
    split(".", each.value)[length(split(".", each.value)) - 1], # Extract the file extension
    "binary/octet-stream" # Default MIME type
  )
}
output "bucket_name" {
  description = "This is the bucket name"
  value       = aws_s3_bucket.this.bucket
}

output "bucket_website_endpoint" {
  description = "This is website endpoint of s3 bucket"
  value       = aws_s3_bucket_website_configuration.this.website_domain
}

output "bucket_regional_domain_name" {
  description = "The regional domain name of the S3 bucket"
  value       = aws_s3_bucket.this.bucket_regional_domain_name
}
