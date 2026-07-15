terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

  }

  #Here configuration backend in S3 bucket AWS
  #backend é o nome do provider
  backend "s3" {
    bucket = "descomplicando-terraform-turma-20xx" #bucket s3 name in AWS
    key    = "aula_backend"                        #name the file you want save it
    region = "eu-west-2"                           # This is AWS region you are
  }

}

#Here this provider your region London
provider "aws" {
  region = "eu-west-2"
}

#Here this provider your region Virginia USA
provider "aws" {
  region = "us-east-1"
}
