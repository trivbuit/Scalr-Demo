
# Configure the AWS Provider
provider "aws" {
  region     = "ap-southeast-1"
}

# terraform {
#   backend "s3" {
#     bucket     = "rt-tf-test-bucket"
#     key        = "terraform.tfstate"
#     region     = "ap-southeast-1"
#     access_key = "access_key"
#     secret_key = "secret_key"
#   }
# }

terraform {
  backend "remote" {
    hostname = "trivbuit.scalr.io"
    organization = "env-tct37d1oddo7u4g"

    workspaces {
      name = "Demo_S3_2_Scalr"
    }
  }
}

module "ec2-instance-trmodule" {
  source  = "trivbuit.scalr.io/env-tct37d1oddo7u4g/ec2-instance-trmodule/aws"
  version = "1.0.4"

  count = 3

  ami           = "ami-0f86a70488991335e"
  instance_type = "t2.micro"

  key_name = "trbvm"
}

output "ec2-user" {
  value = module.ec2-instance-trmodule.*.ec2_user
}