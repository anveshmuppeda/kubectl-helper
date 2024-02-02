# Kubernetes Pod Fields explaination  

apiVersion:  
kind:   
metadata:  
  creationTimestamp:   
  labels:  
    run:   
  name:   
  namespace:   
  resourceVersion:   
  uid:   
spec:
  containers:  
  - image:   
    imagePullPolicy:   
    name:   
    resources:   
    terminationMessagePath:   
    terminationMessagePolicy:  
    volumeMounts:  
    - mountPath:   
      name:   
      readOnly:  
  dnsPolicy:  
  enableServiceLinks:  
  nodeName:  
  preemptionPolicy:  
  priority:  
  restartPolicy:  
  schedulerName:  
  securityContext:  
  serviceAccount:  
  serviceAccountName:  
  terminationGracePeriodSeconds:  
  tolerations:  
  - effect:  
    key:  
    operator:  
    tolerationSeconds:  
  volumes:  
  - name:  
    projected: 
      defaultMode:  
      sources: 
      - serviceAccountToken:  
          expirationSeconds:  
          path:  
      - configMap: 
          items: 
          - key:  
            path:  
          name:  
status:
  conditions:
  - lastProbeTime:  
    lastTransitionTime:  
    status:  
    type:  
  - lastProbeTime:  
    lastTransitionTime:  
    status:  
    type:  
  - lastProbeTime:  
    lastTransitionTime:  
    status:  
    type:  
  - lastProbeTime:  
    lastTransitionTime:  
    status:  
    type:  
  containerStatuses:
  - containerID:  
    image:  
    imageID:  
    lastState:  
    name:  
    ready:  
    restartCount:  
    started:  
    state:
      running:
        startedAt:  
  hostIP:  
  phase:  
  podIP:  
  podIPs:
  - ip:  
  qosClass:  
  startTime:  
