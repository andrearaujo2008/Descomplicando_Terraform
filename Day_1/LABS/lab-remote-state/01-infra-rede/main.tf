terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

#Simula a criacao de identificadores de rede
locals {
  vpc_id    = "vpc-corporativa-xyz99"
  subnet_id = "subnet-publica-east-1a"
}

#É OBRIGATORIO declarar os outputs para expor informacoes no estado remoto!
output "vpc_id" {
  description = "ID da VPC criada pela equipe de rede"
  value       = local.vpc_id
}

output "subnet_id" {
  description = "ID da Sub-rede criada pela equipe de rede"
  value       = local.subnet_id
}

