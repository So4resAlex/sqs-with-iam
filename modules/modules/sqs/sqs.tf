resource "aws_sqs_queue" "terraform_queue" {
  name                       = var.queue_name
  delay_seconds              = 20
  visibility_timeout_seconds = 60
  receive_wait_time_seconds  = 20
  message_retention_seconds  = 1209600
  max_message_size           = 2048
  tags = {
    Eviroment = "Test"
  }
}