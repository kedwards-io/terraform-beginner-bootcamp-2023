terraform {
  required_providers {
    terratowns = {
      source  = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }

  cloud {
    organization = "4kedwards"

    workspaces {
      name = "terra-house-1"
    }
  }
}

provider "terratowns" {
  endpoint  = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token     = var.terratowns_access_token
}



module "home_arcanum_hosting" {
  source      = "./modules/terrahome_aws"
  user_uuid   = var.teacherseat_user_uuid
  public_path = var.arcanum.public_path
  # bucket_name     = var.bucket_name
  content_version = var.arcanum.content_version
}

resource "terratowns_home" "home_arcanum" {
  name            = "How to play Arcanum in 2023"
  description     = <<DESCRIPTION
  Arcanum is a game from 2001 that shipped with a lot of bugs.
  Modders have removed all the original issues making this game fun to play.
  DESCRIPTION
  domain_name     = module.home_arcanum_hosting.domain_name
  town            = "missingo"
  content_version = var.arcanum.content_version
}

module "home_chili_hosting" {
  source      = "./modules/terrahome_aws"
  user_uuid   = var.teacherseat_user_uuid
  public_path = var.chili.public_path
  # bucket_name = var.bucket_name
  content_version = var.chili.content_version
}

resource "terratowns_home" "home_chili" {
  name            = "How to make chili"
  description     = <<DESCRIPTION
  Since the weather is cooling off, it's time to make chili.
  Here's a super simple recipe.
  DESCRIPTION
  domain_name     = module.home_chili_hosting.domain_name
  town            = "missingo"
  content_version = var.chili.content_version
}