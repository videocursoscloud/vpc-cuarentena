terraform {
  backend "s3" {
    bucket = "vpc-cuarentena"
    key    = "pipelines/terraform/codebuild.tfstate"
    region = "eu-west-1"
  }
}

