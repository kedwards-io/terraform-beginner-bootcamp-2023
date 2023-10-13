terraform {
  required_providers {
    terratowns = {
      source  = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
}
provider "terratowns" {
  endpoint  = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token     = var.terratowns_access_token
}



module "terrahouse_aws" {
  source              = "./modules/terrahouse_aws"
  user_uuid           = var.teacherseat_user_uuid
  bucket_name         = var.bucket_name
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  assets_path         = var.assets_path
  content_version     = var.content_version
}

resource "terratowns_home" "home" {
  name        = "How to play Arcanum in 2023"
  description = <<DESCRIPTION
  Arcanum is a game from 2001 that shipped with a lot of bugs.
  Modders have removed all the original issues making this game fun to play.
  DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  # domain_name     = "234hlj4.cloudfront.net"
  town            = "missingo"
  content_version = 1
}