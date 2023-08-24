resource "aws_dynamodb_table" "db" {
  name           = "location"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "unicornID"
  range_key      = "city"
  

  server_side_encryption {
    enabled = true
  }

  point_in_time_recovery {
    enabled = true
  }

  attribute {
    name = "unicornID"
    type = "S"
  }

  attribute {
    name = "city"
    type = "S"
  }
}
