resource "aws_codepipeline" "codepipeline" {
  name     = "pipeline-bastion"
  role_arn  = aws_iam_role.bastion-codebuild-role.arn

  artifact_store {
    location = "vpc-cuarentena"
    type     = "S3"

#    encryption_key {
#      id   = "${data.aws_kms_alias.s3kmskey.arn}"
#      type = "KMS"
#    }
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "ThirdParty"
      provider         = "GitHub"
      version          = "1"
      output_artifacts = ["bastion-ami"]

      configuration = {
        Owner  = "videocursoscloud"
        Repo   = "vpc-cuarentena-packer"
        Branch = "master"
	PollForSourceChanges  = "true"
      OAuthToken = "44cfe2b37cfa1bdcf35d07e3c439a925559ff9be"

      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts = ["bastion-ami"]
      version          = "1"

      configuration = {
        ProjectName = aws_codebuild_project.bastion-codebuild.name
      }
    }
  }

}
