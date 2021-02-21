resource "aws_lambda_event_source_mapping" "tirzah_event_source" {
  event_source_arn = aws_sqs_queue.tirzah_queue.arn
  function_name    = aws_lambda_function.tirzah_lambda_lab.arn
}