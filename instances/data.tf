data "aws_ami" "bastion" {
  most_recent = true

  filter {
    name   = "name"
    values = ["packer-vcc-cuarentena-bastion-*"]
  }


  owners = ["self"] 
}

data "aws_ami" "app" {
  most_recent = true

  filter {
    name   = "name"
    values = ["packer-vcc-cuarentena-app-*"]
  }


  owners = ["self"] 
}
