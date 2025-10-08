# DevOps Internship Assessment - Next.js Application Deployment

## Overview
This repository demonstrates containerization and deployment of a **Next.js application** using **Docker**, **GitHub Actions**, and **Kubernetes (Minikube)**.

- Containerized Next.js app with best practices.
- Automated Docker image build and push via **GitHub Actions** to **GitHub Container Registry (GHCR)**.
- Deployed to Kubernetes using manifests.
- Accessible locally via Minikube NodePort.

---

## Repository Structure

.
├── app/ # Next.js application code
├── k8s/ # Kubernetes manifests
│ ├── deployment.yaml
│ └── service.yaml
├── .github/workflows/ # GitHub Actions workflow
│ └── docker.yml
├── Dockerfile
├── .dockerignore
├── README.md
└── package.json

yaml
Copy code

---

## Prerequisites

- Git
- Docker
- Minikube
- kubectl
- Node.js >= 18
- npm >= 9

---

## Local Setup

1. Clone the repository:

```bash
git clone https://github.com/Lalithya15/cri-dockerd.git
cd cri-dockerd
Install dependencies:

bash
Copy code
npm install
Run the app locally:

bash
Copy code
npm run dev
Access the app at http://localhost:5000

Docker Build & Run Locally
Build Docker image:

bash
Copy code
docker build -t lalithya/nextjs-app:latest .
Run container:

bash
Copy code
docker run -p 5000:5000 lalithya/nextjs-app:latest
Access the app at http://localhost:5000

GitHub Actions Workflow
The workflow .github/workflows/docker.yml:

Builds Docker image on push to main.

Tags image with latest and SHA.

Pushes image to GitHub Container Registry (GHCR).

GHCR Image URL:

bash
Copy code
ghcr.io/Lalithya15/nextjs-app:latest
Kubernetes Deployment (Minikube)
Start Minikube:

bash
Copy code
minikube start --driver=none
Apply manifests:

bash
Copy code
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
Verify deployment:

bash
Copy code
kubectl get pods -A
kubectl get svc
Access the app:

bash
Copy code
minikube service hello-minikube
Or use curl with NodePort:

bash
Copy code
curl http://10.0.2.92:3000

Notes
deployment.yaml includes replicas, liveness/readiness probes.

service.yaml exposes app using NodePort.

GitHub Actions automates container image lifecycle, ensuring CI/CD.

Author
Name: Lalithya V



GitHub: https://github.com/Lalithya15

yaml
Copy code

---

✅ This README covers all required points:

- Setup instructions
- Local run commands
- Deployment steps on Minikube
- Access instructions
- GHCR information
