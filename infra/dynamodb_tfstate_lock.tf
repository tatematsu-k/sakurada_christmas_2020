resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "terraform_state_lock_sakurada"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
