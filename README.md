

#  Automated CI/CD Pipeline for Python Application using AWS

## 📌 Project Overview

This project demonstrates a fully automated CI/CD pipeline for a Python Flask application using AWS services.

Whenever code is pushed to GitHub, the pipeline automatically:

* Builds the application
* Runs tests
* Builds Docker image
* Pushes image to Amazon ECR
* Deploys application to EC2
* Generates logs in CloudWatch

---

## 🏗 Architecture Components

* GitHub – Source code repository
* AWS CodePipeline – CI/CD orchestration
* AWS CodeBuild – Build & Test stage
* Amazon ECR – Docker image repository
* AWS CodeDeploy – Application deployment
* Amazon EC2 – Hosting server
* Amazon CloudWatch – Logs & monitoring

---

# 🧩 Workflow Summary

## Step 1: Local Development

### ✔ Install Required Tools

* Python 3.9+
* Git
* Docker Desktop
* Visual Studio Code

### ✔ Create Virtual Environment

```
python -m venv venv
```

### ✔ Install Dependencies

```
pip install flask
pip freeze > requirements.txt
```

### ✔ Run Application

```
pip install -r requirements.txt
python app.py
```

Open in browser:

```
http://localhost:5000
```

---

## 🐳 Step 2: Docker Setup

### ✔ Create Dockerfile

### ✔ Build Image

```
docker build -t python-app:latest .
```

### ✔ Run Container

```
docker run -p 5000:5000 python-app
```

Verify:

```
http://localhost:5000
```

---

## 📦 Step 3: Push Image to ECR

### ✔ Create ECR Repository

Repository Name:

```
task-manager-cicd
```

### ✔ Configure AWS CLI

```
aws configure
```

### ✔ Login to ECR

```
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin <ecr_url>
```

### ✔ Tag & Push Image

```
docker tag python-app:latest <ecr_url>/task-manager-cicd:latest
docker push <ecr_url>/task-manager-cicd:latest
```

---

## 🔗 Step 4: GitHub Setup

### ✔ Initialize Git

```
git init
git add .
git commit -m "Initial commit - Python app"
```

### ✔ Connect to GitHub

```
git remote add origin <github-repo-url>
git branch -M main
git push -u origin main
```

---

## ⚙ Step 5: Create buildspec.yml

The `buildspec.yml` file defines:

* Install dependencies
* Build Docker image
* Push image to ECR
* Generate artifacts

Push this file to GitHub repository.

---

## 🔨 Step 6: CodeBuild Setup

Create CodeBuild project:

* Source: GitHub
* Environment: Managed Image (Linux)
* Enable Privileged Mode
* Use buildspec.yml
* Enable CloudWatch logs

Start build and verify successful execution.

---

## 🖥 Step 7: EC2 Setup

### ✔ Launch EC2

* AMI: Amazon Linux 2
* Instance Type: t2.micro
* Open Ports: 22, 80, 5000

### ✔ Install Docker

```
sudo yum update -y
sudo yum install docker -y
sudo service docker start
```

### ✔ Install CodeDeploy Agent

```
sudo yum install ruby -y
sudo yum install wget -y
wget https://aws-codedeploy-ap-south-1.s3.ap-south-1.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
sudo service codedeploy-agent start
```

---

## 🚀 Step 8: CodeDeploy Setup

### ✔ Create Application

* Platform: EC2 / On-Premises

### ✔ Create Deployment Group

* Deployment Type: In-place
* Attach EC2 instance using tag
* Attach IAM Role

### ✔ Create appspec.yml

Defines:

* File copy location
* BeforeInstall script
* ApplicationStart script

---

## 🔁 Step 9: CodePipeline Setup

### ✔ Stage 1 – Source

* Provider: GitHub
* Branch: main

### ✔ Stage 2 – Build

* Provider: CodeBuild

### ✔ Stage 3 – Deploy

* Provider: CodeDeploy
* Select deployment group

Pipeline runs automatically on code push.

---

# 🔄 CI/CD Flow

```
Developer → GitHub → CodePipeline → CodeBuild → ECR → CodeDeploy → EC2 → CloudWatch
```

---

# ✅ Verification

After pushing new changes:

```
git add .
git commit -m "Test pipeline"
git push
```

Pipeline triggers automatically.

Check application:

```
http://<public_ip>:5000
```

---

# 🎯 Expected Outcome

* Fully automated CI/CD pipeline
* No manual deployment required
* Dockerized Python application
* Auto-trigger on code push
* Deployment logs in CloudWatch

---

# 📌 Conclusion

This project successfully demonstrates implementation of an end-to-end automated CI/CD pipeline using AWS services with Docker-based deployment to EC2.

The system ensures:

✔ Continuous Integration
✔ Continuous Deployment
✔ Automated Infrastructure Workflow
✔ Production-ready DevOps Architecture

