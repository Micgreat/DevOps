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


## Tasks

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