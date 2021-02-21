resource "aws_iam_role_policy" "tirzah_lambda_policy" {
  name   = "tirzah_lambda_policy"
  role   = aws_iam_role.tirzah_lambda_role.id
  policy = file("IAM/lambda_policy.json")
}

resource "aws_iam_role" "tirzah_lambda_role" {
  name               = "tirzah_lambda_role"
  assume_role_policy = file("IAM/lambda_assume_role_policy.json")
}