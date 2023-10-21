resource "aws_eip" "example" {
  domain = "vpc"
  tags = {
    Environment = "DEV"
  }
}