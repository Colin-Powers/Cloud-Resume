data "archive_file" "lambda" {
    type = "zip"
    source_file = "lambda.py"
    output_path = "lambda_function_payload.zip"
}

# Create a lambda function that will update the visitor count when the page is visited
resource "aws_lambda_function" "Resume" {
    filename = lambda_function_payload.zip
    function_name = "Resume"
    
  
}