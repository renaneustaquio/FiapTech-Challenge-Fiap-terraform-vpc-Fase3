output "mcking_vpc" {
  value = aws_vpc.mcking_vpc.id
}

output "mcking_subnet_publica_ids" {
  value = [
    aws_subnet.mcking_subnet_publica_1.id,
    aws_subnet.mcking_subnet_publica_2.id
  ]
}

output "mcking_subnet_privada_ids" {
  value = [
    aws_subnet.mcking_subnet_privada_1.id,
    aws_subnet.mcking_subnet_privada_2.id
  ]
}

output "mcking_security_group" {
  value = aws_security_group.mcking_security_group.id
}

output "mckingapi_lb" {
  value = aws_lb.mckingapi_lb.dns_name
}

output "lambda_arn" {
  value = aws_lambda_function.mckingapi_lambda.arn
}
