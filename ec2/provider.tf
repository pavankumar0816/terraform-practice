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