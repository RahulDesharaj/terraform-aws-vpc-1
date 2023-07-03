output "vpc_id" {
  value = aws_vpc.main.id
}


output "public_sunet-ids" {
  value = aws_subnet.public[*].id
}

