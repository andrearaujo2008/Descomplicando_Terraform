terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

locals {
  formatted_app_name = upper(var.app_name) #Convert to Uppercase the name eg MONITORING
}

resource "local_file" "inventory_file" {
  filename = "Inventory=${path.module}/inventory.txt"
  content  = "APP: ${local.formatted_app_name}\n COUNT: ${var.instance_count}\n API_KEY: ${var.api_key}"
}

#-----------------------------OUTPUTS---------------------------------------------------------------

output "app_summary" {
  description = "Outputs the information instance"
  sensitive   = true #the field sensitive never stay inside the value field
  value = {
    app                  = local.formatted_app_name
    total_instance       = var.instance_count
    sensitive_api_server = var.api_key

  }
}

