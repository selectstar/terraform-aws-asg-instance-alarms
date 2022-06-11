variable "name" {
  default = "terraform-aws-asg-instance-alarms"
}

variable "schedule" {
  default = "rate(5 minutes)"
}

variable "lambda_layers" {
  default = []
}

variable "bucket-tags" {
  type = map(string)
}