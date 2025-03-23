data "aws_caller_identity" "current" {}

resource "null_resource" "download_lambda_zip" {
  provisioner "local-exec" {
    command = "curl -L -o ${path.module}/lambda_function.zip https://github.com/renaneustaquio/FiapTech-Challenge-Fiap-lambda-Fase3/releases/download/latest/lambda_function.zip"
  }
}

resource "aws_lambda_function" "mckingapi_lambda" {
  filename      = "${path.module}/lambda_function.zip"
  function_name = "CPFValidation"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.9"
  role          = data.aws_iam_role.mcking_role.arn

  depends_on = [null_resource.download_lambda_zip]
}

resource "aws_lambda_permission" "allow_apigateway_invoke" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.mckingapi_lambda.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "arn:aws:execute-api:us-east-1:${data.aws_caller_identity.current.account_id}:${aws_api_gateway_rest_api.mckingapi_api.id}/*"
  depends_on = [aws_api_gateway_rest_api.mckingapi_api]
}
