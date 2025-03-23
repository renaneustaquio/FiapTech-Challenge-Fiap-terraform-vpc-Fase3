resource "aws_api_gateway_rest_api" "mckingapi_api" {
  name        = "mckingapi-api"
  description = "API para expor a aplicação mckingapi via API Gateway"
}

resource "aws_api_gateway_resource" "mckingapi_resource" {
  rest_api_id = aws_api_gateway_rest_api.mckingapi_api.id
  parent_id   = aws_api_gateway_rest_api.mckingapi_api.root_resource_id
  path_part   = "mckingapi"
}

resource "aws_api_gateway_authorizer" "cognito_authorizer" {
  name            = "CognitoAuthorizer"
  rest_api_id     = aws_api_gateway_rest_api.mckingapi_api.id
  type            = "COGNITO_USER_POOLS"
  provider_arns   = [aws_cognito_user_pool.mcking_user_pool.arn]
  identity_source = "method.request.header.Authorization"
}

resource "aws_api_gateway_method" "mckingapi_method" {
  rest_api_id   = aws_api_gateway_rest_api.mckingapi_api.id
  resource_id   = aws_api_gateway_resource.mckingapi_resource.id
  http_method   = "ANY"
  authorization = "COGNITO_USER_POOLS"
  authorizer_id = aws_api_gateway_authorizer.cognito_authorizer.id
}

resource "aws_api_gateway_integration" "mckingapi_lambda_integration" {
  rest_api_id             = aws_api_gateway_rest_api.mckingapi_api.id
  resource_id             = aws_api_gateway_resource.mckingapi_resource.id
  http_method             = aws_api_gateway_method.mckingapi_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/${aws_lambda_function.mckingapi_lambda.arn}/invocations"
}

resource "aws_api_gateway_deployment" "mckingapi_deployment" {
  rest_api_id = aws_api_gateway_rest_api.mckingapi_api.id

  depends_on = [
    aws_api_gateway_method.mckingapi_method,
    aws_api_gateway_integration.mckingapi_lambda_integration,
    aws_api_gateway_authorizer.cognito_authorizer
  ]
}

resource "aws_api_gateway_stage" "mckingapi_stage" {
  rest_api_id   = aws_api_gateway_rest_api.mckingapi_api.id
  stage_name    = "prod"
  deployment_id = aws_api_gateway_deployment.mckingapi_deployment.id
}