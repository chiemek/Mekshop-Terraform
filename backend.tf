terraform {
  backend "s3" {
    bucket = "emeka-terraform-state-file"
    key    = "envs/prod/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = "terraform-locks"  # optional but recommended
  }
}
