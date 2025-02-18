#Creation of server
resource "aws_instance" "cust" {
ami = "ami-0ddfba243cbee3768"
instance_type = "t2.micro"
key_name = "sainikudu"
subnet_id = aws_subnet.cust.id
vpc_security_group_ids = [aws_security_group.allow_tls.id]
tags = {
  Name = "cust-ec2"
} 
}