terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

#1. Data Source que le o estado (.tfstate) do Projeto 1
data "terraform_remote_state" "rede" {
  backend = "local"

  config = {
    #Caminho relativo apontando para o arquivo .tfstate do Projeto 1
    path = "../01-infra-rede/terraform.tfstate"
  }
}

# 2. Recurso que consome os outputs extraidos do Projeto 1
resource "local_file" "config_servidor" {
  filename = "${path.module}/server_config.txt"

  # Acessamos os dados via: data.terraform_remote_state <nome>.outputs.<output_name>
  content = <<EOT
  Configuracao do Servidor Web:
  ------------------------------------------------
  VPC Conectada: ${data.terraform_remote_state.rede.outputs.vpc_id}
  Sub-rede Utilizada: ${data.terraform_remote_state.rede.outputs.subnet_id}
  Status: Servidor alocado na rede existente com sucesso!
  EOT
}

#3. Output confirmando o que foi lido
output "dados_de_rede_consumidos" {
  value = {
    vpc    = data.terraform_remote_state.rede.outputs.vpc_id
    subnet = data.terraform_remote_state.rede.outputs.vpc_id


  }
}
