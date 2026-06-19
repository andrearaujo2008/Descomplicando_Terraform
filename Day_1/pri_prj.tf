
#Here this provider your region
provider"aws"{
region="eu-west-2"
}

#Here are the AWS spec information

resource"aws_instance""first_project"{
  ami="ami-07c06c9f04a3f051f"  #Amazon Linux 2023
  instance_type="t3.micro"
  subnet_id="subnet-05916c92c0c047eda"
  tags={
    Name="Terraform_Example"
  }
}  
  