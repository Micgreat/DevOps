# Capstone Project #7: CI/CD Mastery

## Project Scenario
As a DevOps Engineer, I'm tasked to design and implement a robust CI/CD pipeline using Jenkins to automate the deployment of a web application. The goal is to achieve continuos integration and continuos deployment, and ensure the reliability of the applications.

## Objectives

1. Jenkins, Github, Pipelines and docker.

## Project Components:
## 1. Jenkins Server Setup

### Objective
Configure Jenkins server for CI/CD pipeline automation.

### Steps:
1. Install Jenkins on a dedicated server.

    ### Tasks:
    1. Set up AWS instance
    ![img1](./img/1.instance.png)

    2. SSH connect to instance
    ![img2](./img/2.ssh-connect.png)

    3. Update 
    ```markdown
    sudo apt update
    ```

    4. Install JDK
    ```markdown
    sudo apt install default-jdk-headless
    ```

    5. Install Jenkins 
   ```markdown
    wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
    sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
    sudo apt update
    sudo apt-get install jenkins
   ```

   6. Jenkins running on port 8080
   ![img3](./img/5.jenkins-running.png)
   ![img4](./img/6.unlock-jenkins.png)

   7. Cat the password to login
   ```markdown
   sudo cat /var/lib/jenkins/secrets/initialAdminPassword
   ```
   
   8. Plugins Installed
   ![img5](./img/7.plugins-install.png)
   ![img6](./img/8.plugins-2.png)

   9. Setting up the user 
   ![img7](./img/9.setting-user.png)

   Instance Config
   ![img8](./img/10.instance-config.png)

2. Source Code Management Repository Integration.

    ## Tasks:
    1. Integrate Jenkins with the source code (Github)





