terraform {
    required_providers { # dependency resolution
        aws = {
            source = "hashicorp/aws"
            version = "6.33.0"
        }
    }
}

provider "aws" { # tells terraform how to configure that provider (This is about runtime configuration)
    region = "us-east-1"
}

# provider "aws" is used to configure the AWS provider. If the region is not provided through another supported configuration method,
# we specify the region inside the provider block so Terraform knows where to create/manage AWS resources.

