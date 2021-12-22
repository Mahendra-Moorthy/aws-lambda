data "archive_file" "init" {
  type        = "zip"
  source_file = "helloworld.py"
  output_path = "outputs/helloworld.zip"
}
resource "aws_lambda_function" "test_lambda" {
  filename      = "outputs/helloworld.zip"
  function_name = "helloworld"
  role          = aws_iam_role.test_role.arn
  handler       = "helloworld.hello"

 
  runtime = "python3.7"

 
}
