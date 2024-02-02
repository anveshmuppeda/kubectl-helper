# Kubernetes Pod Fields explaination  

apiVersion:  
kind:   
metadata:  
&emsp;&emsp;creationTimestamp:   
&emsp;&emsp;labels:  
&emsp;&emsp;&emsp;&emsp;run:   
&emsp;&emsp;name:   
&emsp;&emsp;namespace:   
&emsp;&emsp;resourceVersion:   
&emsp;&emsp;uid:   
spec:
&emsp;&emsp;containers:  
&emsp;&emsp;- image:   
&emsp;&emsp;&emsp;&emsp;imagePullPolicy:   
&emsp;&emsp;&emsp;&emsp;name:   
&emsp;&emsp;&emsp;&emsp;resources:   
&emsp;&emsp;&emsp;&emsp;terminationMessagePath:   
&emsp;&emsp;&emsp;&emsp;terminationMessagePolicy:  
&emsp;&emsp;&emsp;&emsp;volumeMounts:  
&emsp;&emsp;&emsp;&emsp;- mountPath:   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;name:   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;readOnly:  
&emsp;&emsp;dnsPolicy:  
&emsp;&emsp;enableServiceLinks:  
&emsp;&emsp;nodeName:  
&emsp;&emsp;preemptionPolicy:  
&emsp;&emsp;priority:  
&emsp;&emsp;restartPolicy:  
&emsp;&emsp;schedulerName:  
&emsp;&emsp;securityContext:  
&emsp;&emsp;serviceAccount:  
&emsp;&emsp;serviceAccountName:  
&emsp;&emsp;terminationGracePeriodSeconds:  
&emsp;&emsp;tolerations:  
&emsp;&emsp;- effect:  
&emsp;&emsp;&emsp;&emsp;key:  
&emsp;&emsp;&emsp;&emsp;operator:  
&emsp;&emsp;&emsp;&emsp;tolerationSeconds:  
&emsp;&emsp;volumes:  
&emsp;&emsp;- name:  
&emsp;&emsp;&emsp;&emsp;projected: 
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;defaultMode:  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;sources: 
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;- serviceAccountToken:  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;expirationSeconds:  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;path:  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;- configMap: 
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;items: 
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;- key:  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;path:  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;name:  
status:
&emsp;&emsp;conditions:
&emsp;&emsp;- lastProbeTime:  
&emsp;&emsp;&emsp;&emsp;lastTransitionTime:  
&emsp;&emsp;status:  
&emsp;&emsp;type:  
&emsp;&emsp;- lastProbeTime:  
&emsp;&emsp;lastTransitionTime:  
&emsp;&emsp;status:  
&emsp;&emsp;type:  
&emsp;&emsp;- lastProbeTime:  
&emsp;&emsp;lastTransitionTime:  
&emsp;&emsp;status:  
&emsp;&emsp;type:  
&emsp;&emsp;- lastProbeTime:  
&emsp;&emsp;lastTransitionTime:  
&emsp;&emsp;status:  
&emsp;&emsp;type:  
&emsp;&emsp;containerStatuses:
&emsp;&emsp;- containerID:  
&emsp;&emsp;image:  
&emsp;&emsp;imageID:  
&emsp;&emsp;lastState:  
&emsp;&emsp;name:  
&emsp;&emsp;ready:  
&emsp;&emsp;restartCount:  
&emsp;&emsp;started:  
&emsp;&emsp;state:
&emsp;&emsp;  running:
&emsp;&emsp;&emsp;&emsp;startedAt:  
&emsp;&emsp;hostIP:  
&emsp;&emsp;phase:  
&emsp;&emsp;podIP:  
&emsp;&emsp;podIPs:
&emsp;&emsp;- ip:  
&emsp;&emsp;qosClass:  
&emsp;&emsp;startTime:  
