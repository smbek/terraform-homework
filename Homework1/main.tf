

# Creating users

resource "aws_iam_user" "us1" {
  name = "jeny"
}

resource "aws_iam_user" "us2" {
  name = "rose"
}

resource "aws_iam_user" "us3" {
  name = "lisa"
}

resource "aws_iam_user" "us4" {
  name = "jisoo"
}
resource "aws_iam_user" "us5" {
  name = "jihyo"
}

resource "aws_iam_user" "us6" {
  name = "sana"
}

resource "aws_iam_user" "us7" {
  name = "mono"
}

resource "aws_iam_user" "us8" {
  name = "dahyun"
}
resource "aws_iam_user" "us9" {
  name = "miyeon"
}
resource "aws_iam_user" "us10" {
  name = "mina"
}


# Creating groups
resource "aws_iam_group" "gr1" {
  name = "blackpink"
}

resource "aws_iam_group" "gr2" {
  name = "twice"
}

# Adding users to Blackpink
resource "aws_iam_group_membership" "team1" {
  name = "Blackpink-membership"

  users = [
    aws_iam_user.us1.name,
    aws_iam_user.us2.name,
    aws_iam_user.us3.name,
    aws_iam_user.us4.name,
    aws_iam_user.us9.name
  ]

  group = aws_iam_group.gr1.name
}

# Adding users to twice group
resource "aws_iam_group_membership" "team2" {
  name = "Twice-membership"

  users = [
    aws_iam_user.us5.name,
    aws_iam_user.us6.name,
    aws_iam_user.us7.name,
    aws_iam_user.us8.name,
    aws_iam_user.us10.name
  ]

  group = aws_iam_group.gr2.name
}

# import users which is created from aws by console
# terraform import aws_iam_user.us9 miyeon && terraform import aws_iam_user.us10 mina


