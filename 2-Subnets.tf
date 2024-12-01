# app1 - Tokyo Public Subnets
resource "aws_subnet" "public-ap-northeast-1a" {
  vpc_id                  = aws_vpc.app1-vpc.id
  cidr_block              = "10.230.1.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name     = "ap-northeast-1a"
    Service  = "Public Subnet"
    Location = "Tokyo"
  }
}

resource "aws_subnet" "public-ap-northeast-1c" {
  vpc_id                  = aws_vpc.app1-vpc.id
  cidr_block              = "10.230.2.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name     = "ap-northeast-1c"
    Service  = "Public Subnet"
    Location = "Tokyo"
  }
}

# app1 - Tokyo Private Subnets
resource "aws_subnet" "private-ap-northeast-1a" {
  vpc_id                  = aws_vpc.app1-vpc.id
  cidr_block              = "10.230.11.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = false

  tags = {
    Name     = "private-ap-northeast-1a"
    Service  = "Private Subnet"
    Location = "Tokyo"
  }
}

resource "aws_subnet" "private-ap-northeast-1c" {
  vpc_id                  = aws_vpc.app1-vpc.id
  cidr_block              = "10.230.12.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = false

  tags = {
    Name     = "private-ap-northeast-1c"
    Service  = "Private Subnet"
    Location = "Tokyo"
  }
}

# app2 - New York (via N. Virginia Region) Public Subnets
resource "aws_subnet" "public-us-east-1a" {
  vpc_id                  = aws_vpc.app2-vpc.id
  cidr_block              = "10.231.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name     = "us-east-1a"
    Service  = "Public Subnet"
    Location = "New York"
  }
}

resource "aws_subnet" "public-us-east-1c" {
  vpc_id                  = aws_vpc.app2-vpc.id
  cidr_block              = "10.231.2.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name     = "us-east-1c"
    Service  = "Public Subnet"
    Location = "New York"
  }
}

# app2 - New York (via N. Virginia Region) Private Subnets
resource "aws_subnet" "private-us-east-1a" {
  vpc_id                  = aws_vpc.app2-vpc.id
  cidr_block              = "10.231.11.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name     = "private-us-east-1a"
    Service  = "Private Subnet"
    Location = "New York"
  }
}

resource "aws_subnet" "private-us-east-1c" {
  vpc_id                  = aws_vpc.app2-vpc.id
  cidr_block              = "10.231.12.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = false

  tags = {
    Name     = "private-us-east-1c"
    Service  = "Private Subnet"
    Location = "New York"
  }
}

# app3 - London Public Subnets

resource "aws_subnet" "public-eu-west-2a" {
  vpc_id                  = aws_vpc.app3-vpc.id
  cidr_block              = "10.232.1.0/24"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name     = "eu-west-2a"
    Service  = "Public Subnet"
    Location = "London"
  }
}

resource "aws_subnet" "public-eu-west-2c" {
  vpc_id                  = aws_vpc.app3-vpc.id
  cidr_block              = "10.232.2.0/24"
  availability_zone       = "eu-west-2c"
  map_public_ip_on_launch = true

  tags = {
    Name     = "eu-west-2c"
    Service  = "Public Subnet"
    Location = "London"
  }
}

# app3 - London Private Subnets

resource "aws_subnet" "private-eu-west-2a" {
  vpc_id                  = aws_vpc.app3-vpc.id
  cidr_block              = "10.232.11.0/24"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = false

  tags = {
    Name     = "private-eu-west-2a"
    Service  = "Private Subnet"
    Location = "London"
  }
}

resource "aws_subnet" "private-eu-west-2c" {
  vpc_id                  = aws_vpc.app3-vpc.id
  cidr_block              = "10.232.12.0/24"
  availability_zone       = "eu-west-2c"
  map_public_ip_on_launch = false

  tags = {
    Name     = "private-eu-west-2c"
    Service  = "Private Subnet"
    Location = "London"
  }
}

# app4 - Sao Paolo Public Subnets

resource "aws_subnet" "public-sa-east-1a" {
  vpc_id                  = aws_vpc.app4-vpc.id
  cidr_block              = "10.233.1.0/24"
  availability_zone       = "sa-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name     = "sa-east-1a"
    Service  = "Public Subnet"
    Location = "Sao Paolo"
  }
}

resource "aws_subnet" "public-sa-east-1c" {
  vpc_id                  = aws_vpc.app4-vpc.id
  cidr_block              = "10.233.2.0/24"
  availability_zone       = "sa-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name     = "sa-east-1c"
    Service  = "Public Subnet"
    Location = "Sao Paolo"
  }
}

# app4 - Sao Paolo Private Subnets

resource "aws_subnet" "private-sa-east-1a" {
  vpc_id                  = aws_vpc.app4-vpc.id
  cidr_block              = "10.233.11.0/24"
  availability_zone       = "sa-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name     = "sa-east-1a"
    Service  = "Private Subnet"
    Location = "Sao Paolo"
  }
}

resource "aws_subnet" "private-sa-east-1c" {
  vpc_id                  = aws_vpc.app4-vpc.id
  cidr_block              = "10.233.12.0/24"
  availability_zone       = "sa-east-1c"
  map_public_ip_on_launch = false

  tags = {
    Name     = "sa-east-1c"
    Service  = "Private Subnet"
    Location = "Sao Paolo"
  }
}

# app5 - Australia Public Subnets

resource "aws_subnet" "public-ap-southeast-2a" {
  vpc_id                  = aws_vpc.app5-vpc.id
  cidr_block              = "10.234.1.0/24"
  availability_zone       = "ap-southeast-2a"
  map_public_ip_on_launch = true

  tags = {
    Name     = "ap-southeast-2a"
    Service  = "Public Subnet"
    Location = "Sydney"
  }
}

resource "aws_subnet" "public-ap-southeast-2c" {
  vpc_id                  = aws_vpc.app5-vpc.id
  cidr_block              = "10.234.2.0/24"
  availability_zone       = "ap-southeast-2c"
  map_public_ip_on_launch = true

  tags = {
    Name     = "ap-southeast-2c"
    Service  = "Public Subnet"
    Location = "Sydney"
  }
}

# app5 - Australia Private Subnets

resource "aws_subnet" "private-ap-southeast-2a" {
  vpc_id                  = aws_vpc.app5-vpc.id
  cidr_block              = "10.234.11.0/24"
  availability_zone       = "ap-southeast-2a"
  map_public_ip_on_launch = false

  tags = {
    Name     = "ap-southeast-2a"
    Service  = "Private Subnet"
    Location = "Sydney"
  }
}

resource "aws_subnet" "private-ap-southeast-2c" {
  vpc_id                  = aws_vpc.app5-vpc.id
  cidr_block              = "10.234.12.0/24"
  availability_zone       = "ap-southeast-2c"
  map_public_ip_on_launch = false

  tags = {
    Name     = "ap-southeast-2c"
    Service  = "Private Subnet"
    Location = "Sydney"
  }
}

# app6 - Hong Kong Public Subnets

resource "aws_subnet" "public-ap-east-1a" {
  vpc_id                  = aws_vpc.app6-vpc.id
  cidr_block              = "10.235.1.0/24"
  availability_zone       = "ap-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name     = "ap-east-1a"
    Service  = "Public Subnet"
    Location = "Hong Kong SAR"
  }
}

resource "aws_subnet" "public-ap-east-1c" {
  vpc_id                  = aws_vpc.app6-vpc.id
  cidr_block              = "10.235.2.0/24"
  availability_zone       = "ap-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name     = "ap-east-1c"
    Service  = "Public Subnet"
    Location = "Hong Kong SAR"
  }
}

# app6 - Hong Kong Private Subnets

resource "aws_subnet" "private-ap-east-1a" {
  vpc_id                  = aws_vpc.app6-vpc.id
  cidr_block              = "10.235.11.0/24"
  availability_zone       = "ap-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name     = "ap-east-1a"
    Service  = "Private Subnet"
    Location = "Hong Kong SAR"
  }
}

resource "aws_subnet" "private-ap-east-1c" {
  vpc_id                  = aws_vpc.app6-vpc.id
  cidr_block              = "10.235.12.0/24"
  availability_zone       = "ap-east-1c"
  map_public_ip_on_launch = false

  tags = {
    Name     = "ap-east-1c"
    Service  = "Private Subnet"
    Location = "Hong Kong SAR"
  }
}

# app7 - California Public Subnets

resource "aws_subnet" "public-us-west-1a" {
  vpc_id                  = aws_vpc.app7-vpc.id
  cidr_block              = "10.236.1.0/24"
  availability_zone       = "us-west-1a"
  map_public_ip_on_launch = true

  tags = {
    Name     = "us-west-1a"
    Service  = "Public Subnet"
    Location = "N. California"
  }
}

resource "aws_subnet" "public-us-west-1c" {
  vpc_id                  = aws_vpc.app7-vpc.id
  cidr_block              = "10.236.2.0/24"
  availability_zone       = "us-west-1c"
  map_public_ip_on_launch = true

  tags = {
    Name     = "us-west-1c"
    Service  = "Public Subnet"
    Location = "N. California"
  }
}

# app7 - California Private Subnets

resource "aws_subnet" "private-us-west-1a" {
  vpc_id                  = aws_vpc.app7-vpc.id
  cidr_block              = "10.236.11.0/24"
  availability_zone       = "us-west-1a"
  map_public_ip_on_launch = false

  tags = {
    Name     = "us-west-1a"
    Service  = "Private Subnet"
    Location = "N. California"
  }
}

resource "aws_subnet" "private-us-west-1c" {
  vpc_id                  = aws_vpc.app7-vpc.id
  cidr_block              = "10.236.12.0/24"
  availability_zone       = "us-west-1c"
  map_public_ip_on_launch = false

  tags = {
    Name     = "us-west-1c"
    Service  = "Private Subnet"
    Location = "N. California"
  }
}
