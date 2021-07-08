resource "aws_lambda_permission" "lambda_event" {
  statement_id   = "AllowExecutionFromCloudWatch"
  action         = "lambda:InvokeFunction"
  function_name  = "${var.lambda_arn}"
  principal      = "s3.amazonaws.com"
  source_arn     = "arn:aws:s3:::${var.bucket_id}"
  source_account = "171518999593"
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = "${var.bucket_id}"

  lambda_function {
    lambda_function_arn = "${var.lambda_arn}"
    events              = ["s3:ObjectCreated:*"]
  }
}