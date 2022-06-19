output "tag" {
  value = "InstanceAlarm:${var.bucket}:${aws_s3_bucket_object.template.key}"
}
