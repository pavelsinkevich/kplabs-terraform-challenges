
variable "instance_config" {
  type = map(any)
  default = {
    instance1 = { instance_type = "t2.micro", ami = "ami-03a6eaae9938c858c" }
    
  }
}

