# Welcome to Kubectl cheatsheet [![GitHub](https://img.shields.io/github/license/anveshmuppeda/kubectl-helper?color=blue)](https://github.com/anveshmuppeda/kubectl-helper/blob/main/LICENSE)  
<p align="center">  
By Anvesh Muppeda & Sai Manasa Kota  
</p>   
<a name="tableofcontents"></a>  

## Table of Contents   
1. [ Cluster ⎈ ](#Cluster)
2. [ Switching Between Contexts ⇢ ](#SwitchingBetweenContexts)
3. [ Rollout ↩︎ ](#rollouts)
4. [ Labels 🏷️ ](#Labels )
5. [ Pod 📦 ](#Pod)
6. [ Nodes 💻 ](#Nodes) 
7. [ Logs ⎏ ](#Logs) 
8. [ Secrets Encode & Decode 🕵️ ](#certs)
11. [ Set ](#set_command)
12. [ Rollout ](#rollout)
13. [ Taint ](#taint)
14. [ Port Forward ](#portforward)
15. [ Patch ](#patch)  
16. [ Blogs ](#blogs)

---
<a name="Cluster"></a>  

## 1. Cluster  

  ### a. Listing all the resources in cluster
  ```sh
  kubectl api-resources
  ```  

  ### b. Listing all the api versions in cluster
  ```sh
  kubectl api-versions
  ```  

  ### c. Get the configurations of saved clusters  
  To get more information about config view click here.
  ```sh
  kubectl config view
  ```

  ### d. Get the Kubernetes version running on the client and server  
  ```sh
  kubectl version
  ```

  ### e. Get everything from the cluster  
  ```sh
  kubectl get all --all-namespaces
  ```  
---   
<p align="center">
  <a href="#tableofcontents">Go to Top ▲</a>
</p>

<a name="SwitchingBetweenContexts"></a>  

## 2. Switching between contexts  

  ### a. Get all preconfigured contexts and see which one is active:  
  ```sh
  kubectl config get-contexts
  ```  

  ### b. Get the current config name
  ```sh
  kubectl config current-context
  ```  

  ### c. Get the current config with more details
  ```sh
  kubectl config view --minify
  ```  

  ### d. Switch between the predefined contexts(Switch to a context/cluster)  
  ```sh
  kubectl config use-context <context-name>
  ```  

  ### e. Setting default namespace 
  The default namespace **default** is configured in your cluster's context. To change the default namespace, use the below command. Specify the desired namespace name that you want to set as the default.  
  ```sh
  kubectl config set-context --current --namespace=<NAMESPACE-NAME>
  ```  
  For example, to set the namespace kube-system as your default, you would run the following command  
  ```sh
  kubectl config set-context --current --namespace=kube-system
  ```  
---  
<p align="center">
  <a href="#tableofcontents">Go to Top ▲</a>
</p> 
<a name="rollouts"></a>  

## 3. Rollout  
The `kubectl rollout` command is primarily used with Kubernetes **Deployments**, **Statefulsets** and **DaemonSets**.  

  ### a. kubectl rollout syntax  
  ```sh 
  kubectl rollout <COMMAND> 
  ```  
  **COMMAND** can be one of the following:  
  1. status  
  2. history  
  3. restart  
  4. pause  
  5. resume  
  6. undo  

  ### b. To check the rollout status  
 ```sh
  kubectl rollout status <resource-type>/<resource-name>
  ```  

  ### c. To get the rollout history  
  ```sh
  kubectl rollout status <resource-type>/<resource-name>
  ```  

  ### d. To restart the deployment  
  ```sh 
  kubectl restart status <resource-type>/<resource-name> 
  ```  
  
  ### e. To pause the deployment updates  
  ```sh 
  kubectl rollout pause <resource-type>/<resource-name>
  ```  

  ### f. To resume the deployment updates  
  ```sh
  kubectl rollout resume <resource-type>/<resource-name>
  ```  

  ### g. To undo the deployment updates to previous revision  
  ```sh
  kubectl rollout undo <resource-type>/<resource-name>
  ```   
  > [!TIP]  
  > Here you can use **Deployments**, **Statefulsets** and **DaemonSets** in place of <resource-type>.

---
<p align="center">
  <a href="#tableofcontents">Go to Top ▲</a>
</p>  
<a name="Labels"></a>  

## 4. Labels  

  ### a. Adding a label to a specific resource  
  ```bash
  kubectl label <resource-type> <resource-name> <label-key>=<label-value>
  ```
  ### b. Removing a label to a specific resource
  ```bash
  kubectl label <resource-type> <resource-name> <label-key>-
  ```
  ### c. List all the labels from a resource  
  ```bash
  kubectl get <resource-type> <resource-name> --show-labels 
  ```  
  ### d. Overwrite the resource label  
  ```bash
  kubectl label --overwrite <resource-type> <resource-name> <label-key>=<label-new-value>  
  ```  

---  
<p align="center">
  <a href="#tableofcontents">Go to Top ▲</a>
</p>  
<a name="Pod"></a>

## 5. Pod  
  ### a. To list the pods in specific namespace  
  ```bash 
  kubectl get pods -n <namespace> 
  ```  
  ### b. To list all pods in all namespaces  
  ```bash  
  kubectl get pods -A
  ```  
  ### c. Exec into a pod  
  ##### bash 
  ```bash 
  kubectl -n <namespace> exec -it <pod-name> //bin//bash
  ```  
  ##### sh  
  ```sh 
  kubectl -n <namespace> exec -it <pod-name> //bin//sh
  ```  
  #### In windows   
  ##### bash 
  ```bash
  winpty kubectl -n <namespace> exec -it <pod-name> //bin//bash
  ```  
  ##### sh  
  ```sh
  winpty kubectl -n <namespace> exec -it <pod-name> //bin//sh
  ```  
  ### d. Watch a pod status 
  ```sh
  kubectl -n <namespace> get <pods/deployments>  -w
  kubectl -n <namespace> get <pods/deployments> --watch
  ```  
  ### e. Print env variables of a pod
  ```bash
  kubectl -n <namespace> exec <pod-name> -- printenv
  ```

  ### f. To make a curl to a pod  
  ##### sh
  ```sh 
  kubectl -n <namespace> exec -it <pod-name> -- /bin/sh -c "curl http://example.com"
  ``` 
  ##### bash  
  ```bash 
  kubectl -n <namespace> exec -it <pod-name> -- /bin/bash -c "curl http://example.com"
  ```

  ### g. Delete all pods which are evicted with namespace wise  
  ```bash
  kubectl get pod -n <namespace> | grep Evicted | awk '{print $1}' | xargs kubectl delete pod -n <namespace>
  ```
  ### h. To get the pod definition in YAML format  
  ```bash
  kubectl -n <namespace> get pod pod-name -o yaml > pod.yaml
  ```
  ### i. To get pod definition possible options  
  ```bash
  kubectl explain pods --recursive | less
  ``` 
  ### j. Get the pod deatils with wide options
  ```bash
  kubectl get pods -o wide
  ```  
  ### k. View detailed information about a pod  
  ```bash 
  kubectl -n <namespace> describe pod <podname>
  ```  
  ### l. Create or apply a pod configuration  
  ```bash 
  kubectl -n <namespace> apply -f <pod-definition.yaml>
  ```  
  ### m. Delete a pod  
  #### Delete a specific pod  
  ```bash 
  kubectl -n <namespace> delete pod <pod-name>
  ``` 
  #### Delete all pods  
  ```bash
  kubectl -n <namespace> delete pods --all
  ```  
  ### n. Execute a command in a running pod  
  ```bash
  kubectl exec -it <pod-name> -- <command> 
  ```
  ### o. Copy files to/from a pod  
  #### Copy a file from your local machine to a pod  
  ```bash
  kubectl -n <namespace> cp <local-file> <pod-name>:<destination-path>
  ```  
  #### Copy a file from a pod to your local machine  
  ```bash 
  kubectl -n <namespace> cp <pod-name>:<source-path> <local-destination>
  ```  
  ### p. Get pod events  
  ```bash  
  kubectl get events 
  ```  
  ### q. Get resource usage  
  ```bash 
  kubectl -n <namespace> top pod
  ```  
---
<p align="center">
  <a href="#tableofcontents">Go to Top ▲</a>
</p>  

<a name="Nodes"></a>

## 6. Nodes 
  ### a. List nodes  
  ```bash
  kubectl get pods 
  ```  
  ### b. List nodes with the resource usage
  ```bash
  kubectl top node
  ```  
  ### c. Get node details  
  ```bash
  kubectl describe node <nodename>
  ```  
  ### d. Cordon a node  
  Mark a node as unschedulable, preventing new pods from being scheduled. 
  ```bash 
  kubectl cordon node <nodename> 
  ```
  ### e. Uncordon a node  
  Mark a node as schedulable, allowing new pods to be scheduled.  
  ```bash
  kubectl uncordon node <nodename>
  ```  
  ### f. Drain Nodes  
  Evict pods from a node, moving them to other nodes. The `--ignore-daemonsets` flag is used to ignore DaemonSet managed pods.  
  ```bash 
  kubectl drain <nodename> --ignore-daemonsets
  ```  
  ### g. Get the kubelet version for a specific node.  
  ```bash
  kubectl get node <nodename> -o jsonpath='{.status.nodeInfo.kubeletVersion}
  ``` 

---
<p align="center">
  <a href="#tableofcontents">Go to Top ▲</a>
</p>  
<a name="logs"></a> 

## 7. Logs
  ### Get logs from a pod 
  ```bash
  kubectl -n <namespace> logs <podname>
  ```  
  ### Stream Logs in Real-time  
  ```bash 
  kubectl -n <namespace> -f logs <podname> 
  ``` 
  ### Specify Container in Multi-container Pods
  ```bash 
  kubectl -n <namespace> logs <podname> -c <containerName>  
  ``` 
  ### Retrieve Previous Container Logs  
  ```bash 
  kubectl -n <namespace> logs --previous <pod-name>
  ``` 
  ### Tail the Logs with a Specific Number of Lines  
  ```bash
  kubectl logs <pod-name> --tail=<lines>
  ```  
  ### Filter the logs based on a time window  
  ```bash
  kubectl logs --since=<time-period> <pod-name>
  ```  
  > [!TIP]  
  > Here you can mention **10s**, **10m**, **10h**, and **10d** in place of <time-period>(Just an exmaple). 
  ### Add timestamps in the Logs  
  ```bash 
  kubectl -n <namespace> logs <pod-name> --timestamps  
  ```  
  ### Deployment, Statefulset, Daemonset, and Job logs 
  ```bash
  kubectl -n <namespace> logs <resource-type>/<resource-name> 
  ``` 
  > [!TIP]  
  > Here you can use **Deployments**, **Statefulsets**, **DaemonSets**, and **Jobs** in place of <resource-type>. 
---

<p align="center">
  <a href="#tableofcontents">Go to Top ▲</a>
</p>  


<a name="certs"></a>

## certs  
  ### Encode your secret  
  ```bash
  echo -n 'your-secret' | base64
  ```  
  ### Decode your secret  
  ```bash
  echo -n 'your-string' | base64 --decode
  ```  
--- 
<p align="center">
  <a href="#tableofcontents">Go to Top ▲</a>
</p>  
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
<p align="center">
  <a href="#tableofcontents">Go to Top ▲</a>
</p>  
<a name="rollout"></a>
## Rollout
### to rollout restart  
Created a new kubectl rollout restart command that does a rolling restart of a deployment.  
kubectl rollout restart now works for DaemonSets and StatefulSets.  
```
kubectl rollout restart deployment your_deployment_name
```
---
<p align="center">
  <a href="#tableofcontents">Go to Top ▲</a>
</p>  
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
<p align="center">
  <a href="#tableofcontents">Go to Top ▲</a>
</p>  
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
<p align="center">
  <a href="#tableofcontents">Go to Top ▲</a>
</p>  
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

---  
<p align="center">
  <a href="#tableofcontents">Go to Top ▲</a>
</p>  
<a name="blog"></a>    

## [1. Exploring Container Types in Kubernetes: Beyond Init and Sidecar Containers](https://medium.com/@muppedaanvesh/exploring-container-types-in-kubernetes-beyond-init-and-sidecar-containers-3c1001bb7a85) 🔗

---

### decode and encode of data for k8's to use in secrets
```sh
echo -n "anvesh" | base64
echo -n "" | base64 --decode
```
### to Check Access  
```sh
kuebctl auth can-i create deployments
kubectl auth can-i create pods
```
### to check IP range for pods within the namespaces
```sh
kubectl cluster-info dump | grep -m 1 cluster-cidr
```  