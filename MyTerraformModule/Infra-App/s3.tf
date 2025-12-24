resource "aws_s3_bucket" "terraform_state" {
  bucket = "${var.env}-${var.bucket_name}"
  force_destroy = true 

  tags = {
    Name = "${var.env}-${var.bucket_name}"
    Enironment = var.env
  }
}
