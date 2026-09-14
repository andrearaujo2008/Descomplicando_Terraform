terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

# 1 Define nicknames (locals)
locals {
    owner   = "andre"
    project = "portal"
    
    #To combine words into one "portal-andre"
    complete_name = "${local.project}-${local.owner}"

}

# 2 Create first file using local
resource "local_file" "owner" {
    filename    =   "${path.module}/config_db.txt"
    content     =   "Database is controlled by ${ local.complete_name }"  
}

# 3 Create second file using local
resource "local_file" "project" {
    filename    =   "${path.module}/config_app.txt"
    content     =   "Portal is controlled by ${ local.complete_name }"  
}