output "survivor_bucket_name" {
  description = "Bucket name for our static website hosting"
  value       = module.home_survivor_hosting.bucket_name
}

output "survivor_s3_website_endpoint" {
  description = "S3 static website hosting endpoint"
  value       = module.home_survivor_hosting.website_endpoint
}

output "survivor_cloudfront_url" {
  description = "The Cloudfront Distribution Domain Name"
  value       = module.home_survivor_hosting.domain_name
}

output "chili_bucket_name" {
  description = "Bucket name for our static website hosting"
  value       = module.home_chili_hosting.bucket_name
}

output "chili_s3_website_endpoint" {
  description = "S3 static website hosting endpoint"
  value       = module.home_chili_hosting.website_endpoint
}

output "chili_cloudfront_url" {
  description = "The Cloudfront Distribution Domain Name"
  value       = module.home_chili_hosting.domain_name
}