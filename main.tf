terraform {
	backend "remote" {
		organization = "connect-system"
		workspaces {
			name = "example-workspace"
		}
	}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

}

provider "aws" {
  region  = "us-west-2"
	profile = "default"
	shared_credentials_file = "$HOME/.aws/credentials"
}

resource "aws_instance" "app_server" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"
}

