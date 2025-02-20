module "Hello" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-rds.git//modules/db_subnet_group"
    name = "custom-db-subnet-group"
    subnet_ids = ["subnet-08b9bb7046eb5e226", "subnet-0881f2e3170fcb8a8"]
}
