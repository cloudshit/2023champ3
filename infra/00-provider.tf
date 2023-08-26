terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }

    tls = {
      source = "hashicorp/tls"
      version = "4.0.4"
    }

    local = {
      source = "hashicorp/local"
      version = "2.4.0"
    }

    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "default"
}

provider "tls" {
}

provider "local" {
}

provider "random" {
}


data "aws_caller_identity" "caller" {
}
