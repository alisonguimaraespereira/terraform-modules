resource "aws_lambda_event_source_mapping" "sqs" {
  event_source_arn = "arn:aws:sqs:us-east-1:171518999593:${var.sqs_name}"
  function_name    = "${var.function_arn}"
}

resource "aws_lambda_permission" "sqs_event" {
  statement_id  = "AllowExecutionFromSQS"
  action        = "lambda:InvokeFunction"
  function_name = "${var.function_name}"
  principal     = "sqs.amazonaws.com"
  source_arn    = "${aws_lambda_event_source_mapping.sqs.event_source_arn}"
}