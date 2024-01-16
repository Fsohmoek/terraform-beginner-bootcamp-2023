terraform {

  cloud {
    organization = "fsohmoek"

    workspaces {
      name = "terra-house-1"
    }
  }
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.6.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.32.1"
    }
  }
}
provider "aws" {
  # Configuration options
}

provider "random" {
  # Configuration options
}
