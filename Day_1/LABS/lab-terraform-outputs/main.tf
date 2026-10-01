terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

# Local variables (internal helpers)
locals {
  app_name = "portal-app"
  env      = "production"
}

# Resource 1: Creates a database config file
resource "local_file" "db_config" {
  filename = "${path.module}/config_db.txt"
  content  = "DB_HOST=127.0.0.1\nDB_NAME=${local.app_name}_db\nDB_PORT=5432"
}

# Resource 2: Creates an app config file
resource "local_file" "app_config" {
  filename = "${path.module}/config_app.txt"
  content  = "APP_ENV=${local.env}\nAPP_TITLE=${local.app_name}"
}

#------------------------------OUTPUTS-------------------------------------------------------------------------------

#Output 1: Single Value (file path)
output "db_config_path" {
  description = "Path to the generated DB configuration file"
  value       = "local_file.db_config.filename"
}

# Output 2: Map of generated files
output "generated_files" {
  description = "Summary of all generated configuration files and their IDs"
  value = {
    db_file  = local_file.db_config.filename
    app_file = local_file.app_config.filename
    db_id    = local_file.db_config.id
  }
}


# Simulate secret key
resource "local_file" "secret_token" {
  filename = "${path.module}/secret.key"
  content  = "super-secret-api-token-9988"
}

# Outputed marked as sensitive
output "db_password" {
  description = "Generate DB Password"
  value       = local_file.secret_token
  sensitive   = true
}
