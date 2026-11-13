output "instance_id" {
  description = "ID of the EC2 web server."
  value       = aws_instance.web_server.id
}

output "instance_arn" {
  description = "ARN of the EC2 web server."
  value       = aws_instance.web_server.arn
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 web server."
  value       = aws_instance.web_server.public_ip
}
