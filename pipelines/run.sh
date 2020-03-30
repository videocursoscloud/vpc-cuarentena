aws codebuild start-build --project-name app-codebuild|jq .build.id -r
aws codebuild start-build --project-name bastion-codebuild|jq .build.id -r

