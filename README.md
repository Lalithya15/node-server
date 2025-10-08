# Next.js Application - DevOps Assessment

This is a simple **Next.js** application containerized with Docker, set up for deployment to Kubernetes (Minikube) and automated builds via GitHub Actions.

---

## Project Overview

- **Framework:** Next.js 15+
- **Node Version:** 18
- **Purpose:** Containerize a Next.js app, automate builds/push to GHCR, and deploy on Kubernetes.
- **Features:**
  - Simple Next.js starter app
  - Dockerized for container deployment
  - Automated GitHub Actions workflow
  - Kubernetes manifests for Deployment & Service

---

## Getting Started (Local)

1. **Clone the repository:**
```bash
git clone https://github.com/Lalithya15/nextapp.git
cd nextapp
Install dependencies:

bash
Copy code
npm install
Run development server:

bash
Copy code
npm run dev
Open in browser:

arduino
Copy code
http://localhost:5000
Docker
Build Docker image
bash
Copy code
docker build -t nextapp:local .
Run container
bash
Copy code
docker run -p 5000:5000 nextapp:local
Access app
arduino
Copy code
http://localhost:5000
GitHub Container Registry (GHCR)
Login:

bash
Copy code
echo YOUR_PERSONAL_ACCESS_TOKEN | docker login ghcr.io -u Lalithya15 --password-stdin
Push image to GHCR:

bash
Copy code
docker tag nextapp:local ghcr.io/lalithya15/nextapp:latest
docker push ghcr.io/lalithya15/nextapp:latest
Kubernetes (Minikube)
Kubernetes Manifests
k8s/deployment.yaml – Deployment with replicas, liveness & readiness probes

k8s/service.yaml – Service to expose the app

Apply manifests
bash
Copy code
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
Verify deployment
bash
Copy code
kubectl get pods
kubectl get svc
Access app
Use the NodePort or minikube service command:

bash
Copy code
minikube service nextapp-service
GitHub Actions Workflow
.github/workflows/docker.yml builds the Docker image on push to main and pushes to GHCR.

Uses proper tagging (latest or commit SHA).

Folder Structure
csharp
Copy code
nextapp/
├─ app/                  # Next.js app files
├─ public/               # Static assets
├─ .github/workflows/    # GitHub Actions workflow
├─ k8s/                  # Kubernetes manifests
├─ Dockerfile
├─ package.json
├─ package-lock.json
└─ README.md
Done By
Lalithya V
