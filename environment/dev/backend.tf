# Remote state configuration is intentionally kept as a template until the
# bootstrap S3 bucket exists.
#
# After bootstrap, put the backend block from versions.tf here and run:
#
# terraform init -migrate-state
#
# Do not commit AWS credentials or database passwords to this repository.
