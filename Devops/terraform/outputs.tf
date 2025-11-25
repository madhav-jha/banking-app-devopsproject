output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "public_subnet_1_id" {
  value = aws_subnet.public_subnet_1.id
}

output "public_subnet_2_id" {
  value = aws_subnet.public_subnet_2.id
}

output "security_group_id" {
  value = aws_security_group.main_sg.id
}

output "jenkins_master_eip" {
  value = aws_eip.jenkins_master_eip.public_ip
}

output "jenkins_agent_eip" {
  value = aws_eip.jenkins_agent_eip.public_ip
}

output "app_server_eip" {
  value = aws_eip.app_server_eip.public_ip
}

output "monitoring_server_eip" {
  value = aws_eip.monitoring_server_eip.public_ip
}