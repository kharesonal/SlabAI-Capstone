variable "bucket_name" {
  description = "Name of the bucket"
  type = string
}

variable "acl" {
  description = "Access control lsit for s3"
  type = string
  default = "public-read"
}