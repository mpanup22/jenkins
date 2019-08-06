data "aws_kms_key" "kmskey" {
    key_id = "alias/DEV_KMS_KEY"
    }

resource "aws_s3_bucket_object" "s3bucket" {
  kms_key_id = "${data.aws_kms_key.kmskey.arn}"
  bucket = "devpract22"
  key = "outputs.txt"

}
 
