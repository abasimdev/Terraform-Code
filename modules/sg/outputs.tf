
# Output this value to use it in Root module to create other resources
output "sg-id" {
  value = aws_security_group.OnlineBS-sg.id
}