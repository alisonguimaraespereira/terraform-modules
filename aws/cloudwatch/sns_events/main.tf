resource "aws_sns_topic_subscription" "user_updates_lambda_target" {
  topic_arn = "arn:aws:sns:us-east-1:171518999593:${var.topic_name}"
  protocol  = "lambda"
  endpoint  = "${var.function_arn}"
}

resource "aws_lambda_permission" "sns_event" {
  statement_id   = "AllowExecutionFromSNS"
  action         = "lambda:InvokeFunction"
  function_name  = "${var.function_arn}"
  principal      = "sns.amazonaws.com"
  source_arn     = "arn:aws:sns:us-east-1:171518999593:${var.topic_name}"
  source_account = "171518999593"
}