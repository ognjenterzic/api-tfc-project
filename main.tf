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
  region = var.region
}


resource "aws_s3_bucket" "ogi-bucket" {
  bucket = "ogi-bucket-s3"
  force_destroy = var.bool_true
  acl = "public-read"

  versioning {
    enabled = var.bool_true  
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_instance" "ogi-instance" {
  count = 2

  ami = var.ami
  instance_type = var.instance_type-1

  tags = {
    Name = "Server ${count.index}"
  }
}

/*
resource "aws_dynamodb_table" "example" {
  name             = "example"
  hash_key         = "TestTableHashKey"
  billing_mode     = "PAY_PER_REQUEST"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "TestTableHashKey"
    type = "S"
  }


}

*/