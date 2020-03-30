output "vpc_id"{
  value = aws_vpc.main.id
}
output "private_1_subnet_id" {
  value = aws_subnet.private_1.id
}
output "private_2_subnet_id" {
  value = aws_subnet.private_2.id
}
output "public_1_subnet_id" {
  value = aws_subnet.public_1.id
}
output "public_2_subnet_id" {
  value = aws_subnet.public_2.id
}
