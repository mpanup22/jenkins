terraform {
 backend s3 {
 encrypt = true
 bucket = "pract-backend"
 dynamodb_table = "test"
 region = "us-east-2"
 key = "terraform.tfstate"
 }
}
