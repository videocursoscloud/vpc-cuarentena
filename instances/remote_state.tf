terraform {
  backend "s3" {
    bucket = "vpc-cuarentena"
    key    = "instances/terraform.tfstate"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "vpc" {
 backend     = "s3"
 config = {
   bucket = "vpc-cuarentena"
   key    = "vpc/terraform/vpc.tfstate"
   region = "eu-west-1"
 }
}
