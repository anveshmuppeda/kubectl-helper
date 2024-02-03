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
&emsp;&emsp;- **image:** *The container image to run.*   
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
&emsp;&emsp;- **name:**  
&emsp;&emsp;&emsp;&emsp;**projected:**  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;**defaultMode:**  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;**sources:**  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;- **serviceAccountToken:**  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;**expirationSeconds:**  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;**path:**  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;- **configMap:**  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;**items:**  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;- **key:**  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;**path:**  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;**name:**  
**status:**  
&emsp;&emsp;**conditions:** Conditions represent the latest available observations of the Pod's current state.  
&emsp;&emsp;- **lastProbeTime:**   
&emsp;&emsp;&emsp;&emsp;**lastTransitionTime:**  
&emsp;&emsp;**status:**  
&emsp;&emsp;**type:**  
&emsp;&emsp;**containerStatuses:** The status of each container in the Pod.  
&emsp;&emsp;- **containerID:**  
&emsp;&emsp;**image:**  
&emsp;&emsp;**imageID:**  
&emsp;&emsp;**lastState:**  
&emsp;&emsp;**name:**  
&emsp;&emsp;**ready:**  
&emsp;&emsp;**restartCount:**  
&emsp;&emsp;**started:**  
&emsp;&emsp;**state:**  
&emsp;&emsp;  **running:**  
&emsp;&emsp;&emsp;&emsp;**startedAt:**  
&emsp;&emsp;**hostIP:** IP address of the host to which the Pod is assigned.  
&emsp;&emsp;**phase:** The current phase of the Pod (Pending, Running, Succeeded, Failed, Unknown).  
&emsp;&emsp;**podIP:** The IP address assigned to the Pod.  
&emsp;&emsp;**podIPs:** The IP addresses assigned to the Pod.  
&emsp;&emsp;- **ip:**   
&emsp;&emsp;**qosClass:** Quality of Service class assigned to the Pod.  
&emsp;&emsp;**startTime:** Timestamp when the Pod was started.  
