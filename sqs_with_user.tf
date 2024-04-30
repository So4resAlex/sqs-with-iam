resource "aws_iam_user" "sender" {
  count = var.create_sender ? 1 : 0
  name  = var.sender_user_name
  tags = {
    Enviroment = var.enviroment
  }
}

resource "aws_iam_user" "receiver" {
  count = var.create_receiver ? 1 : 0
  name  = var.receiver_user_name
  tags = {
    Enviroment = var.enviroment
  }
}

resource "aws_sqs_queue" "terraform_queue" {
  name                       = var.queue_name
  delay_seconds              = 20
  visibility_timeout_seconds = 60
  receive_wait_time_seconds  = 20
  message_retention_seconds  = 1209600
  max_message_size           = 2048
  redrive_policy = var.create_dlq ? jsonencode({
    deadLetterTargetArn = aws_sqs_queue.terraform_dlq[0].arn
    maxReceiveCount     = 5
  }) : null
  tags = {
    Environment = var.enviroment
  }
}

resource "aws_sqs_queue_policy" "terraform_queue_policy" {
  queue_url = aws_sqs_queue.terraform_queue.url

  policy = jsonencode({
    Version = "2012-10-17"
    Id      = var.policy_sqs_name
    Statement = [
      {
        Effect    = "Allow"
        Principal = { AWS = var.create_receiver ? aws_iam_user.receiver[0].arn : var.receiver_user_arn }
        Action = [
          "sqs:ChangeMessageVisibility",
          "sqs:DeleteMessage",
          "sqs:ReceiveMessage",
          "sqs:GetQueueUrl",
          "sqs:GetQueueAttributes"
        ]
        Resource = aws_sqs_queue.terraform_queue.arn
      },
      {
        Effect    = "Allow"
        Principal = { AWS = var.create_sender ? aws_iam_user.sender[0].arn : var.sender_user_arn }
        Action = [
          "sqs:SendMessage",
          "sqs:GetQueueUrl",
          "sqs:GetQueueAttributes"
        ]
        Resource = aws_sqs_queue.terraform_queue.arn
      }
    ]
  })
}

resource "aws_sqs_queue" "terraform_dlq" {
  count = var.create_dlq ? 1 : 0

  name                      = "${var.queue_name}-dlq"
  message_retention_seconds = 1209600
  tags = {
    Environment = var.enviroment
  }
}
