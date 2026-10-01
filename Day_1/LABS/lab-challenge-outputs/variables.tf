variable "environment" {
  type    = string
  default = "stagging"
}

variable "db_password" {
  type      = string
  default   = "SuperSecretPass123!"
  sensitive = true
}
