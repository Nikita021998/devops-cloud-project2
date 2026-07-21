output "instance_id" {
  description = "ID of the EC2 app server instance"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 app server"
  value       = aws_instance.app_server.public_ip
}

output "vpc_id" {
  description = "ID of the VPC created for this project"
  value       = aws_vpc.main.id
}

output "security_group_id" {
  description = "ID of the security group attached to the app server"
  value       = aws_security_group.app_sg.id
}
