
# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "template_0module" {
  ami           = "ami-0f86a70488991335e"
  instance_type = "t2.micro"

  key_name = "trbvm"

  tags = {
    Name = "Demo Scalr"
  }
}

output "login" {
  value = aws_instance.template_0module.public_ip
}