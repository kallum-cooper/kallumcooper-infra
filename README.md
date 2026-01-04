# kallumcooper-infra

Terraform stack that deploy infrastructure for kallumcooper.co.uk using modules from my repo [terraform-modules](https://github.com/kallum-cooper/terraform-modules/tree/main).

## Structure
- `environments/prod/site` – production site stack (Route 53 + ACM + S3 + CloudFront)

## Modules
This repo consumes:
- [cloudfront-static-site](https://github.com/kallum-cooper/terraform-modules/tree/main/modules/cloudfront-static-site)
- [s3-private-origin-bucket](https://github.com/kallum-cooper/terraform-modules/tree/main/modules/s3-private-origin-bucket)

## Current Module components
- Route 53 hosted zone for `kallumcooper.co.uk`
- ACM certificate in `us-east-1`
- Private S3 origin bucket
- CloudFront distribution
- Route 53 A/AAAA alias records for apex + www

## CI

This repo uses a GitHub Actions workflow to run basic Terraform checks on every push to `main` and on pull requests:

- **`terraform fmt -check -recursive`** – ensures all Terraform files are consistently formatted
- **`terraform init -backend=false` + `terraform validate`** – validates the `environments/prod/site` stack


## Notes
- This repo currently uses local state (remote state planned).
