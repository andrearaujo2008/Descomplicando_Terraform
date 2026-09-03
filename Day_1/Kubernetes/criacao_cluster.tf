#This project I'm creating 3 instances AWS to study Day 5 about Cluster creating
#Developed by André de Araujo 
#Data 16/07/2026 (Thursday)


#Instance AWS how will create to kubernetes
resource "aws_instance" "cluster_kubernetes" {
  count         = 2                      #Here I'm specify how many instance I want to raise it 
  provider      = aws.london             # Region where the aws will be raise
  instance_type = var.ec2_instance_type  #Type Instance in this case T3.medium
  ami           = var.image["eu-west-2"] #Image Instance
  subnet_id     = var.subnet_id          #Subnet where will be used
  key_name      = var.keypair            #Name keypair to acess via ssh

  #Enable assign Public IP automatic
  associate_public_ip_address = true

  #This is already exist a security group defined
  vpc_security_group_ids = [
    "sg-0663f337f58451693",
    "sg-0af372fc867e0d109"
  ]

  tags = {
    Name = "kubernetes_instance-${count.index + 1}" #Name will be in tags
  }

}

#Elastic IP
resource "aws_eip" "base" {
  count    = 2
  provider = aws.london # Region where the aws will be assign these ips
  instance = aws_instance.cluster_kubernetes[count.index].id
  domain   = "vpc"

  tags = {
    Name = "kube_eip"
  }

}
