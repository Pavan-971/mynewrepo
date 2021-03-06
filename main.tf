provider "aws" {

region  = "ap-south-1"
}

resource "aws_instance" "example1" {
ami = "ami-08f63db601b82ff5f"
instance_type = "t2.micro"
tags = {
Name = "AppServer-1"
}
vpc_security_group_ids = ["sg-0673c2bba90be2d92"]
key_name = "mykeypair"


}



terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "infypavan"
    key            = "global/s3/terraform.tfstate"
    region         = "ap-south-1"
    # Replace this with your DynamoDB table name!
    dynamodb_table = "pavantable"
    encrypt        = true
  }
}
