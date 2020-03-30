resource "aws_key_pair" "test-keypair" {
  key_name   = "test-keypair"
  public_key = file("/home/mijack/.ssh/id_rsa.pub")
}

