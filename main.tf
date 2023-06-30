resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = var.vpc_tags
}  



resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = var.igw_tags
} 


resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr)
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr[count.index]
  availability_zone = local.azs[count.index]
  tags = merge(
    var.public_subnet_tags,
    {
        Name = "${var.project_name}-public-${local.azs_lables[count.index]}"
    }
  )

}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id
    
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
   tags = merge(
      var.public_route_table_tags,
     {
       Name = "${var.project_name}-public"
     }
   )
   
} 

resource "aws_route_table_association" "public" {
  count = length(var.public_subnet_cidr)
  subnet_id      =element(aws_subnet.public[*].id,count.index) 
  route_table_id = aws_route_table.public.id
} 


#elastic and nat



resource "aws_eip" "nat" {
  domain = "vpc"
  tags = merge(
    var.eip_tags,
    {
      Name = var.project_name
    }
  )
}

resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id = "${aws_subnet.public[0].id}"
  tags =merge(
    var.nat_gateway_tags,
    {
      Name = var.project_name
    }
  )
}

