resource "aws_cloudwatch_event_rule" "console" {
  name                = "${var.name}"
  schedule_expression = "${var.schedule_expression}"
}

resource "aws_cloudwatch_event_target" "lambda" {
  rule      = "${aws_cloudwatch_event_rule.console.name}"
  target_id = "${var.target_id}"
  arn       = "${var.arn}"
}

resource "aws_lambda_permission" "lambda_event" {
  count         = "${var.add_permission == true ? 1 : 0}"
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = "${var.function_name}"
  principal     = "events.amazonaws.com"
  source_arn    = "${aws_cloudwatch_event_rule.console.arn}"
}
