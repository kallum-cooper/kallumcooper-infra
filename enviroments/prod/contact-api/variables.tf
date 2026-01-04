variable "aws_region" {
  description = "Primary AWS region for regional resources."
  type        = string
  default     = "eu-west-2"
}

variable "environment" {
  description = "Production"
  type        = string
  default     = "prod"
}