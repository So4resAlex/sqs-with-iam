terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.37.0"
    }   
  }
  backend "s3" {} #Init with 

}
provider "aws" {
  region = "us-east-1"
}

