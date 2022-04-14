# Provision AWS VPC using Terraform

## VPC "Remote" Module

This Terraform module provisions an AWS VPC. A new VPC is created, creates and assigns a number of specification to the VPC including:
* Enables DNS services for the VPC
* Creates the CIDR block that will be assigned for the VPC
* Creates a Public Route Table and assigns the IGW to the RT
* Creates both a public and private subnet, assigned to the VPC
* Creates a 'Name' tag for the VPC

The vars.tf file defines the necessary variables referenced in the main.tf file (tags, CIDR (block, public and private), AZ)

This module is made to be referenced remotely, used in conjunction with other modules.
