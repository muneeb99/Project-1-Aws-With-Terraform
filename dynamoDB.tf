resource "aws_dynamodb_table" "Employee_Data" {
    name = var.table_name
    billing_mode = "PROVISIONED"
    read_capacity = "2"
    write_capacity = "2"
    hash_key = "emp_id"
    range_key = "Name"
    point_in_time_recovery {
       enabled = true
    }

    attribute {
      name  = "emp_id"
      type = "S"
    }
    attribute {
      
      name = "Name"
      type = "S"
    }
    ttl {

      attribute_name = "TimeToExist"
      enabled = true

    }

}

resource "aws_dynamodb_table_item" "item1" {
  table_name = aws_dynamodb_table.Employee_Data.id
  hash_key =aws_dynamodb_table.Employee_Data.hash_key
  range_key = aws_dynamodb_table.Employee_Data.range_key
  item = <<ITEM
    {
      "emp_id" : {"S": "101"},
      "Name" : {"S":"MUNEEB"},
      "Salary" : {"S" : "40000"},
      "address": {"S" : "Multan"} 

     }
    ITEM
}
resource "aws_dynamodb_table_item" "item2" {
  table_name = aws_dynamodb_table.Employee_Data.id
  hash_key =aws_dynamodb_table.Employee_Data.hash_key
  range_key = aws_dynamodb_table.Employee_Data.range_key
  item = <<ITEM
    {
      "emp_id" : {"S": "102"},
      "Name" : {"S":"ali"},
      "Salary" : {"S" : "5000"}

     }
    ITEM
}
resource "aws_s3_bucket" "my-bucket" {
  bucket_prefix = "dynamo"
  force_destroy = true
}


resource "aws_dynamodb_table_export" "db-export" {
  table_arn = aws_dynamodb_table.Employee_Data.arn
  s3_bucket = aws_s3_bucket.my-bucket.id
}







