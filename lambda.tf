resource "aws_lambda_function" "tirzah_lambda_lab" {
  
  function_name = "tirzah-hello"
  s3_bucket     = "tirzah-lambda-template-bucket"
  s3_key        = "hello.zip"
  role          = aws_iam_role.tirzah_lambda_role.arn
  handler       = "hello.handler"
  runtime       = "nodejs12.x"
}
