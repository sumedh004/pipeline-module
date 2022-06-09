resource "aws_sns_topic" "manual_approval" {
  name = "manual_approval"
}


resource "aws_sns_topic_subscription" "email" {
  topic_arn              = aws_sns_topic.manual_approval.arn
  protocol               = "email"
  endpoint               = "sumedhvartak@outlook.com"
  #endpoint_auto_confirms = true


}
