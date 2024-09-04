# Capstone Project #5: Shell Script for AWS IAM Management

## Project Scenario
Datawise Solutions requires an efficient management of their AWS IAM. I am tasked to write a shell script for its team that needs to onboard five new employees to access AWS resources securely. 

## Objectives
1. Script enhancement
2. Define IAM user names array
3. Create IAM users.
4. Create IAM group.
5. Attach administrative policy to group.
6. Assign users to group.

## Step 1: Prepare the documentation

# Tasks

1. Created the file `aws_cloud_manager.sh`

![img1](./img/1.touch.png)

2. Gave the file execute permission

![img2](./img/2.modify-for-permission.png)

3. Ensure they have AWS CLI imstalled 

![img3](./img/3.ensuring-aws-installed.png)

4. Create an array for the employees to be onboarded

![img4](./img/4.array-for-employees.png)

5. Create admin group 

![img5](./img/5.create-admin-group.png)

6. Attach the admin group to the admin policy 

![img6](./img/6.attach-admin-polic.png)

7. Create the users to be onboarded

![img7](./img/7.create-user.png)

8. Add all the created users to the admin group

![img8](./img/8.add-user-to-admin.png)

9. Attache the admnin policy to the admin group created

![img9](./img/9.admingroup-policy.png)

10. Onboard the users

![img10](./img/10.onboard-users.png)

## Step 2: Set up the Server and deploy

1. Launch an EC2 instance 

![img11](./img/11.instance.png)

2. Install, setup and enable Apache server 

![img12](./img/12.install-apache.png)

3. Install AWS CLI

![img13](./img/13.install-aws-cli.png)

4. Create access key on IAM AWS

![img14](./img/14.create-access-key.png)
![img15](./img/15.accesskey-server.png)

5. Configure the access key to the apache server

![img16](./img/16.aws-configure-server.png)

6. Create the file for the shell script

![img17](./img/17.touch-server.png)

7. Grant the file permission to be executable 

![img18](./img/18.server-permission.png)

8. Vim into the file and paste the code 

![img19](./img/19.paste-code.png)

9. Run the shell script to carry out the script

![img20](./img/20.run-shell.png)

10. Script running perfectly. Creating admin group

![img21](./img/21.shell-creating-group-admin.png)

11. Attaching the admin policy to the `admin` group

![img22](./img/22.attach-admin-policy-group.png)

12. Script creating the users `empployee1`

![img23](./img/23.creating-user.png)

13. Script is adding the `employee1` to the admin group

![img24](./img/24.adding-employee-to-admin.png)

14. Script creating `employees 2,3,4,& 5`

![img25](./img/25.creating-employee-2345.png)

15. Script successfully completed the onboarding process

![img26](./img/26.onboarding-successful.png)

## Step 3: Confirm Onboarding on the AWS instance

1. Confirm group creation 

![img27](./img/27.ec2-group-confirm.png)

2. All employees successfully added to group

![img28](./img/28.all5-employees-in-admingroup.png)

3. All employees having admin policy

![img29](./img/29.employees-with-admin-access.png)