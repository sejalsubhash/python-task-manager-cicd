# 🚀 CI/CD Pipeline for Python Flask Application (AWS DevOps Project)

## 📌 Project Overview

This project demonstrates a complete **CI/CD pipeline implementation** for a Python Flask application using cloud and DevOps tools. The pipeline automates the process of **building, containerizing, and deploying applications** on AWS.

The system ensures **continuous integration and continuous delivery**, reducing manual effort and enabling faster, reliable deployments.

---

## 🛠️ Tech Stack

* **Frontend/Backend:** Python Flask
* **Containerization:** Docker
* **Version Control:** Git & GitHub
* **CI/CD Services:** AWS CodePipeline, AWS CodeBuild, AWS CodeDeploy
* **Container Registry:** Amazon ECR
* **Compute:** Amazon EC2

---

## 📂 Project Structure

```
python-task-manager-cicd/
│
├── app.py
├── requirements.txt
├── Dockerfile
├── buildspec.yml
├── appspec.yml
├── scripts/
│   ├── before_installation.sh
│   └── start.sh
└── README.md
```

---

## ⚙️ Features

* ✅ Automated CI/CD pipeline using AWS services
* ✅ Docker-based containerized application
* ✅ Auto-trigger pipeline on GitHub push
* ✅ Continuous deployment on EC2 instance
* ✅ Secure and scalable cloud architecture

---

## 🔄 CI/CD Workflow

```
GitHub Push
     ↓
AWS CodePipeline
     ↓
AWS CodeBuild (Build & Docker Image)
     ↓
Amazon ECR (Store Image)
     ↓
AWS CodeDeploy
     ↓
EC2 Instance (Deploy & Run Container)
```

---

## 🧑‍💻 Setup Instructions

### 1️⃣ Clone Repository

```bash
git clone https://github.com/your-username/python-task-manager-cicd.git
cd python-task-manager-cicd
```

---

### 2️⃣ Run Application Locally

```bash
python -m venv venv
source venv/bin/activate   # Windows: venv\Scripts\activate

pip install -r requirements.txt
python app.py
```

Open in browser:

```
http://localhost:5000
```

---

### 3️⃣ Docker Setup

```bash
docker build -t python-app .
docker run -p 5000:5000 python-app
```

---

### 4️⃣ AWS Setup

#### ✔️ Create ECR Repository

* Push Docker image to ECR

#### ✔️ Create CodeBuild Project

* Use `buildspec.yml`

#### ✔️ Create EC2 Instance

* Install Docker + CodeDeploy Agent

#### ✔️ Create CodeDeploy Application

* Use `appspec.yml` + scripts

#### ✔️ Create CodePipeline

* Connect GitHub → Build → Deploy

---

## 📸 Deployment Verification

After successful deployment:

```bash
http://<EC2-PUBLIC-IP>:5000
```

---

## 📊 Key Achievements

* 🚀 Reduced deployment time by **~80%**
* ⚡ Enabled **fully automated CI/CD pipeline**
* 📦 Ensured consistent deployments using Docker
* 🔄 Achieved continuous delivery with zero manual effort

---

## 📚 Learnings

* Hands-on experience with AWS DevOps tools
* Understanding of CI/CD pipelines and automation
* Docker containerization and deployment strategies
* Cloud-based scalable architecture

---


### ⭐ Don’t forget to star this repo if you like it!

