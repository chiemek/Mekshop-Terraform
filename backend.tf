terraform {
  backend "s3" {
    bucket = "emeka-terraform-state-file"
    key    = "envs/prod/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-lock"  # optional but recommended
  }
}
