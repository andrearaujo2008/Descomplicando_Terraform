terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

# local variables
locals {
  app_title = "my-awesome-app-stg-${var.environment}"
}

resource "local_file" "hashicorp_local" {
  filename = "${path.module}/.env"
  content  = "APP_TITLE=${local.app_title}\nPASSWORD=${var.db_password}"
}

resource "local_file" "env_file" {
  filename = "${path.module}/.env"
  content  = "APP_NAME=${local.app_title}\nDB_PASS=${var.db_password}"
}

#-----------------Outputs---------------------

output "config_path_file" {
  description = "Path of generated  cofiguration file"
  value       = local_file.env_file.filename
}

output "app_environement" {
  description = "Active environment name"
  value       = var.environment
}

output "database_secret" {
  description = "Database secret password"
  value       = var.db_password
  sensitive   = true
}
