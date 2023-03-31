# -------------------------
# DESCRIPCIÓN: CREA UN SERVER DE UBUNTU EN AWS EC2, ESTRUCTURA BÁSICA DE TERRAFORM.
# EJECUCIÓN: EN EL PATH DE MAIN.TF: TERRAFORM INIT, TERRAFORM PLAN, TERRAFORM APPLY 
# -------------------------

# Provider de AWS
provider "aws" {
  region = "us-east-1"
}

# Instancia EC2 con AMI Ubuntu
resource "aws_instance" "mi_servidor" {
  ami           = "ami-007855ac798b5175e"
  instance_type = "t2.micro"
}