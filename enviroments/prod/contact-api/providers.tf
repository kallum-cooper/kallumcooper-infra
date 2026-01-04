provider "aws" {
  region  = var.aws_region
  profile = "kallumcooper"
  default_tags {
    tags = local.tags
  }
}

provider "aws" {
  alias   = "use1"
  region  = "us-east-1"
  profile = "kallumcooper"
  default_tags {
    tags = local.tags
  }
}