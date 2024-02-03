# Kubernetes Pod Fields explaination  

**apiVersion:** *The version of the Kubernetes API to use for this object.*  
**kind:** *The type of Resource.*   
**metadata:**  
&emsp;&emsp;**creationTimestamp:** *The timestamp when the resource was created.*   
&emsp;&emsp;**labels:** *Key-value pairs used to organize and select Pods.*  
&emsp;&emsp;&emsp;&emsp;**application:** *sample label*   
&emsp;&emsp;**name:** *The name of the Resource.*   
&emsp;&emsp;**namespace:** *The namespace to which the resource belongs.*   
&emsp;&emsp;**resourceVersion:** *An opaque value that represents the resource's version.*    
&emsp;&emsp;**uid:** *A unique identifier for the Resource.*   
**spec:**  
&emsp;&emsp;**containers:** *List of containers within the Pod.*  
&emsp;&emsp;-&emsp;&emsp;**image:** *The container image to run.*   
&emsp;&emsp;&emsp;&emsp;**imagePullPolicy:** *Policy for pulling the container image.*   
&emsp;&emsp;&emsp;&emsp;**name:** *The name of the container.*   
&emsp;&emsp;&emsp;&emsp;**resources:** *Resource constraints for the container.*   
&emsp;&emsp;&emsp;&emsp;**terminationMessagePath:** *The path where the container writes its termination message.*   
&emsp;&emsp;&emsp;&emsp;**terminationMessagePolicy:** *Policy for the termination message.*  
&emsp;&emsp;&emsp;&emsp;**volumeMounts:** *This is a list that defines the volume mounts for the container. Each item in the list represents a separate volume mount.*  
&emsp;&emsp;&emsp;&emsp;- **mountPath:** *Specifies the path within the container where the volume should be mounted.*  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;**name:** *The name of the volume, which should match the name of a volume defined in the `volumes` section of the same pod specification.*   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;**readOnly:** A boolean flag indicating whether the volume should be mounted as read-only (`true`) or read-write (`false`).  
&emsp;&emsp;**dnsPolicy:** DNS resolution policy for the Pod.  
&emsp;&emsp;**enableServiceLinks:** If set, inject the service account's secret into Pod's environment.  
&emsp;&emsp;**nodeName:**  The node name where the Pod should run.  
&emsp;&emsp;**preemptionPolicy:** Indicates whether the Pod can be preempted.  
&emsp;&emsp;**priority:** Priority value for the Pod.  
&emsp;&emsp;**restartPolicy:** Restart policy for the containers in the Pod.  
&emsp;&emsp;**schedulerName:** Name of the scheduler to use for scheduling.  
&emsp;&emsp;**securityContext:** Security settings for the Pod.  
&emsp;&emsp;**serviceAccount:**  
&emsp;&emsp;**serviceAccountName:** Service account to associate with the Pod.  
&emsp;&emsp;**terminationGracePeriodSeconds:** Time given to containers to terminate gracefully.  
&emsp;&emsp;**tolerations:** List of tolerations for scheduling.  
&emsp;&emsp;- **effect:**   
&emsp;&emsp;&emsp;&emsp;**key:**  
&emsp;&emsp;&emsp;&emsp;**operator:**  
&emsp;&emsp;&emsp;&emsp;**tolerationSeconds:**  
&emsp;&emsp;**volumes:** List of volumes that can be mounted by containers.  
&emsp;&emsp;&emsp;-  **name:** *The name of the volume. This is used to reference the volume in other parts of the pod specification, such as in the `volumeMounts` section of a container.*  
&emsp;&emsp;&emsp;**emptyDir:** *This field specifies an `emptyDir` volume type. An emptyDir volume is initially empty and is created when a Pod is assigned to a node. It can be used for temporary storage that is shared among containers in the same Pod.*   
&emsp;&emsp;&emsp;**hostPath:** *Specifies a path on the host machine's filesystem. This volume type mounts a directory or file into a Pod.*   
&emsp;&emsp;&emsp;**configMap:** *Mounts a ConfigMap as a volume. ConfigMaps are used to store configuration data as key-value pairs.*  
&emsp;&emsp;&emsp;**secret:** *Mounts a Secret as a volume. Secrets are used to store sensitive information, such as passwords or API keys.*  
&emsp;&emsp;&emsp;**persistentVolumeClaim:** *This allows you to use a PersistentVolumeClaim (PVC) as a volume. PVCs provide a way to request durable storage.*  
**status:**  
&emsp;&emsp;**conditions:** Conditions represent the latest available observations of the Pod's current state.  
&emsp;&emsp;- **lastProbeTime:** *This field typically contains the timestamp of the last time a probe was executed to check the condition.*   
&emsp;&emsp;&emsp;&emsp;**lastTransitionTime:** *This field usually holds the timestamp of the last time the condition transitioned from one status to another. It indicates when a change in the condition occurred.*  
&emsp;&emsp;**status:** *Represents the current status of the condition. It could be "True," "False," or "Unknown," indicating whether the condition is currently satisfied, not satisfied, or the status is unknown.*  
&emsp;&emsp;**type:** *Describes the type of condition. This field helps identify what aspect of the resource's status is being represented. For example, it might be related to readiness, liveness, or some other custom condition.*  
&emsp;&emsp;**containerStatuses:** The status of each container in the Pod.  
&emsp;&emsp;- **containerID:** *A unique identifier for the container instance. This ID is typically specific to the container runtime (like Docker).*  
&emsp;&emsp;**image:** *The image of the container.*  
&emsp;&emsp;**imageID:** *A unique identifier for the container image. Like `containerID`, it's specific to the container runtime.*  
&emsp;&emsp;**lastState:** *Information about the previous state of the container before the current status.*  
&emsp;&emsp;**name:** *The name of the container as defined in the pod specification.*  
&emsp;&emsp;**ready:** *Indicates whether the container is in a ready state. It's usually a boolean value ("true" or "false").*  
&emsp;&emsp;**restartCount:** *The number of times the container has been restarted.*  
&emsp;&emsp;**started:** *ndicates whether the container has started. It's usually a boolean value ("true" or "false").*  
&emsp;&emsp;**state:** *Describes the current state of the container. In the provided example, it's indicating that the container is in the "running" state.*  
&emsp;&emsp;  **running:** *Describes the container state when it's currently running.*  
&emsp;&emsp;&emsp;&emsp;**startedAt:** *Timestamp indicating when the container started running.*  
&emsp;&emsp;**hostIP:** IP address of the host to which the Pod is assigned.  
&emsp;&emsp;**phase:** The current phase of the Pod (Pending, Running, Succeeded, Failed, Unknown).  
&emsp;&emsp;**podIP:** *The IP address assigned to the Pod.*  
&emsp;&emsp;**podIPs:** *A list of IP addresses assigned to the pod. It's common to have only one IP address in this list, but in certain scenarios (e.g., pods with multiple network interfaces), there might be more than one.*  
&emsp;&emsp;- **ip:** *The actual IP address assigned to the pod.*   
&emsp;&emsp;**qosClass:** *Quality of Service class assigned to the Pod.* 
&emsp;&emsp;**startTime:** *Timestamp when the Pod was started.*  
