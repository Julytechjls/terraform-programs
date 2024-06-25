output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "vpc_arn" {
  value = aws_vpc.my_vpc.arn
}

output "subnet_id" {
  value = aws_subnet.my_subnet.id
}

output "ig_id" {
  value = aws_internet_gateway.my_ig.id
}

output "security_group_id" {
  value = aws_security_group.my_securityGroup.id
}
