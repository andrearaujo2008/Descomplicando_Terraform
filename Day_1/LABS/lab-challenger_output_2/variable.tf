variable "app_name" {            #Variable name
  type    = string               #Type of variable
  default = "monitoring-service" #default name
}

variable "instance_count" {
  type    = number
  default = 3
}

variable "api_key" {
  type      = string
  default   = "secret-key-xyz-789"
  sensitive = true #hidden the password
}
