resource "aws_iam_user" "admin-user" {
  name = "admin-user-${data.aws_caller_identity.current.account_id}"
  path = "/system/"

}

data "aws_iam_users" "users" {}

output "users_list" {
  value = data.aws_iam_users.users.names
}

output "users_qty" {
    value = length(data.aws_iam_users.users.names)
}