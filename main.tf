#Creater tf object
# data "azurerm_resource_group" "diegomez" {
#   name = "diego-gomez"
# }


# resource "azurerm_virtual_network" "test-network" {
#   name                = "dg-09-network"
#   address_space       = ["10.0.0.0/16"]
#   location            = data.azurerm_resource_group.diegomez.location
#   resource_group_name = data.azurerm_resource_group.diegomez.name
# }

#aws code

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "dg-vpc"
  }
}

# Create a Security group
# resource "aws_security_group" "dg-tf-sg" {
#   name        = "dg-tf-sg"
#   description = "Tf security group demo"
#   vpc_id      = aws_vpc.main.id

#   ingress {
#     description = "SSH ALLOWED"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "TCP ALLOWED"
#     from_port   = 8080
#     to_port     = 8080
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   tags = {
#     Name = "dg-tf-sg"
#   }
# }
