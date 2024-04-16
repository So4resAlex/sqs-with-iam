output "sender_user_arn" {
    value = aws_iam_user.sender.arn
}

output "receiver_user_arn" {
    value = aws_iam_user.receiver.arn
}

