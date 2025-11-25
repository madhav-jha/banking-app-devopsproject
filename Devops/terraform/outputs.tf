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

output "jenkins_master_public_ip" {
  value = aws_instance.jenkins_master.public_ip
}

output "jenkins_agent_public_ip" {
  value = aws_instance.jenkins_agent.public_ip
}

output "app_server_public_ip" {
  value = aws_instance.app_server.public_ip
}

output "monitoring_server_public_ip" {
  value = aws_instance.monitoring_server.public_ip
}
