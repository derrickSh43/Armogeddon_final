# Transit Gateway ONE in each region

resource "aws_ec2_transit_gateway" "tgw_ap_northeast_1" {
  provider    = aws.tokyo
  description = "Transit Gateway for ap-northeast-1 Tokyo"
}

resource "aws_ec2_transit_gateway" "tgw_us_east_1" {
  provider    = aws.new_york
  description = "Transit Gateway for us-east-1 New York"
}

resource "aws_ec2_transit_gateway" "tgw_eu_west_2" {
  provider    = aws.london
  description = "Transit Gateway for eu-west-2 London"
}

resource "aws_ec2_transit_gateway" "tgw_sa_east_1" {
  provider    = aws.sao_paolo
  description = "Transit Gateway for sa-east-1 Sao Paulo"
}

resource "aws_ec2_transit_gateway" "tgw_ap_southeast_2" {
  provider    = aws.sydney
  description = "Transit Gateway for ap-southeast-2 Sydney"
}

resource "aws_ec2_transit_gateway" "tgw_ap_east_1" {
  provider    = aws.hong_kong
  description = "Transit Gateway for ap-east-1 Hong Kong"
}

resource "aws_ec2_transit_gateway" "tgw_us_west_1" {
  provider    = aws.california
  description = "Transit Gateway for us-west-1 California"
}

# Inter-region peering connections
resource "aws_ec2_transit_gateway_peering_attachment" "tokyo_to_new_york" {
  provider                = aws.tokyo
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_ap_northeast_1.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_us_east_1.id
  peer_region             = "us-east-1"
}

resource "aws_ec2_transit_gateway_peering_attachment" "new_york_to_tokyo" {
  provider                = aws.new_york
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_us_east_1.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_ap_northeast_1.id
  peer_region             = "ap-northeast-1"
}

resource "aws_ec2_transit_gateway_peering_attachment" "tokyo_to_london" {
  provider                = aws.tokyo
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_ap_northeast_1.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_eu_west_2.id
  peer_region             = "eu-west-2"
}

resource "aws_ec2_transit_gateway_peering_attachment" "london_to_tokyo" {
  provider                = aws.london
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_eu_west_2.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_ap_northeast_1.id
  peer_region             = "ap-northeast-1"
}

resource "aws_ec2_transit_gateway_peering_attachment" "tokyo_to_sao_paolo" {
  provider                = aws.tokyo
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_ap_northeast_1.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_sa_east_1.id
  peer_region             = "sa-east-1"
}

resource "aws_ec2_transit_gateway_peering_attachment" "sao_paolo_to_tokyo" {
  provider                = aws.sao_paolo
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_sa_east_1.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_ap_northeast_1.id
  peer_region             = "ap-northeast-1"
}

resource "aws_ec2_transit_gateway_peering_attachment" "tokyo_to_sydney" {
  provider                = aws.tokyo
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_ap_northeast_1.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_ap_southeast_2.id
  peer_region             = "ap-southeast-2"
}

resource "aws_ec2_transit_gateway_peering_attachment" "sydney_to_tokyo" {
  provider                = aws.sydney
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_ap_southeast_2.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_ap_northeast_1.id
  peer_region             = "ap-northeast-1"
}

resource "aws_ec2_transit_gateway_peering_attachment" "tokyo_to_hong_kong" {
  provider                = aws.tokyo
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_ap_northeast_1.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_ap_east_1.id
  peer_region             = "ap-east-1"
}

resource "aws_ec2_transit_gateway_peering_attachment" "hong_kong_to_tokyo" {
  provider                = aws.hong_kong
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_ap_east_1.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_ap_northeast_1.id
  peer_region             = "ap-northeast-1"
}

resource "aws_ec2_transit_gateway_peering_attachment" "tokyo_to_california" {
  provider                = aws.tokyo
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_ap_northeast_1.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_us_west_1.id
  peer_region             = "us-west-1"
}

resource "aws_ec2_transit_gateway_peering_attachment" "california_to_tokyo" {
  provider                = aws.california
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_us_west_1.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_ap_northeast_1.id
  peer_region             = "ap-northeast-1"
}
