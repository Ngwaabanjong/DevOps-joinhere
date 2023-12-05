# This Section is Mainly for IAM Roles and Policies.

# 1 - Create Read Group for Developers
- This will be an RBAC Policy Configuration.
- Create IAM User name developer with programatic access using the below policy.
```
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "eks:DescribeNodegroup",
                "eks:ListNodegroups",
                "eks:DescribeCluster",
                "eks:ListClusters",
                "eks:AccessKubernetesApi",
                "ssm:GetParameter",
                "eks:ListUpdates",
                "eks:ListFargateProfiles"
            ],
            "Resource": "*"
        }
    ]
}


```

## 2 - Configure IAM User on CLI
```
aws configure --profile developer
```

## 3 - Create Developer Group with Read Only Access.
- Kubernetes RBAC group.
```
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: reader
rules:
- apiGroups: ["*"]
  resources: ["deployments", "configmaps", "pods", "secrets", "services"]
  verbs: ["get", "list", "watch"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: reader
subjects:
- kind: Group
  name: reader
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: reader
  apiGroup: rbac.authorization.k8s.io
```

## 4 - Grant IAM Developer User Access.
- To map IAM user with Kubernetes RBAC system, we need to modify aws-auth configmap.
- Open the config map and add arn of the IAM user under mapUsers key.
```
kubectl edit -n kube-system configmap/aws-auth
```

- Now Add this section to the Configmap file.
```
  mapUsers: |
    - userarn: arn:aws:iam::xxxxxx86135:user/developer
      username: developer
      groups: 
      - reader
```

## 5 - Configure user to EKS Cluster.
- Run the below command on CLI.
```
aws eks update-kubeconfig \
  --region us-east-1 \
  --name demo \
  --profile developer
```

## Run Below Commands to check permission
```
kubectl config view --minify
kubectl auth can-i get pods
kubectl auth can-i create pods
kubectl run nginx --image=nginx
```

# 1 - Configure EKS Cluster Admin
- AWS IAM. Create IAM Policy with name eksAdminPolicy
- You can restrict the policy as per the cluster.
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "eks:*"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "iam:PassRole",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "iam:PassedToService": "eks.amazonaws.com"
                }
            }
        }
    ]
}
```

## 2 - Create Role
- On AWS IAM, Role -> Select AWS Account -> tick This Account -> Next -> attach the created policy.
- Name role: eks-test-admin-role
- Check role with below command.
```
aws iam get-role --role-name eks-teks-test-admin-roleest-admin-role
```

## 3 - Add Assume Policy On Role For User
- For any user that wants to use eks-test-admin-role, needs an assume policy to be able use the role.
- Copy the role arn and update the below policy.
- Create assume policy and name it: eksAminAssumeRolePolicy
```
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Resource": "arn:aws:iam::XXXXXXX6445:role/eks-admin"
        }
    ]
}
```

## 4 - Create IAM User(EKS Admin)
- On AWS IAM, Create IAM User and attach eksAminAssumeRolePolicy
- Download the programatic credentials after creation.
- Configure a profile for the admin user
```
aws configure --profile manager
```

## 5 - Check if user can assume role:
- Copy your role arn and change.
```
aws sts assume-role \
  --role-arn arn:aws:iam::XXXXXXX6445:role/eks-test-admin\
  --role-session-name manager-session \
  --profile manager
```

## 6a - Now let's add user to config map:
- We need to use the same credentials that created the EKS Cluster.
- Configure CLI and run the below command.
```
aws eks --region us-east-1 update-kubeconfig --name demo
```

b. Open aws-auth Configmap:
- We will use Kubernetes RBAC group.
```
kubectl edit -n kube-system configmap/aws-auth
```

c. Add Below Code:
```
  mapRoles: |
    - rolearn: arn:aws:iam::XXXXXXX6445:role/eks-admin
      username: eks-admin
      groups:
      - system:masters
```

d. Open Provider Config file
```
vim ~/.aws/config
```

d. Add Code to Config file
```
[profile eks-test-admin]
role_arn = arn:aws:iam::XXXXXXX6445:role/eks-test-admin
source_profile = manager
```

e. Now let's update the Configuration
```
aws eks update-kubeconfig \
  --region us-east-1 \
  --name demo \
  --profile eks-test-admin
```

## 7 - Now run commands:
- Ready for deployments.
```
kubectl config view --minify
kubectl auth can-i "*" "*"
kubectl run nginx --image=nginx
```
