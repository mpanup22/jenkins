terraform {
  backend "s3" {
    bucket = "buckets22"
     key    = "s3/terraform.tfstate"
    region = "us-east-2"
  }
}


// terraform init -backend-config="access_key=AKIAUNBWVIC3N2DRCJLD" -backend-config="secret_key=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" 