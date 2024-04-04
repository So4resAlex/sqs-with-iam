resource "aws_iam_user" "terraform_iam_user" {
  name = var.iam_name_user
  tags = {
    Eviroment = "Test"
  }
}
output "iam_arn" {
  value = aws_iam_user.terraform_iam_user.arn
}