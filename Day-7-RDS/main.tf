resource "aws_db_instance" "default" {
  allocated_storage       = 10
  db_name                 = "mydb"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  username                = "Dharma"
  password                = "Dharma121"
  parameter_group_name    = "default.mysql8.0"
  skip_final_snapshot = true
  multi_az = true
  db_subnet_group_name =  aws_db_subnet_group.sub-grp.id
}

resource "aws_db_subnet_group" "sub-grp" {
  name       = "custom_subnets"
  subnet_ids = ["subnet-08b9bb7046eb5e226", "subnet-0881f2e3170fcb8a8"]

  tags = {
    Name = "My DB subnet group"
  }
}