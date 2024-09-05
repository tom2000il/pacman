# Pacman on AWS Cloud

This project demonstrates how to deploy the classic Pacman game on the AWS Cloud using a modern infrastructure stack. I used Terraform for infrastructure as code, AWS EKS for container orchestration, AWS CodeBuild and aws codepipeline for ci/cd.
## Table of Contents
- Architecture
- Prerequisites
- Project Setup
- AWS Services Used
- Terraform Setup
- CI/CD Pipeline
- Running the Game

## Architecture
The project is designed to run the Pacman game as a containerized application on AWS using the following components:
1. **AWS EKS** - A managed Kubernetes service for running the Pacman game.
2. **AWS CodeBuild** - Builds and packages the Docker image.
3. **AWS CodePipeline** - Automates the CI/CD process from GitHub to production.
4. **Terraform** - Provisions the necessary AWS infrastructure.

## Prerequisites
Before getting started, ensure you have the following installed:
- **AWS CLI**
- **Terraform**
- **Kubectl**
- **Docker**
- **Git**

You will also need an AWS account and the appropriate permissions to create and manage AWS resources like EKS, CodePipeline, and CodeBuild.

## Project Setup
1. Clone this repository:
    ```bash
    git clone https://github.com/tom2000il/pacman
    cd pacman
    ```

2. Set up your AWS credentials:
    ```bash
    aws configure
    ```

3. Install necessary dependencies:
    ```bash
    terraform init
    ```

## AWS Services Used
- **Amazon EKS**: Hosts the Kubernetes cluster for running the game.
- **AWS ECR** - Stores Docker images for deployment.
- **AWS CodePipeline**: Manages the CI/CD pipeline.
- **AWS CodeBuild**: Builds Docker images and runs tests during the CI process.

## Terraform Setup
1. Initialize and apply the Terraform configuration to set up the infrastructure:
    ```bash
    terraform apply
    ```
2. This will provision the necessary AWS infrastructure such as VPC, subnets, EKS cluster, and more.

## CI/CD Pipeline
The CI/CD pipeline is managed by AWS CodePipeline and automatically deploys the game after every code change. It includes:
1. **Source**: GitHub repository hosting the Pacman game.
2. **Build**: AWS CodeBuild compiles and tests the Docker image.
3. **Deploy**: The containerized application is deployed to the EKS cluster.

## Running the Game
1. Once the pipeline is complete, you can access the Pacman game via the load balancer endpoint created by the EKS service.
2. Use the following command to get the external IP of the game:
    ```bash
    kubectl get services pacman-service
    ```
3. Open the external IP in your browser to play the game.
