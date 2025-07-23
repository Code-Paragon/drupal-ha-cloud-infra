output "vpc_id" {
  value = aws_vpc.main.id
}

output "drupal_public_ips" {
  value = [for instance in aws_instance.drupal_server : instance.public_ip]
}

output "alb_dns" {
  value = aws_lb.drupal_alb.dns_name
}

output "rds_endpoint" {
  value = aws_db_instance.drupal_db.endpoint
  sensitive = true
}