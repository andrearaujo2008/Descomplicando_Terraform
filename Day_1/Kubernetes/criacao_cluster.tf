#This project I'm creating 3 instances AWS to study Day 5 about Cluster creating
#Developed by André de Araujo 
#Data 16/07/2026 (Thursday)

resource "aws_instance" "cluster_kubernetes" {
    count   = 1 #Here I'm specify how many instance I want to raise it 
    provider = aws.london # Region where the aws will be raise
    instance_type = var.ec2_instance_type #Type Instance in this case T3.medium
    ami = var.image["eu-west-2"] #Image Instance
    subnet_id = var.subnet_id #Subnet where will be used
    key_name = var.keypair #Name keypair to acess via ssh
    
    vpc_security_group_ids = ["sg-0663f337f58451693"] #This is already exist a security group defined

   tags = {
    Name = "kubernetes_instance-$count.index + 1}" #Name will be in tags
  }
  
}