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

#import {
# to = aws_s3_bucket.bucket_importado
#id = "meu-bucket-legado-123"
#}

# Declaramos o recurso para onde o import vai apontar
resource "aws_s3_bucket" "bucket_classico" {
  bucket = "meu-bucket-legado-123"
}
