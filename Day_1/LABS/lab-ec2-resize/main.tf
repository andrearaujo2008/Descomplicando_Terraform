terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

# Pegar dinamicamente a AMI mais recente do Debian 12
data "aws_ami" "debian" {
  most_recent = true
  owners      = ["136693071363"] # ID oficial da Debian

  filter {
    name   = "name"
    values = ["debian-12-amd64-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Instância inicial com t2.micro
resource "aws_instance" "teste_resize" {
  ami           = data.aws_ami.debian.id
  instance_type = "t3.large"
  subnet_id     = "subnet-05916c92c0c047eda"

  tags = {
    Name = "lab-teste-resize"
  }
}

output "instancia_id" {
  description = "ID da máquina criada"
  value       = aws_instance.teste_resize.id
}

output "tipo_inicial" {
  value = aws_instance.teste_resize.instance_type
}
