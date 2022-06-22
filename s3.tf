# Create an S3 bucket for storing alarm templates.

resource "random_id" "bucket_name" {
  byte_length = 8
  prefix      = "${var.name}-"
}

resource "aws_s3_bucket" "alarm_templates" {
  bucket = random_id.bucket_name.hex
  acl    = "private"

  tags = var.bucket-tags
}

resource "aws_s3_bucket_public_access_block" "alarm_templates" {
  bucket = aws_s3_bucket.alarm_templates.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
