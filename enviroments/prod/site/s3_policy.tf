data "aws_iam_policy_document" "origin_bucket_policy" {
  statement {
    sid     = "AllowCloudFrontRead"
    effect  = "Allow"
    actions = ["s3:GetObject"]

    resources = [
      "${module.origin_bucket.bucket_arn}/*"
    ]

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = ["arn:aws:cloudfront::${data.aws_caller_identity.current.account_id}:distribution/${module.cdn.distribution_id}"]
    }
  }
}

resource "aws_s3_bucket_policy" "origin" {
  bucket = module.origin_bucket.bucket_name
  policy = data.aws_iam_policy_document.origin_bucket_policy.json
}
