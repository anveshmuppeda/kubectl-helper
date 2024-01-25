# Welcome to Kubectl cheatsheet [![GitHub](https://img.shields.io/github/license/anveshmuppeda/kubectl-helper?color=blue)](https://github.com/anveshmuppeda/kubectl-helper/blob/main/LICENSE)  
<p align="center">  
By Anvesh Muppeda & Sai Manasa Kota  
</p>   

1. [ Cluster ](#Cluster)
2. [ Switching Between Contexts ](#SwitchingBetweenContexts)
3. [ Labels & Selectors ](#Labels&Selectors )
4. [ Container ](#Container)
5. [ Pod ](#Pod)
6. [ Nodes ](#Nodes) 
7. [ Logs ](#Logs) 
8. [ eksctl ](#eksctl)  
9. [ awscli ](#awscli)
10. [ Certs ](#certs)
11. [ Set ](#set_command)
12. [ Rollout ](#rollout)
13. [ Taint ](#taint)
14. [ Port Forward ](#portforward)
15. [ Patch ](#patch)


<a name="Cluster"></a>

## Cluster  

### Listing all the resources in cluster
```
kubectl api-resources
```  

### Listing all the api versions in cluster
```
kubectl api-versions
```  

### Get the configurations of saved clusters  
To get more information about config view click here.
```
kubectl config view
```
### 

### decode and encode of data for k8's to use in secrets
```
echo -n "anvesh" | base64
echo -n "" | base64 --decode
```
### to Check Access  
```
kuebctl auth can-i create deployments
kubectl auth can-i create pods
```
### to check IP range for pods within the namespaces
```
kubectl cluster-info dump | grep -m 1 cluster-cidr
```
---

<a name="SwitchingBetweenContexts"></a>
## Switching Between Contexts
### to list all preconfigured contexts and see which one is active:
```
kubectl config get-contexts
```
### prints the current config name
```
kubectl config current-context
```
### prints the current config with more details
```sh
kubectl config view --minify
```
### to switch between the predefined contexts(Switch to a context/cluster):
```
kubectl config use-context NikTest
```
### setting Default Namespace
Namespace defaults are set in your cluster’s context configuration. We change the default you will need to use the kubectl set-config command and specify the name of the namespace want to be used as default.
```
kubectl config set-context --current --namespace=<NAMESPACE>
```
For example, to set the namespace anvesh as your default, you would run the following command:
```
kubectl config set-context --current --namespace=anvesh
```

---
<a name="Labels&Selectors"></a>
## Labels & Selectors 
### labeling a node
```
kubectl label node <nodename> <label_name>=<label_value>
```
### remove Label from a node
```
kubectl label node <nodename> <label_name>=<label_value>-
```
### to read node labels  
```
kubectl get nodes --show-labels  
kubectl label --list nodes node_name  
```  
### to overwrite the node label  
``` 
kubectl label --overwrite <nodename> <label_name>=<label_value>   
```
---
<a name="Containers"></a>
## Container 
### to login inside docker container
```
docker exec -it <container name> /bin/bash
```
---
<a name="Pod"></a>
## Pod
### to curl to a pod 
```
kubectl exec -it selenium-hub-b4bb44946-xthvr -n selenium — curl http://192.168.194.81:4444/wd/hub/status
```
### to ssh to a pod  
```
winpty kubectl exec -it <pod-name> -n <namespace> //bin//sh
```
### to watch a pod 
```sh
kubectl get <pods/deployments> -n <namespace> -w
kubectl get <pods/deployments> -n <namespace> --watch
```
### to list all pods in a cluster
```
kubectl get pods -A
```
### to print env variables of a pod
```
kubectl exec <pod-name> -- printenv
```
### to login inside pod  
```
winpty kubectl exec -it -n <n-s> <pod> sh
```
### to delete all pods which are evicted with namespace wise
```
kubectl get pod -n <name-space> | grep Evicted | awk '{print $1}' | xargs kubectl delete pod -n <name-space>
```
### to get the pod definition
```
kubectl get pod pod-name -o yaml > pod.yaml
```
### to get pod definition possible options
```
kubectl explain pods --recursive | less
```
### to delete the pods which are Evicted State
```
kubectl get pod -n <namespace> | grep Evicted | awk '{print $1}' | xargs kubectl delete pod -n <name-space>
```
### to login into pod
```
winpty kubectl exec -it -n <namespace> <pod-name> sh 
```  
### to view logs from containers
```
kubectl exec <pod-name> -- cat /log/app.log
```
### to get the pod deatils with wide options
```
kubectl get pods -o wide
```
---
<a name="Nodes"></a>
## Nodes 
### to list nodes with the resource usage
```
kubectl top node
```
### to remove a taint from node
```
kubectl taint nodes node1 key1=value1:NoSchedule-
kubectl taint nodes node1 key1=value1:NoExecute-
kubectl taint nodes node1 key2=value2:NoSchedule-
```
### taint a node with key and value and taint effect
```
kubectl taint nodes node1 key1=value1:NoSchedule
kubectl taint nodes node1 key1=value1:NoExecute
kubectl taint nodes node1 key2=value2:NoSchedule
```
### mark node03 as unschedulable but do not remove any apps currently running on it .
```
kubectl cordon node03
```
### to drain the node01 (Empty the node of all applications and mark it unschedulable.)
```
kubectl drain node01 --ignore-daemonsets
```
### Configure the node to be schedulable again
```
kubectl uncordon node01
```

---

<a name="logs"></a>
## Logs
### to get the pod logs
```
kubectl -n <n-s> logs -f <pod> --tail=10
kubectl -n namespace-name logs pod-name
kubectl logs -n namespace container-name --since 10m
kubectl logs -n namespace container-name --tail=1000
kubectl logs --selector=run=hello-world --tail 1
```
### to get the pod logs for particular directory
```
kubectl -n elastic-stack exec -it app cat /log/app.log
kubectl logs myapp-pod -c init-myservice # Inspect the first init container
kubectl logs myapp-pod -c init-mydb      # Inspect the second init container
```
---

<a name="eksctl"></a>
## EKSCTL
### to switch the cluster 
There are 2 ways you can get the kubeconfig.
```
aws eks update-kubeconfig --name <clustername> --region <region>
eksctl utils write-kubeconfig --cluster=<clustername>
```  
### to create EKS cluster
```
eksctl create cluster --name eksrbac --node-type t2.large --nodes 1 --nodes-min 1 --nodes-max 2 --region us-east-1 --zones=us-east-1a,us-east-1b,us-east-1c
```
### to get EKS Cluster service
```
eksctl get cluster --name eksrbac --region us-east-1
```
### to get Node Group name  
```
eksctl get nodegroup --cluster=<clusterName>  
```
### to delete Node Group  
```
eksctl delete nodegroup --cluster=<clusterName> --name=<nodegroupName>
```
### to delete cluster
```
eksctl delete cluster --name eksrbac --region us-east-1
``` 
### Reference:  
1. https://mhausenblas.info/eksctl/usage/custom-ami-support/  
2. https://eksctl.io/usage/eks-managed-nodes/

---
<a name="awscli"></a>
## awscli
### to create IAM user and create access key
```
aws iam create-user --user-name rbac-user
aws iam create-access-key --user-name rbac-user
```
### to configure aws account
```
aws configure
```
### to check current user details on awscli
```
aws sts get-caller-identity
```

---
<a name="certs"></a>
## certs
### Decoce ca.crt using below two websites
https://www.base64decode.org/  
https://www.sslchecker.com/certdecoder

### Decode token using below two websites
https://www.base64decode.org/  
https://jwt.io/  

> [!NOTE]   
> Notice: I'm taking a break from blogging to focus on Atari Gamer . com, check it out!  
Base64 Encode or Decode on the command line without installing extra tools on Linux, Windows or macOS  
 26-Apr-2017  
Base64 encoding is used in quite a few places and there are many online web sites that let you encode or decode Base64. I am not very comfortable using such sites for security and privacy reasons so I went looking for alternative solutions. Whether you're using Linux, Windows or macOS you can use built-in tools to both encode or decode Base64 data. So ditch any online sites and start using software that is installed locally on your computer. Here's how.  

You will need to do all of this via the command line. Given you're already dealing with Base64 data I am going to assume you know how to bring that up on your operating system. Scroll down to the relevant section based on your OS below, also substitute your file names as appropriate.  

I am going to use .txt for the decoded data file extension and .b64 for the Base64 encoded file extension.  

Linux   
```
 Encode a data file to Base64  
base64 data.txt > data.b64

 Decode a Base64 file  
base64 -d data.b64 > data.txt
```

Windows 
```
 Encode a data file to Base64  
certutil -encode data.txt tmp.b64 && findstr /v /c:- tmp.b64 > data.b64

 Decode a Base64 file  
certutil -decode data.b64 data.txt
```

> [!NOTE]   
> Note: encoding with the above command will leave a temporary file, tmp.b64, on your file system. If you do not wish to have that file present simply add this to the end of the command: && del tmp.b64  



**macOS**  
```
 Encode a data file to Base64
base64 -i data.txt -o data.b64

 Decode a Base64 file
base64 -D -i data.b64 -o data.txt 
```

---
<a name="set_command"></a>
## Set Command
### to set the variables 
```
kubectl set image deployment/<deploy-name> <container-name>=<new-image-name>:version  
kubectl set image deployment/frontend simple-webapp=kodekloud/webapp-color:v2    
```
Set command help you make changes to existing application resources.  
Available Commands:  
  1. **env**              : Update environment variables on a pod template
  2. **image**            : Update the image of a pod template
  3. **resources**        : Update resource requests/limits on objects with pod templates
  4. **selector**         : Set the selector on a resource
  5. **serviceaccount**   : Update the service account of a resource
  6. **subject**          : Update the user, group, or service account in a role binding  
or cluster role binding  

---

<a name="rollout"></a>
## Rollout
### to rollout restart  
Created a new kubectl rollout restart command that does a rolling restart of a deployment.  
kubectl rollout restart now works for DaemonSets and StatefulSets.  
```
kubectl rollout restart deployment your_deployment_name
```
---

<a name="taint"></a>
## Taint
### to taint a node  
You add a taint to a node using kubectl taint. For example,  
```
kubectl taint nodes node1 key1=value1:NoSchedule
kubectl taint nodes node1 key1=value1:NoExecute
kubectl taint nodes node1 key2=value2:NoSchedule
```
places a taint on node node1. The taint has key key1, value value1, and taint effect NoSchedule. This means that no pod will be able to schedule onto node1 unless it has a matching toleration.  

To remove the taint added by the command above, you can run:  
```
kubectl taint nodes node1 key1=value1:NoSchedule-
kubectl taint nodes node1 key1=value1:NoExecute-
kubectl taint nodes node1 key2=value2:NoSchedule-
```
* if there is at least one un-ignored taint with effect NoSchedule then Kubernetes will not schedule the pod onto that node  
* if there is no un-ignored taint with effect NoSchedule but there is at least one un-ignored taint with effect PreferNoSchedule then Kubernetes will try to not schedule the pod onto the node  
* if there is at least one un-ignored taint with effect NoExecute then the pod will be evicted from the node (if it is already running on the node), and will not be scheduled onto the node (if it is not yet running on the node).  

---  

<a name="portforward"></a>
## Port Forward 
kubectl port-forward forwards connections to a local port to a port on a pod. Compared to kubectl proxy, kubectl port-forward is more generic as it can forward TCP traffic while kubectl proxy can only forward HTTP traffic.  

kubectl port-forward is useful for testing/debugging purposes so you can access your service locally without exposing it.  

```
kubectl port-forward <pod-name> localhostport:containerport
kubectl port-forward nginx-54bf6dc5f-2qtv5 81:80
```
OR
```
kubectl port-forward pod/<pod-name> localhostport:containerport
kubectl port-forward deployment/<deployment-name> localhostport:containerport
kubectl port-forward replicaset/<replicasetname-name> localhostport:containerport
kubectl port-forward service/<service-name> localhostport:containerport
```
Once the connection to local port to a port on pod happened, then we can test local connection using curl to the end point i.e. pod.

```
curl -X GET -s http://localhost:80/
curl -X GET -s http://localhost:80/_cluster/health  
```

---  

<a name="patch"></a>  
## Patch  
### patch with a file  
```
kubectl patch deployment <deployment-name> --patch-file patch-file.yaml  
```  
### patch file looks like:  
```
spec:
  template:
    spec:
      containers:
      - name: patch-demo-ctr-3
        image: gcr.io/google-samples/node-hello:1.0
```  

### patch with a value  
```
kubectl patch deployment <deployment-name> -p '{"metadata":{"finalizers":null}}'
```  

## Reference:  
https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands  
