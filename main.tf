provider "aws" {
    region = "eu-west-1"
    secret_key = ""
    access_key = ""
}

terraform {
    backend "s3" {
        encrypt = false
        bucket = "newpipeline12"
        dynamodb_table = "Pipeline"
        key = "path/path/terraform-tfstate"
        region = "eu-west-1"
   
    }
}

resource "aws_vpc" "tf_test" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_hostnames = true
    tags = {
        "Name" = "tf_test"
    }
}

resource "aws_subnet" "Subnet-tf-public" {
    vpc_id = aws_vpc.tf_test.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    tags = {
        "Name" = "Subnet-tf-public"
    }
}

resource "aws_subnet" "Subnet-tf-private" {
    vpc_id = aws_vpc.tf_test.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-1b"
    tags = {
        "Name" = "Subnet-tf-private"
    }
}