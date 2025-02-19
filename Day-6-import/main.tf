resource "aws_instance" "Hello" {

  ami="ami-0ddfba243cbee3768"
  instance_type = "t2.micro"
  key_name = "sainikudu"
  tags = {
    Name = "dev"
  }
}