# Provider de AWS
provider "aws" {
  region = "us-east-1"
}

# Instancia EC2 con AMI Ubuntu
resource "aws_instance" "mi_servidor" {
  ami           = "ami-007855ac798b5175e"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.mi_grupo_de_seguridad.id]
  user_data = <<-EOF
              #!/bin/bash
              echo "Hola mundo desde terraform" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
}

# exponer el puerto
resource "aws_security_group" "mi_grupo_de_seguridad" {
  name = "mi-servidor_sg"
  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Acceso al puerto 8080 desde el exterior"
    from_port = 8080
    to_port = 8080
    protocol = "TCP"  
  } 
}