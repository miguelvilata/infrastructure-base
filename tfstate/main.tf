# resource "aws_kms_key" "s3key" {
#   description             = "This key is used to encrypt bucket objects"
#   deletion_window_in_days = 10
# }
resource "aws_s3_bucket" "bucket" {
  bucket = "terraform-${var.project}-${var.env}"
  acl    = "private"

  versioning {
    enabled = true
  }
  # server_side_encryption_configuration {
  #   rule {
  #     apply_server_side_encryption_by_default {
  #       kms_master_key_id = aws_kms_key.s3key.arn
  #       sse_algorithm     = "aws:kms"
  #     }
  #   }
  # }

  tags = {
    Name        = "terraform-${var.project}-${var.env}"
    Environment = var.env
    Creator     = var.creator
    Terraform   = var.terraform
  }
}

# resource "aws_s3_bucket_public_access_block" "public_access_block" {
#   bucket              = aws_s3_bucket.bucket.id
#   block_public_acls   = true
#   block_public_policy = true
# }

##CREATE DYNAMODB TABLE PARA BLOQUEAR EL ESTADO
resource "aws_dynamodb_table" "terraform_state_locking" {
  name           = "terraform_state_locking-${var.project}-${var.env}"
  hash_key       = "LockID"
  read_capacity  = 5
  write_capacity = 5

  point_in_time_recovery {
    enabled = true
  }

  server_side_encryption {
    enabled = true
  }

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "terraform-${var.project}-${var.env}"
    Environment = var.env
    Creator     = var.creator
    Terraform   = var.terraform
  }
}
