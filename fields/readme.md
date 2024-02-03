# Kubernetes Pod Fields explaination  

1. **apiVersion:** *The version of the Kubernetes API to use for this object.*  
2. **kind:** *The type of Resource.*   
3. **metadata:**  
4. &emsp;&emsp;**creationTimestamp:** *The timestamp when the resource was created.*   
5. &emsp;&emsp;**labels:** *Key-value pairs used to organize and select Pods.*  
6. &emsp;&emsp;&emsp;&emsp;**application:** *sample label*   
7. &emsp;&emsp;**name:** *The name of the Resource.*   
8. &emsp;&emsp;**namespace:** *The namespace to which the resource belongs.*   
9. &emsp;&emsp;**resourceVersion:** *An opaque value that represents the resource's version.*    
10. &emsp;&emsp;**uid:** *A unique identifier for the Resource.*   
11. **spec:**  
12. &emsp;&emsp;**containers:** *List of containers within the Pod.*  
13. &emsp;&emsp;-&emsp;&emsp;**image:** *The container image to run.*   
14. &emsp;&emsp;&emsp;&emsp;**imagePullPolicy:** *Policy for pulling the container image.*   
15. &emsp;&emsp;&emsp;&emsp;**name:** *The name of the container.*   
16. &emsp;&emsp;&emsp;&emsp;**resources:** *Resource constraints for the container.*   
17. &emsp;&emsp;&emsp;&emsp;**terminationMessagePath:** *The path where the container writes its termination message.*   
18. &emsp;&emsp;&emsp;&emsp;**terminationMessagePolicy:** *Policy for the termination message.*  
19. &emsp;&emsp;&emsp;&emsp;**volumeMounts:** *This is a list that defines the volume mounts for the container. Each item in the list represents a separate volume mount.* [More](#volemeMounts)  
20. &emsp;&emsp;&emsp;&emsp;-&emsp;&emsp;**mountPath:** *Specifies the path within the container where the volume should be mounted.*  
21. &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;**name:** *The name of the volume, which should match the name of a volume defined in the `volumes` section of the same pod specification.*   
22. &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;**readOnly:** A boolean flag indicating whether the volume should be mounted as read-only (`true`) or read-write (`false`).  
23. &emsp;&emsp;**dnsPolicy:** DNS resolution policy for the Pod.  
24. &emsp;&emsp;**enableServiceLinks:** If set, inject the service account's secret into Pod's environment.  
25. &emsp;&emsp;**nodeName:**  The node name where the Pod should run.  
26. &emsp;&emsp;**preemptionPolicy:** Indicates whether the Pod can be preempted.  
27. &emsp;&emsp;**priority:** Priority value for the Pod.  
28. &emsp;&emsp;**restartPolicy:** Restart policy for the containers in the Pod.  
29. &emsp;&emsp;**schedulerName:** Name of the scheduler to use for scheduling.  
30. &emsp;&emsp;**securityContext:** Security settings for the Pod.  
31. &emsp;&emsp;**serviceAccount:**  
32. &emsp;&emsp;**serviceAccountName:** Service account to associate with the Pod.  
33. &emsp;&emsp;**terminationGracePeriodSeconds:** Time given to containers to terminate gracefully.  
34. &emsp;&emsp;**tolerations:** List of tolerations for scheduling.  
35. &emsp;&emsp;-&emsp;&emsp;**effect:**   
36. &emsp;&emsp;&emsp;&emsp;**key:**  
37. &emsp;&emsp;&emsp;&emsp;**operator:**  
38. &emsp;&emsp;&emsp;&emsp;**tolerationSeconds:**  
39. &emsp;&emsp;**volumes:** List of volumes that can be mounted by containers.  
40. &emsp;&emsp;&emsp;-&emsp;**name:** *The name of the volume. This is used to reference the volume in other parts of the pod specification, such as in the `volumeMounts` section of a container.*  
41. &emsp;&emsp;&emsp;&emsp;**emptyDir:** *This field specifies an `emptyDir` volume type. An emptyDir volume is initially empty and is created when a Pod is assigned to a node. It can be used for temporary storage that is shared among containers in the same Pod.*   
42. &emsp;&emsp;&emsp;&emsp;**hostPath:** *Specifies a path on the host machine's filesystem. This volume type mounts a directory or file into a Pod.*   
43. &emsp;&emsp;&emsp;&emsp;**configMap:** *Mounts a ConfigMap as a volume. ConfigMaps are used to store configuration data as key-value pairs.*  
44. &emsp;&emsp;&emsp;&emsp;**secret:** *Mounts a Secret as a volume. Secrets are used to store sensitive information, such as passwords or API keys.*  
45. &emsp;&emsp;&emsp;&emsp;**persistentVolumeClaim:** *This allows you to use a PersistentVolumeClaim (PVC) as a volume. PVCs provide a way to request durable storage.*  
46. **status:**  
47. &emsp;&emsp;**conditions:** Conditions represent the latest available observations of the Pod's current state.  
48. &emsp;&emsp;- &emsp;&emsp;**lastProbeTime:** *This field typically contains the timestamp of the last time a probe was executed to check the condition.*   
49. &emsp;&emsp;&emsp;&emsp;**lastTransitionTime:** *This field usually holds the timestamp of the last time the condition transitioned from one status to another. It indicates when a change in the condition occurred.*  
50. &emsp;&emsp;&emsp;&emsp;**status:** *Represents the current status of the condition. It could be "True," "False," or "Unknown," indicating whether the condition is currently satisfied, not satisfied, or the status is unknown.*  
51. &emsp;&emsp;&emsp;&emsp;**type:** *Describes the type of condition. This field helps identify what aspect of the resource's status is being represented. For example, it might be related to readiness, liveness, or some other custom condition.*  
52. &emsp;&emsp;**containerStatuses:** The status of each container in the Pod.  
53. &emsp;&emsp;-&emsp;&emsp;**containerID:** *A unique identifier for the container instance. This ID is typically specific to the container runtime (like Docker).*  
54. &emsp;&emsp;&emsp;&emsp;**image:** *The image of the container.*  
55. &emsp;&emsp;&emsp;&emsp;**imageID:** *A unique identifier for the container image. Like `containerID`, it's specific to the container runtime.*  
56. &emsp;&emsp;&emsp;&emsp;**lastState:** *Information about the previous state of the container before the current status.*  
57. &emsp;&emsp;&emsp;&emsp;**name:** *The name of the container as defined in the pod specification.*  
58. &emsp;&emsp;&emsp;&emsp;**ready:** *Indicates whether the container is in a ready state. It's usually a boolean value ("true" or "false").*  
59. &emsp;&emsp;&emsp;&emsp;**restartCount:** *The number of times the container has been restarted.*  
60. &emsp;&emsp;&emsp;&emsp;**started:** *ndicates whether the container has started. It's usually a boolean value ("true" or "false").*  
61. &emsp;&emsp;&emsp;&emsp;**state:** *Describes the current state of the container. In the provided example, it's indicating that the container is in the "running" state.*  
62. &emsp;&emsp;&emsp;&emsp;&emsp;**running:** *Describes the container state when it's currently running.*  
63. &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;**startedAt:** *Timestamp indicating when the container started running*  
64. &emsp;&emsp;**hostIP:** IP address of the host to which the Pod is assigned.  
65. &emsp;&emsp;**phase:** The current phase of the Pod (Pending, Running, Succeeded, Failed, Unknown).  
66. &emsp;&emsp;**podIP:** *The IP address assigned to the Pod.*  
67. &emsp;&emsp;**podIPs:** *A list of IP addresses assigned to the pod. It's common to have only one IP address in this list, but in certain scenarios (e.g., pods with multiple network interfaces), there might be more than one.*  
68. &emsp;&emsp;-&emsp;**ip:** *The actual IP address assigned to the pod.*   
69. &emsp;&emsp;**qosClass:** *Quality of Service class assigned to the Pod.* 
70. &emsp;&emsp;**startTime:** *Timestamp when the Pod was started.*  


## More information about fields:  
<a name="volemeMounts"></a>   
19. **volumeMounts** : This is a list that defines the volume mounts for the container. Each item in the list represents a separate volume mount.