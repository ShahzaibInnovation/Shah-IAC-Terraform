# Dev Infrastructure :
module "Dev_InfraApp" {
  source = "./Infra-App"

  env         = "dev"
  bucket_name = "infra-app-bucket-23-12-2025"
  hash_key    = "StudentID"
  ami        = "ami-0b8d527345fdace59"
  instance_type = "t3.micro"
  instance_count = 1

}
# Staging Infrastructure :
module "Staging_InfraApp" {
  source = "./Infra-App"

  env         = "stg"
  bucket_name = "infra-app-bucket-23-12-2025"
  hash_key    = "StudentID"
  ami        = "ami-0b8d527345fdace59"
  instance_type = "t3.small"
  instance_count = 1

}
# Production Infrastructure :
module "Production_InfraApp" {
  source = "./Infra-App"

  env         = "prod"
  bucket_name = "infra-app-bucket-23-12-2025"
  hash_key    = "StudentID"
  ami        = "ami-0b8d527345fdace59"
  instance_type = "t3.micro"
  instance_count = 2


}
