provider "aws" {
  region  = var.aws_region
  profile = "kallumcooper"
  default_tags {
    tags = local.tags
  }
}

provider "aws" {
  alias   = "use1"
  region  = "eu-west-2"
  profile = "kallumcooper"
  default_tags {
    tags = local.tags
  }
}