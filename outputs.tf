
output "vpc_id" {
  value = aws_vpc.min_vpc.id
}

output "elb_target_group_arn" {
  value = aws_lb_target_group.min-target-group.arn
}

output "load_balancer_security_group" {
  value = aws_security_group.min-load_balancer_sg.id
}
output "elb_load_balancer_dns_name" {
  value = aws_lb.min-load-balancer.dns_name
}

output "elastic_load_balancer_zone_id" {
  value = aws_lb.min-load-balancer.zone_id
}

output "instance_security_group" {
  value = aws_security_group.min-security-grp-rule.id
}

output "subnet1" {
  value = aws_subnet.min-public-subnet1.id
}

output "subnet2" {
  value = aws_subnet.min-public-subnet2.id

}
