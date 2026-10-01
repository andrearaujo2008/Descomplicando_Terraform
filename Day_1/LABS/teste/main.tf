resource "aws_instance" "teste" {
  provider      = aws.lodon # &lt;--- Adicione esta linha vinculando ao alias
  ami           = "ami-002aab1cab5a08e35"
  instance_type = "t3.micro"
}

provider "aws" {
  region = "eu-west-2"
  alias  = "lodon"
}
