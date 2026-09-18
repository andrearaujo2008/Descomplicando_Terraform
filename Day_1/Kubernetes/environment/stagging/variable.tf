variable "ec2_instance_type" {
  type    = string
  default = "t3.medium"
}

#Definindo uma variavel que controla para que quando sair uma versao nova AMI você pode colocar aqui neste lugar
variable "image" {
  type = map(string)
  description = "Mapa de AMIs aprovadas por regiao."
  default = {
  
    "eu-west-2" = "ami-0224ce6f9504665ee" #Sistema Ubuntu Server

  }
}

variable "subnet_id" {
  type = string
  default = "subnet-05916c92c0c047eda" 
}

variable "keypair" {
  type = string
  default = "kubernetes"
  
}