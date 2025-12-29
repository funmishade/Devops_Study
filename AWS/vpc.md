## Concept
VPC - VIRTUAL PRIVATE CLOUD

AWS built data centres

How do you define the size of VPC? IP address range

subnet - spliting ip address for your subprojects.
Public subnet - user first access inside the vpc. It connects to the internet using the internet gateways.

Route table - defines how request should go PATH into the loadbalancer

load Balancer - attached to the public subnet and has a target group attached, it takes request to the private subnet using the PATH defined by route table

Internet Gateway - is attached to the public subnet so that it can access the internet 

Target group

sECURITY GROUP - on the EC2 instance, acts like a firewall to 

NACLs 0 automations for ur security groups. used to  the same settings areused for the security groups in all the ec2 in subnet a, b, c

natgateway -its bad practice to expose application/ec2 ip to the internet, so the natgatewat=y mask the ip of the application n instance. if thr maskinf is done using elb its called NAT, via royter its called NAT Gateway. it helps to download pplication from the internet

If someone on the internet is trying to reach an application in the vpc :on the private subnect(he can only access via the load balancer)172.16.21/16: he first 

VPC Flow logs - chargeable service
## Key Commands / Syntax


## Example


VPC has 3 Private subnets A,B,C
Subnet C has an EC2 instance with an application

if someone on the internet with address 172.16.3.1 wants to access the application in the in subnet c

Firstly it passes through the internet gateway into the public subnet(part of the vpc that is accessible from outside). In the public subnet there is the LB in AWS its called the Elastic Load Balancer which sends the outside request to the app in subnet c using the paths defined by the ROUTE TABLE. A TARGET GROUP needs be created to attach the ec2 instance in subnet c to it
## Takeaway


## New Learnings



## Questions
How do you define the size of VPC? IP address range

172.16.0.0/16 = 255*255 = 65,536 -this arethe number of applications





## Concept




## Key Commands / Syntax


## Example
## Takeaway


## New Learnings



## Questions
