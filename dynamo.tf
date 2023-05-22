# Create DynamoDB table to hold resume visitor count
resource "aws_dynamodb_table" "Resume" {
    name="Resume"
    billing_mode = "PROVISIONED"
    read_capacity = "30"
    write_capacity = "30"

    attribute {
      name="Resume_Count"
      type="N"
    }
    hash_key = "Resume_Count"
  
}

# Create an item for the table that will track visitor count
resource "aws_dynamodb_table_item" "Visitor" {
  table_name = aws_dynamodb_table.Resume.name
  hash_key = aws_dynamodb_table.Resume.hash_key

  item = <<ITEM
    {
      "Resume_Count": {"N": "0"}
    }
  ITEM
}