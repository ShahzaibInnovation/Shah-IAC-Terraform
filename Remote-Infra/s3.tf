resource "aws_s3_bucket" "terraform_state" {
  bucket = "my-terraform-state-bucket-13-12-2025"
  force_destroy = true 

  tags = {
    Name = "Terraform State Bucket"
  }
}
