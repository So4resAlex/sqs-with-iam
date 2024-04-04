terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.37.0"
    }   
  }
  backend "s3" {} #Init with -backend-config parameter 
}
provider "aws" {
  region = "us-east-1"
}

