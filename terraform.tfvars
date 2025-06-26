region = "ap-south-1"
vpc-cidr-block = "192.168.0.0"
vpc-cidr-netmask = 16
ec2-instance-type = "t2.micro"
sg-inbound-ports = [ 22, 80, 443, 8080, 8081 ] # SSH, HTTP, HTTPS, Tomcat, Nexus