resource "aws_iam_role_policy" "test_policy" {
  name = "test_policy"
  role = aws_iam_role.test_role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = "${file("lambda_policy.json")}"
}

resource "aws_iam_role" "test_role" {
  name = "test_role"

  assume_role_policy = "${file("lambda_assume_policy.json")}"
}
