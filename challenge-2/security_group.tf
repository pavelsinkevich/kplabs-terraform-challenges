resource "aws_security_group" "security_group_payment_app" {
  name        = "payment_app"
  description = "Application Security Group"
  depends_on  = [aws_eip.example]
  tags = {
    Name = "challenge-2"
    Env = "DEV"
    Team = "Sales"
  }
  # Below ingress allows HTTPS  from DEV VPC
  ingress {
    from_port   = var.HTTPS_port
    to_port     = var.HTTPS_port
    protocol    = "tcp"
    cidr_blocks = ["${var.IP_DEV}/16"]
  }

  # Below ingress allows APIs access from DEV VPC

  ingress {
    from_port   = var.API_DEV_port
    to_port     = var.API_DEV_port
    protocol    = "tcp"
    cidr_blocks = ["${var.IP_DEV}/16"]
  }

  # Below ingress allows APIs access from Prod App Public IP.

  ingress {
    from_port   = var.API_PROD_port
    to_port     = var.API_PROD_port
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.example.public_ip}/32"]
  }

  egress {
    from_port   = var.splunk
    to_port     = var.splunk
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
