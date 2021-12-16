output "aws_vpc"{
  value="${aws_vpc.r21vpc.id}"
}

# output "subnet_id" {
#   value = "${aws_subnet.r21subnet.id}"
# }

output "subnet_id" {
value=aws_subnet.r21subnet[each.key]
}
