output "vpc-id" {

  value = aws_vpc.kube_adm_vpc.id

}

output "subnet_1-id" {

  value = aws_subnet.subnet_1.id
}

output "subnet_2-id" {

  value = aws_subnet.subnet_2.id
}