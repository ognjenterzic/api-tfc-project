terraform {

  required_providers {
    aws ={
        source = "hashicorp/aws"
        version = "~> 4.16"
    }
  }

 #####CLOUD 
 

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

resource "aws_dynamodb_table" "ogi-dynamodb" {
  name = "Test table"
  hash_key         = "TestTableHashKey"
  billing_mode     = "PAY_PER_REQUEST"
  
attribute {
    name = "TestTableHashKey"
    type = "S"
  }

}