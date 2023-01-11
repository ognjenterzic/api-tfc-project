terraform {
  required_providers {
    aws={
        source = "hashicorp/aws"
        version = "~> 4.16"
    }
  }

cloud {
  organization = "hashicorp-learn-ot"

  workspaces {
    name = "api-tfc-demo"
  }
}

}

provider "aws" {
  region = "us-east-1"
}


resource "aws_s3_bucket" "ogi-bucket" {
  bucket = "ogi-bucket-s3"
  force_destroy = true
  acl = "public-read"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}