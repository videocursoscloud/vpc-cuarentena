terraform {
  backend "s3" {
    bucket = "vpc-cuarentena"
    key    = "vpc/"
    region = "eu-west-1"
  }
}

