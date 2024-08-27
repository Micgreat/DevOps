# Capstone Project #4: WordPress Site on AWS

## Project Scenario
As an AWS Solutions Architect, I'm tasked to design and implement a WordPress solution using various AWS services, such as Networking, Compute, Object Storage, and Databases to help a digital marketing agency `DigitalBoost`, enhance it's online presence by creating a high-performance WordPress-based website for their clients. 

The agency needs a scalable, secure, and cost-effective solution that can handle increasing traffic and seamlessly integrate with their existing infrastructure. 

## Objectives & Components
1. VPC architecture and setup
2. Public and Private Subnet with NAT Gateway
3. AWS MySQL RDS Setup
4. Elastic File System (EFS) for WordPress Files
5. Application Load Balancer
6. Auto Scaling Group

## Project Overview

![img1](./img/1.overview.png)

## Step 1: VPC Setup

![img2](./img/2.vpc-setup.png)

### Tasks

1. Setup VPC to house all the congigurations and I named it `Digitalboost-vpc` for tracking.

![img3](./img/3.aws-vpc.png

2. Setup Internet Gateway `digitalboost-igw` to allow communication between instances in VPC and the internet

![img4](./img/4.igw-aws.png)

3. Attach the IGW created to the VPC

![img5](./img/5.attach-igw-to-vpc.png)

![img6](./img/6.attach-2-igw-done.png)

4. Created 6 subnets (private & public) all divided between 2 Availabilty Zones. 

![img7](./img/7.6subnets-az-pub-private.png)

Subnets created

![img9](./img/9.subnets-created.png)

5. Created 2 route tables `Public Route Table` for the public subnets and `Main Route Table` for the private subnets.

![img10](./img/10.create-route-table.png)

Route table done

![img11](./img/11.done-route-table.png)

6. Associate the public subnets to the public route table and the private subnets to the main route table

![img12](./img/12.assign-routetables-public.png)

7. Route the public route table through the Internet gateway

![img13](./img/13.route-public-table-t0-igw.png)

8. VPC Resource Map Overview

![img14](./img/14.vpc-resource-map.png)

## Step 2: Public and Private Subnet with NAT Gateway

## NAT GATEWAY ARCHITECTURE

![img15](./img/15.NAT-gateway.png)

1. Created a NAT gateway for the private subnets

![img16](./img/16.creating-nat.png)

2. Associate the NAT gateway route for the private subnets to the internet `0.0.0.0/24`. Resource map overview

![img17](./img/17.new-resource-after-nat.png)

## Step 3: AWS MySQL RDS Setup

## SECURITY GROUP ARCHITECTURE

![img18](./img/18.aws-myysql-rds.png)

1. Created a scurity groups for all  the connections and edited inbound rules for them all.

Application Load Balancer (ALB) Security Group

![img19](./img/19.alb-security-group.png)

SSH Security Group

![img20](./img/20.ssh-security-group.png)

Webserver Security Group

![img21](./img/21.webserver-security-group.png)

Database Security Group

![img22](./img/22.database-security-group.png)

EFS Security Group

![img23](./img/23.efs-security-group.png)

## Step 4: Setting up Supporting Casts
## Task a: Bastion Host (Jump Server)

1. To adequately access the instances in the private subnet, a bastion host is needed -this will be placed in the public subnet, whilst the private key is copied to the jump server, making it possible to ssh into the private subnet. 

![img24](./img/26.bastionhost.png)

Also, I created a security group for it. 

![img25](./img/25.bastion-host-security-group.png)

## Task b: Setting up EFS

1. I created an EFS file system to be mounted on the wordpress instance.

![img30](./img/31.efilesystem.png)

## Task c: Setting up the RDS database

![img31](./img/32.mysql-database.png)

![img32](./img/33.mysql-name-pwd.png)

![img33](./img/34.mysql-connectivity.png)

![img34](./img/35.mysql-security-group.png)

## Task d: Setting up the Webservers

1. I created an Amazon AMI instance in the private subnet 1a, linked to the vpc and webserver security group. 

![img26](./img/27.webserver1.png)

2. I copied the private key from the local storage, created a new folder in bastion host and pasted it. This will serve as key connection for the jump server to access the webserver in the private subnet.

![img27](./img/28.privatekey.png)

3. I ssh into the jumpserver

![img28](./img/29.ssh-jumopserver.png)

4. From there I ssh into the private webserver

![img29](./img/30.webserver.png)

5. Update the server

![img35](./img/36.update-server.png)

6. Installed apache and SSL

![img36](./img/37.installedapached%20and%20ssl.png)

7. Enabled and Started Apache

![img37](./img/38.enabled-and-started-apache.png)

8. Installed PHP

![img38](./img/39.installed-php.png)

9. Installed MySQL

![img39](./img/40.installed-mysql.png)

10. Set Permissions

![img40](./img/41.set-permissions.png)

11. Download and extract wordpress

![img41](./img/42.download-extract-wordpress.png)

12. Edit config files 

![img42](./img/43.create-edit-config-file.png)

13. Restart Server

![img43](./img/44.restart-server.png)

## Task e: Setting up the Application Load Balancer and Target Group

![img44](./img/45.alb.png)

![img45](./img/46.alb-network.png)

![img46](./img/47.alb-security.png)

![img47](./img/48.targetgroup.png)

![img48](./img/49.alb-provisioning.png)

## Task f: Setting up Autoscaling

