resource "aws_sqs_queue" "tirzah_queue_deadletter" {
  name                      = "tirzah-queue-deadletter"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10

  tags = {
    Environment = "lab-dlq"
  }
}

resource "aws_sqs_queue" "tirzah_queue" {
  name                      = "tirzah-queue"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.tirzah_queue_deadletter.arn
    maxReceiveCount     = 4
  })

  tags = {
    Environment = "lab"
  }
}