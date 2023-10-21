resource "aws_eip" "example" {
  domain = "vpc"
  tags = {
    Name = "challenge-2"
    Env = "DEV"
    Team = "Sales"
  }
}