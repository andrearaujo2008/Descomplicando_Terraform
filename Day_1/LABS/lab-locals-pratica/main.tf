terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

# 1. Definimos os nossos "apelidos" (valores locais)
locals {
  empresa     = "techcorp"
  ambiente    = "homologacao"

  # Juntando duas palavras em uma só: "techcorp-producao"
  identificador_completo = "${local.empresa}-${local.ambiente}"
}

# 2. Criando o primeiro arquivo usando o local
resource "local_file" "servidor_web" {
  filename = "${path.module}/servidor_web.txt"
  content  = "Servidor Web sob controle de: ${local.identificador_completo}"
}

# 3. Criando o segundo arquivo reutilizando o mesmo local
resource "local_file" "banco_dados" {
  filename = "${path.module}/banco_dados.txt"
  content  = "Banco de Dados sob controle de: ${local.identificador_completo}"
}