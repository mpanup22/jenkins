resource "aws_volume_attachment" "ebs_att" {
device_name = "/dev/sdh"
volume_id = "${aws_ebs_volume.pract.id}"
instance_id = "${aws_instance.firstmachine.id}"
 }
data "aws_kms_key" "kmskey" {
    key_id = "alias/DEV_KMS_KEY"
    }

resource "aws_ebs_volume" "pract" {
  availability_zone = "us-east-2a"
  size              = 20

  tags = {
    Name = "ebs"
  }
  encrypted       = true
  kms_key_id = "${data.aws_kms_key.kmskey.arn}"
}
