
module "s3" {
  source = "./modules/aws/s3"
  s3_bucket_name = var.s3_bucket_name
}

module "dynamodb" {
  source = "./modules/aws/dynamodb"
  dynamodb_table_name = var.dynamodb_table_name
}
