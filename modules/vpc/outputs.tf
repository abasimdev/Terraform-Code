
# Output vpc id to use it in Root module to create other resources
output "OnlineBS-vpc-id" {
  value = aws_vpc.onlineBS-vpc.id
}

# Output subnet id to use it in Root module to create other resources
output "subnet-id-public-1-a" {
  value = element([for subnet-id in aws_subnet.onlineBS-public-subnets : subnet-id.id], 0) # Using the element function
}

output "subnet-id-public-1-b" {
  value = [for subnet-id in aws_subnet.onlineBS-public-subnets : subnet-id.id][1] # Directly passing the index without using element function
}