# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 6.0"
#     }
#   }
# }

# provider "aws" {
#   region = "us-east-1"
# }

# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"
#   instance_tenancy = "default"
#     tags = {
#         Name = "main_vpc"
#     }
# }

# resource "aws_subnet" "main" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = "10.0.1.0/24"
#   availability_zone = "us-east-1a"
  

#   tags = {
#     Name = "Main"
#   }
# }
# resource "aws_route" "r" {
#   route_table_id            = aws_route_table.testing.id
#   destination_cidr_block    = "0.0.0.0/0"
# }

