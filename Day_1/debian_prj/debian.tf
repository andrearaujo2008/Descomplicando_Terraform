resource "aws_instance" "second_project" {
  ami           = "ami-073f149603898e301" #Amazon Linux 2023
  instance_type = "t3.micro"
  subnet_id     = "subnet-05916c92c0c047eda"
  tags = {
    Name = "Terraform_Example"
  }
}
