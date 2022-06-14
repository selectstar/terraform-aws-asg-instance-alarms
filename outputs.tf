output "bucket" {
  value = aws_s3_bucket.alarm_templates.id
}

output "function_name" {
  value = var.name
}