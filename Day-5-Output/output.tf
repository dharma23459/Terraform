output "ip" {
    value = aws_instance.deva.public_ip
}

output "az" {
    value = aws_instance.deva.availability_zone
}

