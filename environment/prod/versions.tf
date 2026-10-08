terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  # Uncomment after the state bucket has been bootstrapped.
  # backend "s3" {
  #   bucket       = "REPLACE_WITH_YOUR_TERRAFORM_STATE_BUCKET"
  #   key          = "3tier/prod/terraform.tfstate"
  #   region       = "ap-south-1"
  #   use_lockfile = true
  #   encrypt      = true
  # }
}
