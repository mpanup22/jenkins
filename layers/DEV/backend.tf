terraform {
 backend s3 {
 encrypt = true
 bucket = "pract-backend"
 dynamodb_table = "terraform-state-lock-dynamo"
 region = "us-east-2"
 key = "terraform.tfstate"
 }
}
