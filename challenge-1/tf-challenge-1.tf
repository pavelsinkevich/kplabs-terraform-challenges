provider "aws" {
  region     = "eu-north-1"
}

provider "digitalocean" {}

terraform {
  /*required_version = "0.12.31"*/
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}


resource "aws_eip" "kplabs_app_ip" {
  domain = "vpc"
}
