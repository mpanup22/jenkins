data "aws_kms_key" "kmskey" {
    key_id = "alias/DEV_KMS_KEY"
    }

resource "aws_efs_file_system" "efs" {
 creation_token = "EFS_pract"
 encrypted       = true
 kms_key_id = "${data.aws_kms_key.kmskey.arn}"
}
//resource "aws_efs_mount_target" "mounting" {
 //file_system_id = "${aws_efs_file_system.efs.id}"
 //subnet_id = "${aws_subnet.tsubnet.id}"
//}
//resource "aws_vpc" "terraform_vpc" {
 //cidr_block = "172.31.0.0/16"
//}
//resource "aws_subnet" "tsubnet" {
 //vpc_id = "${aws_vpc.terraform_vpc.id}"
 //availability_zone = "${var.availability_zone}"
 //cidr_block = "172.31.0.0/24"
//}
