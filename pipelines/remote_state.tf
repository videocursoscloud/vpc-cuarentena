terraform {
  backend "s3" {
    bucket = "vpc-cuarentena"
    key    = "vpc/terraform/pipelines.tfstate"
    region = "eu-west-1"
  }
}

