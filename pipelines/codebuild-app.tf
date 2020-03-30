resource "aws_codebuild_project" "app-codebuild" {
  name           = "app-codebuild"
  description    = "app-codebuild"
  build_timeout  = "5"
  queued_timeout = "5"
  service_role   = aws_iam_role.app-codebuild-role.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  cache {
    type  = "LOCAL"
    modes = ["LOCAL_DOCKER_LAYER_CACHE", "LOCAL_SOURCE_CACHE"]
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:1.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"

  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/videocursoscloud/vpc-cuarentena-packer"
    git_clone_depth = 1
    buildspec       = file("buildspec-app.yaml")

  }

}
