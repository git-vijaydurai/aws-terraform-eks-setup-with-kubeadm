output "net_id" {
  value = aws_instance.nat_ec2.primary_network_interface_id
}