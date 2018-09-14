# AWS #

## CloudFormation ##

This section will provide some automation around deploying a Cloudera Director instance in a AWS environment.  
We will be using CloudFormation scripts to deploy the infrastructure.

Either use AWS Cloud Formation WebUI or API.



### aws-quickstart-cloudera-director.template ###

This is a ALL-IN-ONE script to setup AWS Network + Security + Director Instance:  

Deploy:   

* VPC (10.0.0.0/16)
* Internet Gateway (IGW) to access internet
* Public Subnet (10.0.0.0/24)
* Public Security Group (SSH + Cloudera Ports 7180 - 7189).
* EC2 Instance with floating IP
* install Java JDK 1.8
* install Cloudera Director 2.8

Input:   

* username
* keypair
* SubnetId
* SecurityGroupId

Output:   

* SubnetId
* SecurityGroupId
* Director connection url : http://[DIRECTOR-HOSTNAME]:7189/


### aws-quickstart-new-VPC-single-public.template ###

Will setup AWS Network / Security Group/

Deploy:   
 
* VPC (10.0.0.0/16)
* Internet Gateway (IGW) to access internet
* Public Subnet (10.0.0.0/24)
* Public Security Group (SSH + Cloudera Ports 7180 - 7189).


Fixed:

* AWS Region = eu-west-1
* Availability Zone = eu-west-1a


Input:   

* username

Output:   

* SubnetId
* SecurityGroupId

### aws-quickstart-cloudera-director-existing-VPC.template ###

Will setup a virtual machine for Director Instance.   

Deploy:   

* EC2 Instance with floating IP
* install Java JDK 1.8
* install Cloudera Director 2.8

Fixed:

* Director virtual machine size (t2.medium)
* Director virtual machine image used (CentOS 7)


Input:

* username
* keypair
* SubnetId
* SecurityGroupId

Output:   

* SubnetId
* SecurityGroupId
* Director connection url : http://[DIRECTOR-HOSTNAME]:7189/



### aws-quickstart-cloudera-director-embedded.template ###

/!\ NOT FULLY FONCTIONAL /!\

This is a ALL-IN-ONE script to setup AWS Network + Security + Director Instance. The difference with the aws-quickstart-cloudera-director.template script is that it is using Cloud Formation embbeded script functionalities.

aws-quickstart-cloudera-director-embedded.template = aws-quickstart-new-VPC-single-public.template + aws-quickstart-cloudera-director-existing-VPC.template

Deploy:   

* VPC (10.0.0.0/16)
* Internet Gateway (IGW) to access internet
* Public Subnet (10.0.0.0/24)
* Public Security Group (SSH + Cloudera Ports 7180 - 7189).
* EC2 Instance with floating IP
* install Java JDK 1.8
* install Cloudera Director 2.8

Input:   

* username
* keypair
* SubnetId
* SecurityGroupId

Output:   

* SubnetId
* SecurityGroupId
* Director connection url : http://[DIRECTOR-HOSTNAME]:7189/
