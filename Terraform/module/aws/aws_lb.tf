resource "aws_lb" "mckingapi_lb" {
  name               = "mckingapi-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.mcking_security_group.id]
  subnets            = [
    aws_subnet.mcking_subnet_publica_1.id,
    aws_subnet.mcking_subnet_publica_2.id
  ]  
  idle_timeout = 60
  
  tags = {
    Name = "mckingapi-lb"
  }
}