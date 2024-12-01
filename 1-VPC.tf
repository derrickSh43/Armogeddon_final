# The VPC's are allocated to the following regions
# app1 - Tokyo
# app2 - New York
# app3 - London
# app4 - Sao Paolo
# app5 - Sydney
# app6 - Hong Kong SAR
# app7 - N. California

# Tokyo VPC
resource "aws_vpc" "app1-vpc" {
  cidr_block = "10.230.0.0/16"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name     = "app1-vpc"
    Service  = "VPC"
    Location = "Tokyo"
  }
}

# New York VPC via N. Virginia
resource "aws_vpc" "app2-vpc" {
  cidr_block = "10.231.0.0/16"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name     = "app1-vpc"
    Service  = "VPC"
    Location = "New York"
  }
}

# London VPC
resource "aws_vpc" "app3-vpc" {
  cidr_block = "10.232.0.0/16"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name     = "app3-vpc"
    Service  = "VPC"
    Location = "London"
  }
}

# Sao Paolo VPC
resource "aws_vpc" "app4-vpc" {
  cidr_block = "10.233.0.0/16"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name     = "app4-vpc"
    Service  = "VPC"
    Location = "Sao Paolo"
  }
}

# Sydney VPC
resource "aws_vpc" "app5-vpc" {
  cidr_block = "10.234.0.0/16"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name     = "app5-vpc"
    Service  = "VPC"
    Location = "Sydney"
  }
}

# Hong Kong VPC
resource "aws_vpc" "app6-vpc" {
  cidr_block = "10.235.0.0/16"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name     = "app6-vpc"
    Service  = "VPC"
    Location = "Hong Kong"
  }
}

# N. California VPC
resource "aws_vpc" "app7-vpc" {
  cidr_block = "10.236.0.0/16"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name     = "app7-vpc"
    Service  = "VPC"
    Location = "N. California"
  }
}