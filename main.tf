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

# Create a VPC
resource "aws_security_group" "dg-tf-sg" {
  name        = "dg-tf-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "dg-tf-sg"
  }
}