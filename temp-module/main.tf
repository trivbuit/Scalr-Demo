
# Configure the AWS Provider
provider "aws" {
  region     = "ap-southeast-1"
}

module "ec2-instance-trmodule" {
  source  = "trivbuit.scalr.io/env-tct37d1oddo7u4g/ec2-instance-trmodule/aws"
  version = "1.0.4"

  count = 1

  ami           = "ami-01581ffba3821cdf3"
  instance_type = "t2.micro"

  key_name = "trbvm"
}

output "ec2-user" {
  value = module.ec2-instance-trmodule.*.ec2_user
}