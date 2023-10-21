resource "aws_instance" "myec2" {
  for_each      = var.instance_config
  ami           = each.value.ami
  instance_type = each.value.instance_type
  tags = {
    Name = each.key
  }

}
