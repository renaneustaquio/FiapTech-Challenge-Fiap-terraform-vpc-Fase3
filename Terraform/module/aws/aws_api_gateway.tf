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