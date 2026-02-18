#!/bin/bash

aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 989615686095.dkr.ecr.us-east-2.amazonaws.com

docker pull 989615686095.dkr.ecr.us-east-2.amazonaws.com/task-manager-cicd/task-manager:latest
docker stop task-manager || true
docker rm task-manager || true
docker run -d -p 5000:5000 --name task-manager 989615686095.dkr.ecr.us-east-2.amazonaws.com/task-manager-cicd/task-manager:latest
