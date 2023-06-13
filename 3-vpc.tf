resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "main"
  }
}

# VPC requirements and considerations when creating a cluster.
# The VPC must have DNS hostname and DNS resolution support. Otherwise, nodes can't register to your cluster.
# https://docs.aws.amazon.com/eks/latest/userguide/network_reqs.html
