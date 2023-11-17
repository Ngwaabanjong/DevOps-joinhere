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

## Kubectl versions
-   https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html

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

## Staeps in creating an eks cluster
1. Create a VPC to Kubernetes tags.
2. Create IAM Role for Master Control Node.
3. Create IAM Role for Worker Nodes.
4. Create EKS Cluster with Worker Nodes Group.
5. SSH into Worker Nodes and install kubectl version as per Cluster version.
6. Login to Cluster through AWS CLI. 
7. Deploy manifest files for application.
8. Create a Service (Load Balancer) with manifest file.

## Some Commands
- https://docs.aws.amazon.com/eks/latest/userguide/create-cluster.html
- $ eksctl create cluster --name your-cluster-name --region your-region
- $ eksctl create cluster --name my-cluster --region region-code --version 1.27 --vpc-private-subnets subnet-ExampleID1,subnet-ExampleID2 --without-nodegroup
- $ kubectl get clusters
- $ kubectl version

GET:
- $ kubectl get nodes -o wide
- $ kubectl get pods -A -o wide
- $ kubectl get svc

## AWS EKS Use cases and Workshops
- https://aws.amazon.com/eks/?p=pm&pd=eks&z=4