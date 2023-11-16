# Manifest File Explaination
In the context of Kubernetes, a manifest file is a YAML or JSON file that describes the desired state of your application or infrastructure within the cluster. It serves as a blueprint for Kubernetes to create, modify, or delete resources. Here's a brief overview for beginners:

1. **YAML or JSON Format:**
   - **YAML:** It's a human-readable data serialization format.
   - **JSON:** A widely used data interchange format.

2. **Resource Definition:**
   - Manifest files define Kubernetes resources, such as pods, services, deployments, and more.
   - Example: A simple pod manifest might describe the container image to run and any associated configurations.

3. **Key Components:**
   - **apiVersion:** Specifies the Kubernetes API version for the resource.
   - **kind:** Defines the type of resource (e.g., Pod, Service).
   - **metadata:** Contains information like the name, labels, and annotations.
   - **spec:** Describes the desired state of the resource.

4. **Example Pod Manifest:**
   - Pod
   ```yaml
   apiVersion: v1
   kind: Pod
   metadata:
     name: my-pod
   spec:
     containers:
     - name: my-container
       image: nginx:latest
   ```

   - Service
   ```yaml
     apiVersion: v1
   kind: Service
   metadata:
     name: my-pod-svc # this name of our service
   spec:
     type: loadBalancer
     selector:
        app: my-pod   # pods are deployed with a label
     ports:
       - port: 80
    ```

5. **Applying Manifest:**
   - Use the `kubectl apply` command to apply the manifest to the cluster.
   - Example: `kubectl apply -f path/to/your/manifest.yaml`

6. **Monitoring Resources:**
   - Use `kubectl get` commands to check the status of resources.
   - Example: `kubectl get pods`

7. **Editing Manifest:**
   - Manifests are often version-controlled. 
   - Edit the manifest file, then reapply using `kubectl apply`.

Manifest files allow you to define and manage your application's structure and behavior in a version-controlled and declarative manner. Kubernetes then works to ensure the actual state matches the desired state specified in the manifest.

## EKS Manifest Samples
- https://eksctl.io/usage/eks-managed-nodes/