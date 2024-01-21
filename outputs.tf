output "vpc_id" {
    value = aws_vpc.min_vpc.id
}

output "elb_load_balancer_dns_name" {
    value = aws_lb.min-load-balancer.dns_name
}