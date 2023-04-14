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

resource "aws_s3_bucket_policy" "alarm_templates_policy" {
  bucket = aws_s3_bucket.alarm_templates.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid = "RequireSSL",
        Effect = "Deny",
        Principal = "*",
        Action = "s3:*",
        Resource = [
          aws_s3_bucket.alarm_templates.arn,
          "${aws_s3_bucket.alarm_templates.arn}/*"
        ],
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      }
    ]
  })
}