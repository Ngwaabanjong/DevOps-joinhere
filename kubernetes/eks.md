# What is EKS?
- Amazon EKS (Elastic Kubernetes Service) is a managed Kubernetes service provided by Amazon Web Services (AWS). 
- It makes it easy to deploy, manage, and scale containerized applications using Kubernetes, without the need to manage the underlying infrastructure. 
- In simpler terms, EKS helps you run and scale your containerized applications effortlessly on AWS.

## Architecture
Master Node:
- **API Server:** Serves as the cluster's control center, managing communication and control.
- **Controller Manager:** Ensures the cluster maintains the desired state by regulating controllers.
- **Scheduler:** Assigns workloads to nodes based on resource availability and policies.
- **ETCD:** Key-value store for cluster data, storing configuration details and current state.

Worker Node:
- **Kubelet:** Maintains communication between the node and the control plane, ensuring containers are running.
- **Service Proxy:** Routes traffic, allowing services to communicate with each other.
- **GPU:** Specialized hardware that accelerates processing, beneficial for compute-intensive tasks like machine learning. (Note: GPU is not a standard component but can be added to enhance node capabilities.)

## VPC recommendation
- https://docs.aws.amazon.com/eks/latest/userguide/creating-a-vpc.html

## How Nodes works
In a Kubernetes cluster, the machines are referred to as nodes. Nodes can be either physical or virtual. There are two main types of nodes:

1. **Control Plane Node:**
   - Function: Acts as the "brains" of the cluster.
   - Role: Manages and controls the overall state of the cluster.
   - Responsibility: Coordinates tasks like scheduling, scaling, and maintaining cluster health.

2. **Worker Node:**
   - Function: Makes up the Data Plane.
   - Role: Runs the actual container images within pods.
   - Responsibility: Executes the workloads, hosting and managing containers.

**In summary,** Control Plane Nodes manage the cluster, while Worker Nodes execute and host the containers that make up the application workloads.

## What to consider when creating an eks cluster

## Some Commands
- $ eksctl create cluster --name your-cluster-name --region your-region
- $ kubectl get clusters
- $ kubectl version

GET:
- $ kubectl get nodes -o wide
- $ kubectl get pods -A -o wide
- $ kubectl get svc