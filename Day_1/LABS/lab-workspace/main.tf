terraform {
    required_providers {
        local = {
            source  = "hashicorp/local"
            version = " ~> 2.4"
        }
    }
}            

# Usamos o nome do workspace ativo para definir as configurações de cada ambiente
locals {
    ambiente = terraform.workspace
    
   # Mapeamento de configurações por ambiente
    configuracoes = {
        default = "Servidor Local de Teste Rapido"
            dev     = "Ambiente de Desenvolvimento - Modo Debug Ativo"
            prod    = "Ambiente de Producao - Alta Disponibilidade e Seguranca"
    }
        
    # Seleciona a descricao do ambiente atual (ou usa uma padrao se nao encontrar)
        descricao = lookup(local.configuracoes, local.ambiente, "Ambiente Personalizado")
    }
    
    # Recurso que gera um arquivo diferente para cada workspace
    resource "local_file" "config_ambiente" {
        filename = "${path.module}/Servidor-${local.ambiente}.txt"
        content  =  " --- CONFIGURAÇÃO DO SERVIDOR ---\nAmbiente: ${local.ambiente}\nDetalhes: ${local.ambiente}\nDetalhes: ${local.descricao}\n"
    }
    
    # Outputs para visualizar o workspace no terminal
    output "workspace_atual" {
        value       = terraform.workspace
        description = "Nome do workspace que está ativo no momento"
    }
    
    output "arquivo_gerado" {
        value       = local_file.config_ambiente.filename
        description = "Caminho do arquivo criado"
    }