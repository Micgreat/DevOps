# Capstone Projet #6: Frontend Application with Docker and Kubernetes

## Project Scenario

I developed a simple static website (HTML and CSS) for a company's landing page. The goal is to containerize this application using Docker, deploy it to a kubernetes cluster, and access it through nginx. 

## Objectives
1. Implement with git
2. Dockerize the application 
3. Make use of Docker hub
4. Use Kubernetes Cluster

## Step 1: Setup and Git Initialization 
### Tasks:

1. Create a new project directory.
```markdown
mkdir 06.Frontend_Application_with_Docker_and_Kubernetes
```
2. Create a new html file
```markdown
touch index.html
```
3. vim index.html and add the code
```markdown
vim index.html
```
Paste the code below
```markdown
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Simple Static Web App</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 20px;
            text-align: center;
        }
        header {
            background-color: #4CAF50;
            color: white;
            padding: 10px 0;
            font-size: 24px;
        }
        .content {
            margin-top: 20px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        footer {
            margin-top: 30px;
            color: #777;
        }
    </style>
</head>
<body>

    <header>
        Welcome to My Simple Web App
    </header>

    <div class="content">
        <p>This is a static web application created using HTML and CSS. It contains basic elements like text, buttons, and styles.</p>
        <button onclick="alert('Button Clicked!')">Click Me!</button>
    </div>

    <footer>
        <p>&copy; 2024 My Web App. All rights reserved.</p>
    </footer>

</body>
</html>

```
4. Create a new .css file
```markdown
touch styles.css
```
5. Vim styles.css and add the code

```markdown
vim styles.css
```
Paste the code below

```markdown
/* General body styling */
body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f7f7f7;
    color: #333;
    line-height: 1.6;
}

/* Header styling */
header {
    background-color: #4CAF50;
    color: white;
    padding: 20px 0;
    text-align: center;
    font-size: 24px;
    font-weight: bold;
}

/* Main content area */
.container {
    width: 80%;
    margin: 0 auto;
    padding: 20px;
    text-align: center;
}

/* Button styling */
button {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 10px 20px;
    margin-top: 20px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #45a049;
}

/* Links styling */
a {
    color: #4CAF50;
    text-decoration: none;
    font-weight: bold;
}

a:hover {
    color: #388E3C;
    text-decoration: underline;
}

/* Footer styling */
footer {
    background-color: #333;
    color: white;
    padding: 10px 0;
    text-align: center;
    position: relative;
    bottom: 0;
    width: 100%;
    font-size: 14px;
}

/* Responsive media query */
@media (max-width: 600px) {
    .container {
        width: 100%;
        padding: 10px;
    }

    header {
        font-size: 20px;
    }

    button {
        padding: 8px 16px;
        font-size: 14px;
    }
}

```
6. Add, Commit and Push to Git

Add
```markdown
Git add .
```
![img7](./img/7.gitadd.png)

Commit
```markdown
Git commit -m "Updated README.md"
```
![img8](./img/8.gitcommit.png)

Push 
```markdown
Git Push
```
![img9](./img/9.gitpush.png)

## Step 2: Dockerize the Application

### Tasks:

1. Create a `dockerfile` and specify nginx as the base image in the same directory as the index.html file.

```markdown
touch dockerfile
```
```markdown
vim dockerfile
```

Paste the code below

```markdown
# Use the official NGINX base image
FROM nginx:latest

# Set the working directory in the container
WORKDIR  /usr/share/nginx/html/

# Copy the local HTML file to the NGINX default public directory
COPY index.html /usr/share/nginx/html/

# Expose port 80 to allow external access
EXPOSE 80

# No need for CMD as NGINX image comes with a default CMD to start the server
```

2. Build an image using the `dockerfile` just created.

```markdown
docker build -t dockerfile .
```
![img4](./img/4.docker-build.png)

3. Check the images list to confirm the dockerfile image is already created

```markdown
docker images 
```
![img5](./img/5.docker-images.png)

4. Run a container based on the image created and map it to a listening port

```markdown
docker run -p 8080:80 dockerfile
```
![img6](./img/6.docker-run.png)

5. Check the list of available containers

```markdown
docker ps -a
```

![img10](./img/10.docker-ps.png)

6. Copy out the container ID and start

```markdown
docker start 5a04c49663c5 
```

![img11](./img/11.docker-start.png)

7. Type the docker host IP in the host web browser including the port to view the webpage.

![img12](./img/12.webpage-view.png)


## Step 3: Push to Dockerhub

### Tasks:

1. I already have a dockerhub account, I'll tag my image using my username and repository name then push.

```markdown
docker tag dockerfile micgreat/capstone6:1.0
```
![img13](./img/13.docker-tag.png)

2. Login to docker hub 

```markdown
docker login -u micgreat
```
![img14](./img/14.docker-login.png)

3. Push the image to docker hub

```markdown
docker push micgreat/capstone6:1.0
```
![img15](./img/15.docker-push.png)
