resource "aws_api_gateway_rest_api" "mckingapi_api" {
  name        = "mckingapi-api"
  description = "API para expor a aplicação mckingapi via API Gateway"
}