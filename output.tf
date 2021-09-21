output "instance_public_dns" {
  description = "cohort 5 instance public dns "
  value       = aws_instance.web.public_dns
}

output "instance_public_ip" {
  description = "cohort 5 instance public ip"
  value       = aws_instance.web.public_ip
}

output "instance_private_ip" {
  description = "cohort 5 instance private ip"
  value       = aws_instance.web.private_ip
}
