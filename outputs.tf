output "sender_user_arn_output" {
  value = aws_iam_user.sender[0].arn
}

output "receiver_user_arn_output" {
  value = aws_iam_user.receiver[0].arn
}

