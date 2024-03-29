#https://registry.terraform.io/providers/hashicorp/random/latest/docs
resource "random_string" "bucket_name" {
  length  = 32
  special = false
  upper   = false
  lower   = true
}

#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "example" {
  # Bucket naming roles
  # https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html?icmpid=docs_amazons3_console
  bucket = random_string.bucket_name.result

  #tags = {
   #  UserUuid = var.user_uuid
  #}
}
