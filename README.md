# DevOps CI/CD Project

A beginner-friendly DevOps CI/CD project that automatically tests, builds, pushes, and deploys a Dockerized website using GitHub and Jenkins.

## Architecture

GitHub
↓
Jenkins Pipeline
↓
Checkout
↓
Test
↓
Docker Build
↓
Docker Hub
↓
Ubuntu Server
↓
Docker Container
↓
Website

## Technologies Used

- Git
- GitHub
- Jenkins
- Jenkins Pipeline
- Docker
- Docker Hub
- Linux / Ubuntu
- SSH
- Nginx
- Bash

## Pipeline Stages

1. Checkout source code from GitHub
2. Test the HTML file
3. Build Docker image
4. Push Docker image to Docker Hub
5. Deploy Docker container on Ubuntu
6. Verify the website using curl

## Docker Image

sara567/devops-website:latest

## Application URL

http://172.20.232.68:8090

## Project Result

The website can be updated through GitHub and deployed using the Jenkins CI/CD pipeline.
