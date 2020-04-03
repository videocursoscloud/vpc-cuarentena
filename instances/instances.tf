resource "aws_instance" "bastion" {
  ami           = data.aws_ami.bastion.id
  instance_type = "t2.micro"
  subnet_id = data.terraform_remote_state.vpc.outputs.public_1_subnet_id
  key_name = aws_key_pair.test-keypair.key_name
  vpc_security_group_ids = [ aws_security_group.allow_bastion.id ]
  tags = {
    Name = "bastion"
  }
}

resource "aws_instance" "app" {
  ami           = data.aws_ami.app.id
  instance_type = "t2.micro"
  subnet_id = data.terraform_remote_state.vpc.outputs.private_1_subnet_id
  key_name = aws_key_pair.test-keypair.key_name
  vpc_security_group_ids = [ aws_security_group.allow_app.id ]
  tags = {
    Name = "app"
  }
}
